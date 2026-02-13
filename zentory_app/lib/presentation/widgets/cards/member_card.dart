import 'package:flutter/material.dart';
import 'package:zentory_app/core/theme/app_design.dart';
import 'package:zentory_app/common/widgets/zentory_card.dart';
import 'package:zentory_app/common/widgets/zentory_badge.dart';
import 'package:zentory_app/domain/entities/member.dart';

class MemberCard extends StatelessWidget {
  final MemberEntity member;

  const MemberCard({
    super.key,
    required this.member,
  });

  @override
  Widget build(BuildContext context) {
    return ZentoryCard(
      margin: EdgeInsets.only(bottom: AppDesign.spaceS),
      padding: EdgeInsets.zero,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(
          horizontal: AppDesign.paddingM,
          vertical: AppDesign.paddingS,
        ),
        leading: CircleAvatar(
          backgroundColor:
              Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
          child: Text(
            member.name.substring(0, 1).toUpperCase(),
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
        ),
        title: Text(
          member.name,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        subtitle: Text(member.email),
        trailing: ZentoryBadge(
          label: member.role,
          color: _getRoleColor(member.role),
        ),
      ),
    );
  }

  Color _getRoleColor(String role) {
    switch (role.toLowerCase()) {
      case 'administrador':
      case 'propietario':
        return AppDesign.accent;
      case 'editor':
        return AppDesign.info;
      case 'lector':
        return AppDesign.secondary;
      default:
        return AppDesign.success;
    }
  }
}
