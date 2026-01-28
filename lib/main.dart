import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:office_app/core/theme/app_theme.dart';
import 'package:office_app/core/router/app_router.dart';
import 'package:office_app/presentation/providers/character_providers.dart';
import 'package:office_app/presentation/providers/personalization_providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
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

/// Main app widget
class MyApp extends ConsumerWidget {
  /// Constructor
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Carga variables personalizadas desde persistencia al inicio
    ref.watch(personalizationInitProvider);

    final router = ref.watch(appRouterProvider);

    return MaterialApp.router(
      title: 'The Office English Learning',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
