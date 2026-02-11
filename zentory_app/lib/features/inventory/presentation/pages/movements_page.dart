import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:zentory_app/core/theme/app_design.dart';
import 'package:zentory_app/core/di/injection.dart';
import 'package:zentory_app/core/widgets/zentory_ui_components.dart';
import 'package:zentory_app/features/inventory/domain/entities/movement.dart';
import 'package:zentory_app/features/inventory/presentation/bloc/movements_bloc.dart';
import 'package:intl/intl.dart';

@RoutePage()
class MovementsPage extends StatefulWidget {
  final String workspaceId;

  const MovementsPage({super.key, required this.workspaceId});

  @override
  State<MovementsPage> createState() => _MovementsPageState();
}

class _MovementsPageState extends State<MovementsPage> {
  final _scrollController = ScrollController();
  late MovementsBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = getIt<MovementsBloc>()
      ..add(MovementsEvent.movementsFetched(widget.workspaceId));
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      _bloc.add(MovementsEvent.loadMoreMovements(widget.workspaceId));
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Historial de Stock',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontSize: AppDesign.fontL),
              ),
              Text(
                'Últimos movimientos',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: AppDesign.fontS,
                    ),
              ),
            ],
          ),
        ),
        body: BlocBuilder<MovementsBloc, MovementsState>(
          builder: (context, state) {
            return state.when(
              initial: () => _buildShimmerLoading(),
              loading: () => _buildShimmerLoading(),
              error: (message) => Center(child: Text('Error: $message')),
              loaded: (movements, hasReachedMax, isLoadingMore) {
                if (movements.isEmpty) {
                  return ZentoryEmptyState(
                    title: 'Sin movimientos',
                    description:
                        'Las entradas y salidas de stock aparecerán aquí.',
                    icon: LucideIcons.history,
                  );
                }
                return RefreshIndicator(
                  onRefresh: () async {
                    HapticFeedback.lightImpact();
                    _bloc.add(
                      MovementsEvent.movementsFetched(widget.workspaceId),
                    );
                  },
                  child: ListView.builder(
                    controller: _scrollController,
                    padding: EdgeInsets.all(AppDesign.paddingM),
                    itemCount: movements.length + (isLoadingMore ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index >= movements.length) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: AppDesign.spaceXL,
                          ),
                          child:
                              const Center(child: CircularProgressIndicator()),
                        );
                      }
                      final movement = movements[index];
                      return _buildMovementCard(movement);
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildShimmerLoading() {
    return ListView.builder(
      padding: EdgeInsets.all(AppDesign.paddingM),
      itemCount: 8,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.only(bottom: AppDesign.spaceS),
        child: ZentoryShimmer(
          width: double.infinity,
          height: AppDesign.spaceXL * 2,
          borderRadius: AppDesign.radiusMedium,
        ),
      ),
    );
  }

  Widget _buildMovementCard(MovementEntity movement) {
    final isPositive = movement.type == MovementType.inflow;
    final color =
        isPositive ? Colors.green : Theme.of(context).colorScheme.error;
    final icon = isPositive ? LucideIcons.trendingUp : LucideIcons.trendingDown;

    return Card(
      margin: EdgeInsets.only(bottom: AppDesign.spaceS),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: AppDesign.borderMedium,
        side: BorderSide(color: Theme.of(context).dividerColor),
      ),
      child: Padding(
        padding: EdgeInsets.all(AppDesign.paddingM),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: AppDesign.fontL),
            ),
            SizedBox(width: AppDesign.paddingM),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movement.productName,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontSize: AppDesign.fontM,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(height: AppDesign.spaceXS / 2),
                  Text(
                    movement.reason,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(fontSize: AppDesign.fontS),
                  ),
                  SizedBox(height: AppDesign.spaceXS),
                  Row(
                    children: [
                      Icon(
                        LucideIcons.user,
                        size: 12,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      SizedBox(width: AppDesign.spaceXS),
                      Text(
                        movement.userName ?? 'Usuario',
                        style: Theme.of(
                          context,
                        ).textTheme.labelSmall?.copyWith(
                              fontSize: AppDesign.fontXS,
                            ),
                      ),
                      SizedBox(width: AppDesign.spaceS),
                      Icon(
                        LucideIcons.calendar,
                        size: 12,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      SizedBox(width: AppDesign.spaceXS),
                      Text(
                        DateFormat('dd/MM HH:mm').format(movement.createdAt),
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              fontSize: AppDesign.fontXS,
                              color: Theme.of(
                                context,
                              ).colorScheme.secondary.withValues(alpha: 0.7),
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '${isPositive ? '+' : '-'}${movement.quantity}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: AppDesign.fontL,
                    color: color,
                  ),
                ),
                Text(
                  movement.type == MovementType.adjustment
                      ? 'Ajuste'
                      : (isPositive ? 'Entrada' : 'Salida'),
                  style: TextStyle(
                    fontSize: AppDesign.fontXS,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
