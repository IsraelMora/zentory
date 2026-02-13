import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import 'package:zentory_app/core/theme/app_design.dart';
import 'package:zentory_app/core/di/injection.dart';
import 'package:zentory_app/common/utils/extensions.dart';
import 'package:zentory_app/features/inventory/presentation/bloc/dashboard_bloc.dart';
import 'package:zentory_app/features/inventory/presentation/widgets/dashboard_section_header.dart';
import 'package:zentory_app/features/inventory/presentation/widgets/dashboard_stat_card.dart';
import 'package:zentory_app/features/inventory/presentation/widgets/low_stock_list.dart';
import 'package:zentory_app/features/inventory/presentation/widgets/recent_movements_list.dart';
import 'package:zentory_app/common/widgets/zentory_ui_components.dart';
import 'package:zentory_app/l10n/app_localizations.dart';

@RoutePage()
class DashboardPage extends StatelessWidget {
  final String workspaceId;

  const DashboardPage({
    super.key,
    required this.workspaceId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<DashboardBloc>()
        ..add(DashboardEvent.dashboardFetched(workspaceId)),
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: RefreshIndicator(
          onRefresh: () async {
            getIt<DashboardBloc>()
                .add(DashboardEvent.dashboardFetched(workspaceId));
          },
          child: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              SliverPadding(
                padding: EdgeInsets.all(AppDesign.paddingL),
                sliver: BlocBuilder<DashboardBloc, DashboardState>(
                  builder: (context, state) {
                    final l10n = L10n.of(context)!;
                    return state.when(
                      initial: () => const SliverFillRemaining(
                        child: Center(child: CircularProgressIndicator()),
                      ),
                      loading: () => const SliverFillRemaining(
                        child: Center(child: CircularProgressIndicator()),
                      ),
                      error: (message) => SliverFillRemaining(
                        child: ZentoryErrorState(
                          title: l10n.error,
                          message: message,
                          onRetry: () => context.read<DashboardBloc>().add(
                                DashboardEvent.dashboardFetched(workspaceId),
                              ),
                        ),
                      ),
                      loaded: (
                        totalItems,
                        totalStockValue,
                        totalCategories,
                        lowStockItems,
                        recentMovements,
                      ) {
                        return SliverList(
                          delegate: SliverChildListDelegate([
                            _buildStatCards(
                              context,
                              totalItems,
                              totalStockValue,
                              lowStockItems.length,
                              totalCategories,
                            ),
                            if (lowStockItems.isNotEmpty) ...[
                              SizedBox(height: AppDesign.spaceXL),
                              DashboardSectionHeader(
                                title: l10n.stockAlerts,
                                icon: LucideIcons.triangleAlert,
                                color: Theme.of(context).colorScheme.error,
                              ),
                              SizedBox(height: AppDesign.spaceM),
                              LowStockList(items: lowStockItems),
                            ],
                            SizedBox(height: AppDesign.spaceXL),
                            DashboardSectionHeader(
                              title: l10n.recentActivity,
                              icon: LucideIcons.activity,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            SizedBox(height: AppDesign.spaceM),
                            RecentMovementsList(movements: recentMovements),
                          ]),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCards(
    BuildContext context,
    int totalItems,
    double totalValue,
    int lowStockCount,
    int totalCategories,
  ) {
    final l10n = L10n.of(context)!;
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: AppDesign.spaceM,
      mainAxisSpacing: AppDesign.spaceM,
      childAspectRatio: 1.4,
      children: [
        DashboardStatCard(
          label: l10n.totalItems,
          value: totalItems.toString(),
          icon: LucideIcons.package,
          color: Theme.of(context).colorScheme.primary,
        ),
        DashboardStatCard(
          label: l10n.totalStockValue,
          value: totalValue.toCurrency(decimalDigits: 0),
          icon: LucideIcons.dollarSign,
          color: AppDesign.success,
        ),
        DashboardStatCard(
          label: l10n.lowStock,
          value: lowStockCount.toString(),
          icon: LucideIcons.circleAlert,
          color: lowStockCount > 0 ? AppDesign.error : AppDesign.success,
        ),
        DashboardStatCard(
          label: l10n.categories,
          value: totalCategories.toString(),
          icon: LucideIcons.tag,
          color: Theme.of(context).colorScheme.secondary,
        ),
      ],
    );
  }
}
