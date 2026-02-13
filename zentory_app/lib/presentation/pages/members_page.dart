import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:zentory_app/core/theme/app_design.dart';
import 'package:zentory_app/core/di/injection.dart';
import 'package:zentory_app/common/widgets/zentory_empty_state.dart';
import 'package:zentory_app/common/widgets/zentory_dialogs.dart';
import 'package:zentory_app/core/workspace_role.dart';
import 'package:zentory_app/presentation/blocs/members_bloc.dart';
import 'package:zentory_app/l10n/app_localizations.dart';

import 'package:zentory_app/presentation/widgets/cards/member_card.dart';

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
                    return MemberCard(member: members[index]);
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
}
