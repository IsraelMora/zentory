import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:zentory_app/core/theme/app_design.dart';
import 'package:zentory_app/core/di/injection.dart';
import 'package:zentory_app/common/widgets/zentory_ui_components.dart';
import 'package:zentory_app/features/inventory/presentation/bloc/movements_bloc.dart';
import 'package:zentory_app/l10n/app_localizations.dart';
import 'package:zentory_app/features/inventory/presentation/widgets/movement_card.dart';

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
                      return MovementCard(movement: movements[index]);
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
}
