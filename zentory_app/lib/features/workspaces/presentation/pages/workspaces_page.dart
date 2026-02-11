import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:zentory_app/core/theme/app_design.dart';
import 'package:zentory_app/core/di/injection.dart';
import 'package:zentory_app/core/router/router.gr.dart';
import 'package:zentory_app/core/widgets/zentory_ui_components.dart';
import 'package:zentory_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:zentory_app/features/workspaces/presentation/bloc/workspaces_bloc.dart';

@RoutePage()
class WorkspacesPage extends StatelessWidget {
  const WorkspacesPage({super.key});

  void _showCreateWorkspaceDialog(BuildContext context, WorkspacesBloc bloc) {
    final controller = TextEditingController();
    ZentoryDialogs.showCustomDialog(
      context: context,
      title: 'Nuevo Espacio',
      child: TextField(
        controller: controller,
        autofocus: true,
        decoration: InputDecoration(
          labelText: 'Nombre del espacio',
          hintText: 'Ej: Almacén Principal',
          prefixIcon: Icon(
            LucideIcons.layoutGrid,
            size: AppDesign.fontL,
          ),
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
            if (controller.text.isNotEmpty) {
              bloc.add(
                WorkspacesEvent.workspaceCreated(controller.text),
              );
              Navigator.pop(context);
            }
          },
          child: const Text('Crear Espacio'),
        ),
      ],
    );
  }

  void _showLogoutConfirmation(BuildContext context) {
    ZentoryDialogs.showActionDialog(
      context: context,
      title: 'Cerrar Sesión',
      description: '¿Estás seguro de que quieres salir?',
      confirmLabel: 'Salir',
      confirmColor: Theme.of(context).colorScheme.error,
      icon: LucideIcons.logOut,
      onConfirm: () {
        context.read<AuthBloc>().add(const AuthEvent.logoutRequested());
      },
    );
  }

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
                          error: (message) => ZentoryErrorState(
                            title: 'Error al cargar espacios',
                            message:
                                'No pudimos conectar con el servidor. Verifica tu conexión e intenta nuevamente.',
                            icon: LucideIcons.serverCrash,
                            onRetry: () {
                              workspacesBloc.add(
                                const WorkspacesEvent.workspacesFetched(),
                              );
                            },
                          ),
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
                                  final workspace = workspaces[index];
                                  return _buildWorkspaceCard(
                                    context,
                                    workspace,
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

  Widget _buildHeader(BuildContext context, WorkspacesBloc bloc) {
    return ZentoryHeader(
      title: 'Tus Espacios',
      subtitle: 'Bienvenido a Zentory',
      actions: [
        IconButton(
          onPressed: () => _showLogoutConfirmation(context),
          icon: const Icon(LucideIcons.logOut),
          tooltip: 'Cerrar Sesión',
        ),
      ],
    );
  }

  Widget _buildEmptyState(BuildContext context, WorkspacesBloc bloc) {
    return ZentoryEmptyState(
      title: '¡Comencemos!',
      description: 'Crea tu primer espacio para gestionar inventario.',
      icon: LucideIcons.layoutGrid,
      actionLabel: 'Crear Espacio',
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
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: AppDesign.fontM,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                SizedBox(height: AppDesign.spaceXS),
                Text(
                  '${workspace.memberIds.length} miembros',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: AppDesign.fontS,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
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
