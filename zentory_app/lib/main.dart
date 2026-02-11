import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sizer/sizer.dart';
import 'package:zentory_app/l10n/app_localizations.dart';
import 'package:zentory_app/core/di/injection.dart';
import 'package:zentory_app/core/network/connectivity_bloc.dart';
import 'package:zentory_app/core/network/sync_manager.dart';
import 'package:zentory_app/core/router/router.dart';
import 'package:zentory_app/core/router/router.gr.dart';
import 'package:zentory_app/core/theme/app_theme.dart';
import 'package:zentory_app/core/widgets/offline_banner.dart';
import 'package:zentory_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:zentory_app/features/settings/presentation/bloc/settings_bloc.dart';

import 'package:zentory_app/core/utils/logger.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Global Error Catching
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    ZentoryLogger.error('Flutter Error', details.exception, details.stack);
  };

  await configureDependencies();
  getIt<SyncManager>().init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => getIt<AuthBloc>()),
            BlocProvider(create: (context) => getIt<ConnectivityBloc>()),
            BlocProvider(
              create: (context) =>
                  getIt<SettingsBloc>()..add(const SettingsEvent.started()),
            ),
          ],
          child: BlocBuilder<SettingsBloc, SettingsState>(
            builder: (context, settingsState) {
              final themeMode = settingsState.maybeWhen(
                loaded: (mode) => mode,
                orElse: () => ThemeMode.system,
              );

              return BlocListener<AuthBloc, AuthState>(
                listener: (context, authState) {
                  ZentoryLogger.debug(
                      'Navigation Guard: Auth state changed to $authState');

                  final currentRoute = _appRouter.currentPath;
                  final isLoginOrSplash = currentRoute == '/login' ||
                      currentRoute == '/splash' ||
                      currentRoute == '/';

                  authState.maybeWhen(
                    authenticated: (_) {
                      if (isLoginOrSplash) {
                        ZentoryLogger.info(
                            'Global Navigation: Authenticated, redirecting to Workspaces');
                        _appRouter.replaceAll([const WorkspacesRoute()]);
                      }
                    },
                    unauthenticated: () {
                      if (!isLoginOrSplash) {
                        ZentoryLogger.info(
                            'Global Navigation: Unauthenticated, redirecting to Login');
                        _appRouter.replaceAll([const LoginRoute()]);
                      }
                    },
                    orElse: () {},
                  );
                },
                child: MaterialApp.router(
                  title: 'Zentory',
                  debugShowCheckedModeBanner: false,
                  theme: AppTheme.light,
                  darkTheme: AppTheme.dark,
                  themeMode: themeMode,
                  routerConfig: _appRouter.config(),
                  localizationsDelegates: [
                    L10n.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                  ],
                  supportedLocales: const [Locale('es'), Locale('en')],
                  builder: (context, child) {
                    return Column(
                      children: [
                        const OfflineBanner(),
                        Expanded(child: child ?? const SizedBox.shrink()),
                      ],
                    );
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }
}
