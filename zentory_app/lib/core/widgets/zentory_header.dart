import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:zentory_app/core/theme/app_design.dart';
import 'package:zentory_app/core/router/router.gr.dart';

class ZentoryHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final List<Widget>? actions;
  final bool showNotificationButton;

  const ZentoryHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.actions,
    this.showNotificationButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(AppDesign.radiusExtraLarge),
        ),
        boxShadow: AppDesign.shadowLight,
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            AppDesign.paddingL,
            AppDesign
                .spaceM, // Adjusted to match standard AppBar height feel + padding
            AppDesign.paddingL,
            AppDesign.spaceL,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (subtitle != null) ...[
                      Text(
                        subtitle!,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context).colorScheme.secondary,
                              fontSize: AppDesign.fontS,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                      SizedBox(height: AppDesign.spaceXS),
                    ],
                    Text(
                      title,
                      style:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: AppDesign.fontXXL,
                                height: 1.2,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                    ),
                  ],
                ),
              ),
              if (actions != null || true) ...[
                SizedBox(width: AppDesign.paddingM),
                Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (showNotificationButton)
                        IconButton(
                          onPressed: () {
                            context.router.push(const NotificationsRoute());
                          },
                          icon: Icon(
                            LucideIcons.bell,
                            size: AppDesign.fontXL,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                          tooltip: 'Notificaciones',
                        ),
                      if (showNotificationButton &&
                          actions != null &&
                          actions!.isNotEmpty)
                        SizedBox(width: AppDesign.spaceS),
                      if (actions != null) ...actions!,
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
