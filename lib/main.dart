import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'core/di/injection.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Inicializamos Inyección de Dependencias (Incluye Sembast y Appwrite)
  await configureDependencies();

  runApp(const ZentoryApp());
}

class ZentoryApp extends StatelessWidget {
  const ZentoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = getIt<AppRouter>();

    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp.router(
          title: 'Zentory',
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.system, // Adaptación claro/oscuro automática
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          routerConfig: appRouter.config(),
        );
      },
    );
  }
}
