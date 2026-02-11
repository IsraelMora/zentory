// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i12;
import 'package:zentory_app/features/auth/presentation/pages/login_page.dart'
    as _i3;
import 'package:zentory_app/features/auth/presentation/pages/notifications_page.dart'
    as _i6;
import 'package:zentory_app/features/auth/presentation/pages/profile_page.dart'
    as _i7;
import 'package:zentory_app/features/auth/presentation/pages/splash_page.dart'
    as _i8;
import 'package:zentory_app/features/inventory/presentation/pages/dashboard_page.dart'
    as _i1;
import 'package:zentory_app/features/inventory/presentation/pages/inventory_page.dart'
    as _i2;
import 'package:zentory_app/features/inventory/presentation/pages/movements_page.dart'
    as _i5;
import 'package:zentory_app/features/workspaces/presentation/pages/members_page.dart'
    as _i4;
import 'package:zentory_app/features/workspaces/presentation/pages/workspace_shell_page.dart'
    as _i9;
import 'package:zentory_app/features/workspaces/presentation/pages/workspaces_page.dart'
    as _i10;

/// generated route for
/// [_i1.DashboardPage]
class DashboardRoute extends _i11.PageRouteInfo<DashboardRouteArgs> {
  DashboardRoute({
    _i12.Key? key,
    required String workspaceId,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          DashboardRoute.name,
          args: DashboardRouteArgs(key: key, workspaceId: workspaceId),
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DashboardRouteArgs>();
      return _i1.DashboardPage(key: args.key, workspaceId: args.workspaceId);
    },
  );
}

class DashboardRouteArgs {
  const DashboardRouteArgs({this.key, required this.workspaceId});

  final _i12.Key? key;

  final String workspaceId;

  @override
  String toString() {
    return 'DashboardRouteArgs{key: $key, workspaceId: $workspaceId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! DashboardRouteArgs) return false;
    return key == other.key && workspaceId == other.workspaceId;
  }

  @override
  int get hashCode => key.hashCode ^ workspaceId.hashCode;
}

/// generated route for
/// [_i2.InventoryPage]
class InventoryRoute extends _i11.PageRouteInfo<InventoryRouteArgs> {
  InventoryRoute({
    _i12.Key? key,
    required String workspaceId,
    required String workspaceName,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          InventoryRoute.name,
          args: InventoryRouteArgs(
            key: key,
            workspaceId: workspaceId,
            workspaceName: workspaceName,
          ),
          initialChildren: children,
        );

  static const String name = 'InventoryRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<InventoryRouteArgs>();
      return _i2.InventoryPage(
        key: args.key,
        workspaceId: args.workspaceId,
        workspaceName: args.workspaceName,
      );
    },
  );
}

class InventoryRouteArgs {
  const InventoryRouteArgs({
    this.key,
    required this.workspaceId,
    required this.workspaceName,
  });

  final _i12.Key? key;

  final String workspaceId;

  final String workspaceName;

  @override
  String toString() {
    return 'InventoryRouteArgs{key: $key, workspaceId: $workspaceId, workspaceName: $workspaceName}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! InventoryRouteArgs) return false;
    return key == other.key &&
        workspaceId == other.workspaceId &&
        workspaceName == other.workspaceName;
  }

  @override
  int get hashCode =>
      key.hashCode ^ workspaceId.hashCode ^ workspaceName.hashCode;
}

/// generated route for
/// [_i3.LoginPage]
class LoginRoute extends _i11.PageRouteInfo<void> {
  const LoginRoute({List<_i11.PageRouteInfo>? children})
      : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i3.LoginPage();
    },
  );
}

/// generated route for
/// [_i4.MembersPage]
class MembersRoute extends _i11.PageRouteInfo<MembersRouteArgs> {
  MembersRoute({
    _i12.Key? key,
    required String workspaceId,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          MembersRoute.name,
          args: MembersRouteArgs(key: key, workspaceId: workspaceId),
          initialChildren: children,
        );

  static const String name = 'MembersRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MembersRouteArgs>();
      return _i4.MembersPage(key: args.key, workspaceId: args.workspaceId);
    },
  );
}

