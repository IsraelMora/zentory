import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:sizer/sizer.dart';
import 'package:zentory_app/core/theme/app_design.dart';
import 'package:zentory_app/core/router/router.gr.dart';

class ZentoryHeader extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final bool showNotificationButton;

  const ZentoryHeader({
    super.key,
    required this.title,
    this.actions,
    this.showNotificationButton = true,
  });

  @override
  Size get preferredSize => Size.fromHeight(10.h + AppDesign.spaceM);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(AppDesign.radiusExtraLarge),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            AppDesign.paddingL,
            AppDesign.spaceM,
            AppDesign.paddingL,
            AppDesign.spaceM,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.headlineMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (actions != null || showNotificationButton) ...[
                SizedBox(width: AppDesign.paddingM),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (showNotificationButton) ...[
                      IconButton(
                        onPressed: () {
                          context.router.push(const NotificationsRoute());
                        },
                        icon: Icon(
                          LucideIcons.bell,
                          size: AppDesign.fontXL,
                        ),
                        tooltip: 'Notificaciones',
                      ),
                      if (actions != null && actions!.isNotEmpty)
                        SizedBox(width: AppDesign.spaceS),
                    ],
                    if (actions != null) ...actions!,
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
