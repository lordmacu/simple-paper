import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:office_app/presentation/screens/main_screen.dart';
import 'package:office_app/presentation/screens/home/home_screen.dart';
import 'package:office_app/presentation/screens/profile/profile_screen.dart';
import 'package:office_app/presentation/screens/settings/settings_screen.dart';
import 'package:office_app/presentation/screens/review/review_home_screen.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/home',
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return MainScreen(child: child);
        },
        routes: [
          GoRoute(
            path: '/home',
            pageBuilder: (context, state) =>
                _fadeSlidePage(const HomeScreen(), state),
          ),
          GoRoute(
            path: '/profile',
            pageBuilder: (context, state) =>
                _fadeSlidePage(const ProfileScreen(), state),
          ),
          GoRoute(
            path: '/settings',
            pageBuilder: (context, state) =>
                _fadeSlidePage(const SettingsScreen(), state),
          ),
          GoRoute(
            path: '/review',
            pageBuilder: (context, state) =>
                _fadeSlidePage(const ReviewHomeScreen(), state),
          ),
        ],
      ),
    ],
  );
});

CustomTransitionPage _fadeSlidePage(Widget child, GoRouterState state) {
  return CustomTransitionPage(
    key: state.pageKey,
    transitionDuration: const Duration(milliseconds: 320),
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final curved = CurvedAnimation(
        parent: animation,
        curve: Curves.easeOutCubic,
        reverseCurve: Curves.easeInCubic,
      );
      final offsetAnimation = Tween<Offset>(
        begin: const Offset(0.04, 0.02),
        end: Offset.zero,
      ).animate(curved);

      return FadeTransition(
        opacity: curved,
        child: SlideTransition(
          position: offsetAnimation,
          child: child,
        ),
      );
    },
  );
}
