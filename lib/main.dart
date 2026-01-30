import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:office_app/core/theme/app_theme.dart';
import 'package:office_app/core/router/app_router.dart';
import 'package:office_app/presentation/providers/character_providers.dart';
import 'package:office_app/presentation/providers/personalization_providers.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  _initDatabaseFactory();

  // Inicializar SharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
      ],
      child: const MyApp(),
    ),
  );
}

void _initDatabaseFactory() {
  if (kIsWeb) {
    databaseFactory = databaseFactoryFfiWeb;
    return;
  }
  if (defaultTargetPlatform == TargetPlatform.windows ||
      defaultTargetPlatform == TargetPlatform.linux ||
      defaultTargetPlatform == TargetPlatform.macOS) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }
}

/// Main app widget
class MyApp extends ConsumerWidget {
  /// Constructor
  const MyApp({super.key});

  static const double _maxMobileWidth = 430;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Carga variables personalizadas desde persistencia al inicio
    ref.watch(personalizationInitProvider);

    final router = ref.watch(appRouterProvider);

    final app = MaterialApp.router(
      title: 'The Office English Learning',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );

    // En web, limitar el ancho máximo a tamaño de celular
    if (kIsWeb) {
      return Container(
        color: Colors.white,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: _maxMobileWidth),
            child: app,
          ),
        ),
      );
    }

    return app;
  }
}
