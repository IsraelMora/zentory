import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:zentory_app/core/router/router.gr.dart';
import 'package:zentory_app/core/theme/app_design.dart';
import 'package:zentory_app/common/widgets/zentory_ui_components.dart';
import 'package:zentory_app/l10n/app_localizations.dart';

class WorkspaceCard extends StatelessWidget {
  final dynamic workspace;

  const WorkspaceCard({
    super.key,
    required this.workspace,
  });

  @override
  Widget build(BuildContext context) {
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
