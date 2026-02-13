import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:sizer/sizer.dart';
import 'package:zentory_app/l10n/app_localizations.dart';
import 'package:zentory_app/core/di/injection.dart';
import 'package:zentory_app/common/network/connectivity_bloc.dart';
import 'package:zentory_app/common/network/sync_manager.dart';
import 'package:zentory_app/core/router/router.dart';
import 'package:zentory_app/core/theme/app_theme.dart';
import 'package:zentory_app/common/utils/validation_messages.dart';
import 'package:zentory_app/presentation/widgets/offline_banner.dart';
import 'package:zentory_app/core/router/auth_guard.dart';
import 'package:zentory_app/presentation/blocs/auth_bloc.dart';
import 'package:zentory_app/presentation/blocs/settings_bloc.dart';
import 'package:zentory_app/common/utils/logger.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
  late final AppRouter _appRouter;

  @override
  void initState() {
    super.initState();
    _appRouter = AppRouter(AuthGuard(getIt<AuthBloc>()));
  }

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
          child: BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              _appRouter.reevaluateGuards();
            },
            child: BlocBuilder<SettingsBloc, SettingsState>(
              builder: (context, settingsState) {
                final themeMode = settingsState.maybeWhen(
                  loaded: (mode) => mode,
                  orElse: () => ThemeMode.system,
                );

                return ReactiveFormConfig(
                  validationMessages: ZentoryValidationMessages.messages,
                  child: MaterialApp.router(
                    title: 'Zentory',
                    debugShowCheckedModeBanner: false,
                    theme: AppTheme.light,
                    darkTheme: AppTheme.dark,
                    themeMode: themeMode,
                    routerConfig: _appRouter.config(),
                    localizationsDelegates: const [
                      L10n.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
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
          ),
        );
      },
    );
  }
}
