import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import 'package:zentory_app/core/widgets/zentory_header.dart';
import 'package:zentory_app/core/theme/app_design.dart';
import 'package:zentory_app/core/di/injection.dart';
import 'package:zentory_app/features/inventory/presentation/bloc/dashboard_bloc.dart';
import 'package:zentory_app/features/inventory/presentation/widgets/dashboard_section_header.dart';
import 'package:zentory_app/features/inventory/presentation/widgets/dashboard_stat_card.dart';
import 'package:zentory_app/features/inventory/presentation/widgets/low_stock_list.dart';
import 'package:zentory_app/features/inventory/presentation/widgets/recent_movements_list.dart';

@RoutePage()
class DashboardPage extends StatelessWidget {
  final String workspaceId;

  const DashboardPage({super.key, required this.workspaceId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<DashboardBloc>()
        ..add(DashboardEvent.dashboardFetched(workspaceId)),
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Column(
          children: [
            const ZentoryHeader(
              title: 'Dashboard',
              subtitle: 'Resumen general',
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  context.read<DashboardBloc>().add(
                        DashboardEvent.dashboardFetched(workspaceId),
                      );
                },
                child: CustomScrollView(
                  slivers: [_buildContent(context)],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.all(AppDesign.paddingL),
      sliver: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
          return state.when(
            initial: () => const SliverFillRemaining(
              child: Center(child: CircularProgressIndicator()),
            ),
            loading: () => const SliverFillRemaining(
              child: Center(child: CircularProgressIndicator()),
            ),
            error: (message) =>
                SliverFillRemaining(child: Center(child: Text(message))),
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
                      title: 'Alertas de Stock',
                      icon: LucideIcons.triangleAlert,
                      color: Theme.of(context).colorScheme.error,
                    ),
                    SizedBox(height: AppDesign.spaceM),
                    LowStockList(items: lowStockItems),
                  ],
                  SizedBox(height: AppDesign.spaceXL),
                  DashboardSectionHeader(
                    title: 'Actividad Reciente',
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
    );
  }

  Widget _buildStatCards(
    BuildContext context,
    int totalItems,
    double totalValue,
    int lowStockCount,
    int totalCategories,
  ) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: AppDesign.spaceM,
      mainAxisSpacing: AppDesign.spaceM,
      childAspectRatio: 1.4,
      children: [
        DashboardStatCard(
          label: 'Total Items',
          value: totalItems.toString(),
          icon: LucideIcons.package,
          color: Theme.of(context).colorScheme.primary,
        ),
        DashboardStatCard(
          label: 'Valor Total',
          value: '\$${NumberFormat('#,##0').format(totalValue)}',
          icon: LucideIcons.dollarSign,
          color: Colors.teal,
        ),
        DashboardStatCard(
          label: 'Stock Bajo',
          value: lowStockCount.toString(),
          icon: LucideIcons.circleAlert,
          color: lowStockCount > 0
              ? Theme.of(context).colorScheme.error
              : Colors.teal,
        ),
        DashboardStatCard(
          label: 'Categorías',
          value: totalCategories.toString(),
          icon: LucideIcons.tag,
          color: Colors.indigo,
        ),
      ],
    );
  }
}
