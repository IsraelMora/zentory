import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:zentory_app/core/theme/app_design.dart';
import 'package:zentory_app/core/di/injection.dart';
import 'package:zentory_app/presentation/widgets/zentory_error_state.dart';
import 'package:zentory_app/presentation/widgets/zentory_empty_state.dart';
import 'package:zentory_app/presentation/widgets/zentory_shimmer.dart';
import 'package:zentory_app/presentation/blocs/movements_bloc.dart';
import 'package:zentory_app/l10n/app_localizations.dart';
import 'package:zentory_app/presentation/widgets/zentory_card.dart';
import 'package:zentory_app/presentation/widgets/zentory_icon_container.dart';
import 'package:zentory_app/domain/entities/movement.dart';

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
    final l10n = L10n.of(context)!;
    return BlocProvider.value(
      value: _bloc,
      child: Scaffold(
        body: BlocBuilder<MovementsBloc, MovementsState>(
          builder: (context, state) {
            return state.when(
              initial: () => _buildShimmerLoading(),
              loading: () => _buildShimmerLoading(),
              error: (message) => Center(
                child: ZentoryErrorState(
                  title: l10n.error,
                  message: message,
                  onRetry: () => _bloc.add(
                    MovementsEvent.movementsFetched(widget.workspaceId),
                  ),
                ),
              ),
              loaded: (movements, hasReachedMax, isLoadingMore) {
                if (movements.isEmpty) {
                  return ZentoryEmptyState(
                    title: l10n.noRecentActivity,
                    description: l10n.movementsEmptyDesc,
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
                      return _buildMovementCard(
                          context: context, movement: movements[index]);
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
          height: AppDesign.spaceXL,
          borderRadius: AppDesign.radiusMedium,
        ),
      ),
    );
  }

  Widget _buildMovementCard(
      {required BuildContext context, required MovementEntity movement}) {
    final l10n = L10n.of(context)!;
    final isPositive = movement.type == MovementType.inflow;
    final color =
        isPositive ? AppDesign.success : Theme.of(context).colorScheme.error;
    final icon = isPositive ? LucideIcons.trendingUp : LucideIcons.trendingDown;

    return Padding(
      padding: EdgeInsets.only(bottom: AppDesign.spaceS),
      child: ZentoryCard(
        padding: EdgeInsets.all(AppDesign.paddingM),
        child: Row(
          children: [
            ZentoryIconContainer(
              icon: icon,
              color: color,
              size: AppDesign.fontL,
              padding: AppDesign.paddingS,
            ),
            SizedBox(width: AppDesign.paddingM),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movement.productName,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  SizedBox(height: AppDesign.spaceXS),
                  Text(
                    movement.reason,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                  ),
                  SizedBox(height: AppDesign.spaceXS),
                  Row(
                    children: [
                      Icon(
                        LucideIcons.user,
                        size: AppDesign.fontM,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      SizedBox(width: AppDesign.spaceXS),
                      Text(
                        movement.userName ?? l10n.unknownUser,
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      SizedBox(width: AppDesign.spaceS),
                      Icon(
                        LucideIcons.calendar,
                        size: AppDesign.fontM,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      SizedBox(width: AppDesign.spaceXS),
                      Text(
                        DateFormat('dd/MM HH:mm').format(movement.createdAt),
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .secondary
                                  .withValues(alpha: 0.7),
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
                      ? l10n.adjustment
                      : (isPositive
                          ? l10n.movementInflow
                          : l10n.movementOutflow),
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
