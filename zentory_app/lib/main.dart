import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:reactive_forms/reactive_forms.dart';
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
                  final isLoginOrSplash = currentRoute.startsWith('/login') ||
                      currentRoute.startsWith('/splash') ||
                      currentRoute == '/';

                  ZentoryLogger.debug(
                      'Navigation Guard: currentRoute: $currentRoute, isLoginOrSplash: $isLoginOrSplash');

                  authState.maybeWhen(
                    authenticated: (_) {
                      if (isLoginOrSplash) {
                        ZentoryLogger.info(
                            'Global Navigation: Authenticated, redirecting to Workspaces');
                        _appRouter.replaceAll([const WorkspacesRoute()]);
                      }
                    },
                    unauthenticated: () {
                      if (!currentRoute.startsWith('/login')) {
                        ZentoryLogger.info(
                            'Global Navigation: Unauthenticated, redirecting to Login');
                        _appRouter.replaceAll([const LoginRoute()]);
                      }
                    },
                    orElse: () {},
                  );
                },
                child: ReactiveFormConfig(
                  validationMessages: {
                    ValidationMessage.required: (error) =>
                        'Este campo es obligatorio',
                    ValidationMessage.email: (error) =>
                        'Debe ingresar un correo válido',
                    ValidationMessage.minLength: (error) =>
                        'Debe tener al menos ${(error as Map)['requiredLength']} caracteres',
                    ValidationMessage.maxLength: (error) =>
                        'Debe tener máximo ${(error as Map)['requiredLength']} caracteres',
                    ValidationMessage.pattern: (error) =>
                        'El formato no es válido',
                    ValidationMessage.mustMatch: (error) =>
                        'Los campos no coinciden',
                    ValidationMessage.min: (error) =>
                        'El valor debe ser mayor o igual a ${(error as Map)['min']}',
                    ValidationMessage.max: (error) =>
                        'El valor debe ser menor o igual a ${(error as Map)['max']}',
                    ValidationMessage.number: (error) =>
                        'Debe ingresar un número válido',
                    ValidationMessage.creditCard: (error) =>
                        'Debe ingresar una tarjeta de crédito válida',
                    ValidationMessage.equals: (error) =>
                        'El valor no coincide con el esperado',
                    ValidationMessage.contains: (error) =>
                        'El valor no está permitido',
                    ValidationMessage.any: (error) =>
                        'Al menos una opción debe ser válida',
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
                ),
              );
            },
          ),
        );
      },
    );
  }
}
