import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import 'package:zentory_app/core/theme/app_design.dart';
import 'package:zentory_app/core/di/injection.dart';
import 'package:zentory_app/common/utils/extensions.dart';
import 'package:zentory_app/presentation/blocs/dashboard_bloc.dart';
import 'package:zentory_app/presentation/widgets/zentory_error_state.dart';
import 'package:zentory_app/l10n/app_localizations.dart';
import 'package:zentory_app/presentation/widgets/zentory_card.dart';
import 'package:zentory_app/presentation/widgets/zentory_icon_container.dart';

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
                              _buildSectionHeader(
                                context,
                                title: l10n.stockAlerts,
                                icon: LucideIcons.triangleAlert,
                                color: Theme.of(context).colorScheme.error,
                              ),
                              SizedBox(height: AppDesign.spaceM),
                              ...lowStockItems.map((item) {
                                return _buildAlertCard(
                                  context: context,
                                  title: item.name,
                                  subtitle: l10n.lowStockWarning(item.stock),
                                  icon: LucideIcons.triangleAlert,
                                  iconColor:
                                      Theme.of(context).colorScheme.error,
                                  onTap: () {
                                    // Navigate to product
                                  },
                                );
                              }),
                            ],
                            SizedBox(height: AppDesign.spaceXL),
                            _buildSectionHeader(
                              context,
                              title: l10n.recentActivity,
                              icon: LucideIcons.activity,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            SizedBox(height: AppDesign.spaceM),
                            _buildActivityTimeline(
                              context: context,
                              items: recentMovements.map((m) {
                                final isPositive = m.type.name == 'inflow';
                                return _ActivityItem(
                                  title: m.productName,
                                  subtitle:
                                      '${isPositive ? l10n.movementInflow : l10n.movementOutflow} '
                                      'de ${m.quantity} • ${DateFormat('HH:mm').format(m.createdAt)}',
                                  indicatorColor: isPositive
                                      ? AppDesign.success
                                      : Theme.of(context).colorScheme.error,
                                );
                              }).toList(),
                              emptyText: l10n.noRecentActivity,
                            ),
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
        _buildStatCard(
          context: context,
          label: l10n.totalItems,
          value: totalItems.toString(),
          icon: LucideIcons.package,
          color: Theme.of(context).colorScheme.primary,
        ),
        _buildStatCard(
          context: context,
          label: l10n.totalStockValue,
          value: totalValue.toCurrency(decimalDigits: 0),
          icon: LucideIcons.dollarSign,
          color: AppDesign.success,
        ),
        _buildStatCard(
          context: context,
          label: l10n.lowStock,
          value: lowStockCount.toString(),
          icon: LucideIcons.circleAlert,
          color: lowStockCount > 0 ? AppDesign.error : AppDesign.success,
        ),
        _buildStatCard(
          context: context,
          label: l10n.categories,
          value: totalCategories.toString(),
          icon: LucideIcons.tag,
          color: Theme.of(context).colorScheme.secondary,
        ),
      ],
    );
  }

  Widget _buildSectionHeader(
    BuildContext context, {
    required String title,
    required IconData icon,
    required Color color,
  }) {
    return Row(
      children: [
        Icon(icon, color: color, size: AppDesign.fontL),
        SizedBox(width: AppDesign.paddingS),
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: AppDesign.fontL,
              ),
        ),
      ],
    );
  }

  Widget _buildStatCard({
    required BuildContext context,
    required String label,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    final theme = Theme.of(context);
    return ZentoryCard(
      padding: EdgeInsets.all(AppDesign.paddingM),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ZentoryIconContainer(
            icon: icon,
            color: color,
            padding: AppDesign.paddingXS,
            isCircle: false,
            size: AppDesign.fontL,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontSize: AppDesign.fontXL,
                ),
              ),
              Text(
                label,
                style: theme.textTheme.labelLarge?.copyWith(
                  fontSize: AppDesign.fontS,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAlertCard({
    required BuildContext context,
    required String title,
    required String subtitle,
    required IconData icon,
    required Color iconColor,
    VoidCallback? onTap,
  }) {
    return ZentoryCard(
      margin: EdgeInsets.only(bottom: AppDesign.spaceS),
      padding: EdgeInsets.all(AppDesign.paddingM),
      onTap: onTap,
      child: Row(
        children: [
          ZentoryIconContainer(
            icon: icon,
            color: iconColor,
            size: AppDesign.fontL,
            padding: AppDesign.paddingS,
          ),
          SizedBox(width: AppDesign.paddingM),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: AppDesign.fontM,
                      ),
                ),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: AppDesign.fontS,
                      ),
                ),
              ],
            ),
          ),
          if (onTap != null)
            Icon(
              Icons.chevron_right,
              color: Theme.of(context).colorScheme.secondary,
              size: AppDesign.fontS,
            ),
        ],
      ),
    );
  }

  Widget _buildActivityTimeline({
    required BuildContext context,
    required List<_ActivityItem> items,
    required String emptyText,
  }) {
    if (items.isEmpty) {
      return Container(
        padding: EdgeInsets.all(AppDesign.paddingL),
        alignment: Alignment.center,
        child: Text(
          emptyText,
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontSize: AppDesign.fontM,
          ),
        ),
      );
    }

    return Column(
      children: items.map((item) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: AppDesign.spaceXS),
          child: IntrinsicHeight(
            child: Row(
              children: [
                Container(
                  width: AppDesign.paddingXS,
                  decoration: BoxDecoration(
                    color: item.indicatorColor,
                    borderRadius: AppDesign.borderSmall,
                  ),
                ),
                SizedBox(width: AppDesign.paddingM),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: AppDesign.fontM,
                            ),
                      ),
                      Text(
                        item.subtitle,
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              fontSize: AppDesign.fontXS,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _ActivityItem {
  final String title;
  final String subtitle;
  final Color indicatorColor;

  const _ActivityItem({
    required this.title,
    required this.subtitle,
    required this.indicatorColor,
  });
}
