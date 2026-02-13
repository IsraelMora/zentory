import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:zentory_app/core/theme/app_design.dart';
import 'package:zentory_app/core/di/injection.dart';
import 'package:zentory_app/presentation/widgets/zentory_feedback.dart';
import 'package:zentory_app/presentation/widgets/zentory_error_state.dart';
import 'package:zentory_app/presentation/widgets/zentory_empty_state.dart';
import 'package:zentory_app/presentation/widgets/zentory_dialogs.dart';
import 'package:zentory_app/presentation/widgets/zentory_header.dart';
import 'package:zentory_app/presentation/widgets/zentory_card.dart';
import 'package:zentory_app/presentation/widgets/zentory_icon_container.dart';
import 'package:zentory_app/presentation/blocs/auth_bloc.dart';
import 'package:zentory_app/presentation/blocs/workspaces_bloc.dart';
import 'package:zentory_app/l10n/app_localizations.dart';
import 'package:zentory_app/core/router/router.gr.dart';

@RoutePage()
class WorkspacesPage extends StatelessWidget {
  const WorkspacesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<WorkspacesBloc>()
        ..add(const WorkspacesEvent.workspacesFetched()),
      child: MultiBlocListener(
        listeners: [
          BlocListener<WorkspacesBloc, WorkspacesState>(
            listener: (context, state) {
              state.maybeWhen(
                error: (message) {
                  ZentoryFeedback.showError(context, message);
                },
                orElse: () {},
              );
            },
          ),
        ],
        child: Builder(
          builder: (context) {
            final workspacesBloc = context.read<WorkspacesBloc>();
            return Scaffold(
              body: Column(
                children: [
                  _buildHeader(context, workspacesBloc),
                  Expanded(
                    child: BlocBuilder<WorkspacesBloc, WorkspacesState>(
                      builder: (context, state) {
                        return state.when(
                          initial: () => const SizedBox.shrink(),
                          loading: () =>
                              const Center(child: CircularProgressIndicator()),
                          error: (message) {
                            final l10n = L10n.of(context)!;
                            return ZentoryErrorState(
                              title: l10n.errorLoadingWorkspaces,
                              message: l10n.connectionError,
                              icon: LucideIcons.serverCrash,
                              onRetry: () {
                                workspacesBloc.add(
                                  const WorkspacesEvent.workspacesFetched(),
                                );
                              },
                            );
                          },
                          loaded: (workspaces) {
                            if (workspaces.isEmpty) {
                              return _buildEmptyState(context, workspacesBloc);
                            }
                            return RefreshIndicator(
                              onRefresh: () async {
                                workspacesBloc.add(
                                  const WorkspacesEvent.workspacesFetched(),
                                );
                              },
                              child: ListView.separated(
                                padding: EdgeInsets.all(AppDesign.paddingM),
                                itemCount: workspaces.length,
                                separatorBuilder: (context, index) =>
                                    SizedBox(height: AppDesign.spaceS),
                                itemBuilder: (context, index) {
                                  return _buildWorkspaceCard(
                                    context,
                                    workspaces[index],
                                  );
                                },
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () =>
                    _showCreateWorkspaceDialog(context, workspacesBloc),
                child: const Icon(LucideIcons.plus),
              ),
            );
          },
        ),
      ),
    );
  }

  void _showCreateWorkspaceDialog(BuildContext context, WorkspacesBloc bloc) {
    final l10n = L10n.of(context)!;
    final controller = TextEditingController();
    ZentoryDialogs.showCustomDialog(
      context: context,
      title: l10n.newWorkspace,
      child: TextField(
        controller: controller,
        autofocus: true,
        decoration: InputDecoration(
          labelText: l10n.workspaceName,
          hintText: l10n.workspaceNameHint,
          prefixIcon: Icon(
            LucideIcons.layoutGrid,
            size: AppDesign.fontL,
          ),
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
            if (controller.text.isNotEmpty) {
              bloc.add(
                WorkspacesEvent.workspaceCreated(controller.text),
              );
              Navigator.pop(context);
            }
          },
          child: Text(l10n.createWorkspace),
        ),
      ],
    );
  }

  void _showLogoutConfirmation(BuildContext context) {
    final l10n = L10n.of(context)!;
    ZentoryDialogs.showActionDialog(
      context: context,
      title: l10n.logoutConfirm,
      description: l10n.logoutDesc,
      confirmLabel: l10n.logout,
      confirmColor: Theme.of(context).colorScheme.error,
      icon: LucideIcons.logOut,
      onConfirm: () {
        context.read<AuthBloc>().add(const AuthEvent.logoutRequested());
      },
    );
  }

  Widget _buildHeader(BuildContext context, WorkspacesBloc bloc) {
    final l10n = L10n.of(context)!;
    return ZentoryHeader(
      title: context.router.current.title(context),
      actions: [
        IconButton(
          onPressed: () => _showLogoutConfirmation(context),
          icon: const Icon(LucideIcons.logOut),
          tooltip: l10n.logout,
        ),
      ],
    );
  }

  Widget _buildEmptyState(BuildContext context, WorkspacesBloc bloc) {
    final l10n = L10n.of(context)!;
    return ZentoryEmptyState(
      title: l10n.letsGetStarted,
      description: l10n.letsGetStartedDesc,
      icon: LucideIcons.layoutGrid,
      actionLabel: l10n.createWorkspace,
      onAction: () => _showCreateWorkspaceDialog(context, bloc),
    );
  }

  Widget _buildWorkspaceCard(BuildContext context, dynamic workspace) {
    return ZentoryCard(
      onTap: () {
        context.router.push(
          WorkspaceShellRoute(
            workspaceId: workspace.id,
            workspaceName: workspace.name,
          ),
        );
      },
      child: Row(
        children: [
          ZentoryIconContainer(
            icon: LucideIcons.layoutGrid,
            padding: AppDesign.paddingS,
            size: AppDesign.fontXL,
            isCircle: false,
          ),
          SizedBox(width: AppDesign.spaceM),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  workspace.name,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: AppDesign.spaceXS),
                Text(
                  '${workspace.memberIds.length} ${L10n.of(context)!.members}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          Icon(
            LucideIcons.chevronRight,
            color: Theme.of(context).colorScheme.secondary,
            size: AppDesign.fontL,
          ),
        ],
      ),
    );
  }
}
