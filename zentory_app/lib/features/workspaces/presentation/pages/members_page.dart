import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:zentory_app/core/theme/app_design.dart';
import 'package:zentory_app/core/di/injection.dart';
import 'package:zentory_app/core/widgets/zentory_ui_components.dart';
import 'package:zentory_app/features/workspaces/domain/entities/member.dart';
import 'package:zentory_app/features/workspaces/presentation/bloc/members_bloc.dart';

@RoutePage()
class MembersPage extends StatelessWidget {
  final String workspaceId;

  const MembersPage({super.key, required this.workspaceId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<MembersBloc>()..add(MembersEvent.membersFetched(workspaceId)),
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Column(
          children: [
            const ZentoryHeader(
              title: 'Equipo',
              subtitle: 'Gestión de miembros',
            ),
            Expanded(
              child: BlocBuilder<MembersBloc, MembersState>(
                builder: (context, state) {
                  return state.when(
                    initial: () =>
                        const Center(child: CircularProgressIndicator()),
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    error: (message) => Center(child: Text('Error: $message')),
                    loaded: (members) {
                      if (members.isEmpty) {
                        return const ZentoryEmptyState(
                          title: 'Sin miembros',
                          description:
                              'Invita a tu equipo para empezar a colaborar.',
                          icon: LucideIcons.users,
                        );
                      }
                      return ListView.builder(
                        padding: EdgeInsets.all(AppDesign.paddingM),
                        itemCount: members.length,
                        itemBuilder: (context, index) {
                          final member = members[index];
                          return _buildMemberCard(context, member);
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: Builder(
          builder: (context) {
            return FloatingActionButton(
              onPressed: () => _showInviteDialog(
                context,
                context.read<MembersBloc>(),
              ),
              child: const Icon(LucideIcons.userPlus),
            );
          },
        ),
      ),
    );
  }

  void _showInviteDialog(BuildContext context, MembersBloc bloc) {
    final emailController = TextEditingController();
    final roleController = TextEditingController(text: 'Miembro');
    String selectedRole = 'Miembro';

    ZentoryDialogs.showCustomDialog(
      context: context,
      title: 'Invitar Miembro',
      child: StatefulBuilder(
        builder: (context, setState) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Correo electrónico',
                hintText: 'ejemplo@correo.com',
                prefixIcon: Icon(
                  LucideIcons.mail,
                  size: AppDesign.fontL,
                ),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: AppDesign.spaceL),
            DropdownMenu<String>(
              controller: roleController,
              initialSelection: selectedRole,
              width: 320, // Adjusted width for dialog consistency
              label: const Text('Rol'),
              leadingIcon: const Icon(LucideIcons.shield, size: 20),
              dropdownMenuEntries:
                  ['Administrador', 'Editor', 'Miembro', 'Lector']
                      .map(
                        (role) => DropdownMenuEntry<String>(
                          value: role,
                          label: role,
                        ),
                      )
                      .toList(),
              onSelected: (value) {
                if (value != null) {
                  setState(() => selectedRole = value);
                }
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancelar'),
        ),
        SizedBox(width: AppDesign.spaceS),
        ElevatedButton(
          onPressed: () {
            if (emailController.text.contains('@')) {
              bloc.add(
                MembersEvent.memberInvited(
                  workspaceId: workspaceId,
                  email: emailController.text.trim(),
                  role: selectedRole,
                ),
              );
              Navigator.pop(context);
            }
          },
          child: const Text('Enviar Invitación'),
        ),
      ],
    );
  }

  Widget _buildMemberCard(BuildContext context, MemberEntity member) {
    return ZentoryCard(
      margin: EdgeInsets.only(bottom: AppDesign.spaceS),
      padding: EdgeInsets.zero,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(
          horizontal: AppDesign.paddingM,
          vertical: AppDesign.paddingS,
        ),
        leading: CircleAvatar(
          backgroundColor: Theme.of(
            context,
          ).colorScheme.primary.withValues(alpha: 0.1),
          child: Text(
            member.name.substring(0, 1).toUpperCase(),
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(
          member.name,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: AppDesign.fontM,
              ),
        ),
        subtitle: Text(member.email),
        trailing: Container(
          padding: EdgeInsets.symmetric(
            horizontal: AppDesign.paddingS,
            vertical: 4,
          ),
          decoration: BoxDecoration(
            color: _getRoleColor(member.role).withValues(alpha: 0.1),
            borderRadius: AppDesign.borderSmall,
          ),
          child: Text(
            member.role,
            style: TextStyle(
              color: _getRoleColor(member.role),
              fontSize: AppDesign.fontXS,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Color _getRoleColor(String role) {
    switch (role.toLowerCase()) {
      case 'administrador':
      case 'propietario':
        return Colors.purple;
      case 'editor':
        return Colors.blue;
      case 'lector':
        return Colors.grey;
      default:
        return Colors.green;
    }
  }
}
