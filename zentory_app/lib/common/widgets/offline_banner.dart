import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:zentory_app/common/network/connectivity_bloc.dart';
import 'package:zentory_app/l10n/app_localizations.dart';
import 'package:zentory_app/core/theme/app_design.dart';

class OfflineBanner extends StatelessWidget {
  const OfflineBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectivityBloc, ConnectivityStatus>(
      builder: (context, status) {
        if (status == ConnectivityStatus.online) {
          return const SizedBox.shrink();
        }

        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            vertical: AppDesign.spaceXS,
            horizontal: AppDesign.paddingM,
          ),
          color: AppDesign.warning,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                LucideIcons.wifiOff,
                color: AppDesign.white,
                size: AppDesign.fontM,
              ),
              SizedBox(width: AppDesign.spaceS),
              Text(
                L10n.of(context)!.offlineMode,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: AppDesign.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        );
      },
    );
  }
}