class MembersRouteArgs {
  const MembersRouteArgs({this.key, required this.workspaceId});

  final _i12.Key? key;

  final String workspaceId;

  @override
  String toString() {
    return 'MembersRouteArgs{key: $key, workspaceId: $workspaceId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! MembersRouteArgs) return false;
    return key == other.key && workspaceId == other.workspaceId;
  }

  @override
  int get hashCode => key.hashCode ^ workspaceId.hashCode;
}

/// generated route for
/// [_i5.MovementsPage]
class MovementsRoute extends _i11.PageRouteInfo<MovementsRouteArgs> {
  MovementsRoute({
    _i12.Key? key,
    required String workspaceId,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          MovementsRoute.name,
          args: MovementsRouteArgs(key: key, workspaceId: workspaceId),
          initialChildren: children,
        );

  static const String name = 'MovementsRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MovementsRouteArgs>();
      return _i5.MovementsPage(key: args.key, workspaceId: args.workspaceId);
    },
  );
}

class MovementsRouteArgs {
  const MovementsRouteArgs({this.key, required this.workspaceId});

  final _i12.Key? key;

  final String workspaceId;

  @override
  String toString() {
    return 'MovementsRouteArgs{key: $key, workspaceId: $workspaceId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! MovementsRouteArgs) return false;
    return key == other.key && workspaceId == other.workspaceId;
  }

  @override
  int get hashCode => key.hashCode ^ workspaceId.hashCode;
}

/// generated route for
/// [_i6.NotificationsPage]
class NotificationsRoute extends _i11.PageRouteInfo<void> {
  const NotificationsRoute({List<_i11.PageRouteInfo>? children})
      : super(NotificationsRoute.name, initialChildren: children);

  static const String name = 'NotificationsRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i6.NotificationsPage();
    },
  );
}

/// generated route for
/// [_i7.ProfilePage]
class ProfileRoute extends _i11.PageRouteInfo<void> {
  const ProfileRoute({List<_i11.PageRouteInfo>? children})
      : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i7.ProfilePage();
    },
  );
}

/// generated route for
/// [_i8.SplashPage]
class SplashRoute extends _i11.PageRouteInfo<void> {
  const SplashRoute({List<_i11.PageRouteInfo>? children})
      : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i8.SplashPage();
    },
  );
}

/// generated route for
/// [_i9.WorkspaceShellPage]
class WorkspaceShellRoute extends _i11.PageRouteInfo<WorkspaceShellRouteArgs> {
  WorkspaceShellRoute({
    _i12.Key? key,
    required String workspaceId,
    required String workspaceName,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          WorkspaceShellRoute.name,
          args: WorkspaceShellRouteArgs(
            key: key,
            workspaceId: workspaceId,
            workspaceName: workspaceName,
          ),
          initialChildren: children,
        );

  static const String name = 'WorkspaceShellRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<WorkspaceShellRouteArgs>();
      return _i9.WorkspaceShellPage(
        key: args.key,
        workspaceId: args.workspaceId,
        workspaceName: args.workspaceName,
      );
    },
  );
}

class WorkspaceShellRouteArgs {
  const WorkspaceShellRouteArgs({
    this.key,
    required this.workspaceId,
    required this.workspaceName,
  });

  final _i12.Key? key;

  final String workspaceId;

  final String workspaceName;

  @override
  String toString() {
    return 'WorkspaceShellRouteArgs{key: $key, workspaceId: $workspaceId, workspaceName: $workspaceName}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! WorkspaceShellRouteArgs) return false;
    return key == other.key &&
        workspaceId == other.workspaceId &&
        workspaceName == other.workspaceName;
  }

  @override
  int get hashCode =>
      key.hashCode ^ workspaceId.hashCode ^ workspaceName.hashCode;
}

/// generated route for
/// [_i10.WorkspacesPage]
class WorkspacesRoute extends _i11.PageRouteInfo<void> {
  const WorkspacesRoute({List<_i11.PageRouteInfo>? children})
      : super(WorkspacesRoute.name, initialChildren: children);

  static const String name = 'WorkspacesRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i10.WorkspacesPage();
    },
  );
}
