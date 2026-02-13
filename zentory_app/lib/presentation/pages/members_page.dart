import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:zentory_app/core/theme/app_design.dart';
import 'package:zentory_app/core/di/injection.dart';
import 'package:zentory_app/presentation/widgets/zentory_empty_state.dart';
import 'package:zentory_app/presentation/widgets/zentory_dialogs.dart';
import 'package:zentory_app/presentation/widgets/zentory_card.dart';
import 'package:zentory_app/presentation/widgets/zentory_badge.dart';
import 'package:zentory_app/core/workspace_role.dart';
import 'package:zentory_app/presentation/blocs/members_bloc.dart';
import 'package:zentory_app/l10n/app_localizations.dart';
import 'package:zentory_app/domain/entities/member.dart';

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
        body: BlocBuilder<MembersBloc, MembersState>(
          builder: (context, state) {
            return state.when(
              initial: () => const Center(child: CircularProgressIndicator()),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (message) {
                final l10n = L10n.of(context)!;
                return Center(child: Text('${l10n.error}: $message'));
              },
              loaded: (members) {
                final l10n = L10n.of(context)!;
                if (members.isEmpty) {
                  return ZentoryEmptyState(
                    title: l10n.noMembers,
                    description: l10n.noMembersDesc,
                    icon: LucideIcons.users,
                  );
                }
                return ListView.builder(
                  padding: EdgeInsets.all(AppDesign.paddingM),
                  itemCount: members.length,
                  itemBuilder: (context, index) {
                    return _buildMemberCard(context, members[index]);
                  },
                );
              },
            );
          },
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
    final l10n = L10n.of(context)!;
    final emailController = TextEditingController();
    final roleController =
        TextEditingController(text: WorkspaceRole.member.displayName);
    WorkspaceRole selectedRole = WorkspaceRole.member;

    ZentoryDialogs.showCustomDialog(
      context: context,
      title: l10n.inviteMember,
      child: StatefulBuilder(
        builder: (context, setState) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: l10n.email,
                hintText: l10n.emailHint,
                prefixIcon: Icon(
                  LucideIcons.mail,
                ),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: AppDesign.spaceL),
            DropdownMenu<WorkspaceRole>(
              controller: roleController,
              initialSelection: selectedRole,
              label: Text(l10n.role),
              leadingIcon: Icon(LucideIcons.shield, size: AppDesign.fontM),
              dropdownMenuEntries: WorkspaceRole.values
                  .map(
                    (role) => DropdownMenuEntry<WorkspaceRole>(
                      value: role,
                      label: role.displayName,
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
          child: Text(l10n.cancel),
        ),
        SizedBox(width: AppDesign.spaceS),
        ElevatedButton(
          onPressed: () {
            if (emailController.text.contains('@')) {
              bloc.add(
                MembersEvent.memberInvited(
                  workspaceId: workspaceId,
                  email: emailController.text.trim(),
                  role: selectedRole.displayName,
                ),
              );
              Navigator.pop(context);
            }
          },
          child: Text(l10n.sendInvitation),
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
          backgroundColor:
              Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
          child: Text(
            member.name.substring(0, 1).toUpperCase(),
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
        ),
        title: Text(
          member.name,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        subtitle: Text(member.email),
        trailing: ZentoryBadge(
          label: member.role,
          color: _getRoleColor(member.role),
        ),
      ),
    );
  }

  Color _getRoleColor(String role) {
    switch (role.toLowerCase()) {
      case 'administrador':
      case 'propietario':
        return AppDesign.accent;
      case 'editor':
        return AppDesign.info;
      case 'lector':
        return AppDesign.secondary;
      default:
        return AppDesign.success;
    }
  }
}
