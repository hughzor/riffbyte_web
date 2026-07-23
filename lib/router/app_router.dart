import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../pages/home/home_page.dart';
import '../pages/informeventas/informeventas_page.dart';
import '../pages/guitar_customizer/guitar_customizer_page.dart';
import '../pages/csv_guide/csv_guide_page.dart';
import '../pages/login/login_page.dart';
import '../pages/register/register_page.dart';
import '../pages/register/verify_email_page.dart';
import '../pages/dashboard/dashboard_page.dart';
import '../pages/dashboard/products/informeventas_dashboard_page.dart';
import '../pages/dashboard/products/guitar_customizer_dashboard_page.dart';
import '../pages/settings/settings_page.dart';

import 'dart:async';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',

  refreshListenable: GoRouterRefreshStream(
    FirebaseAuth.instance.authStateChanges(),
  ),

  redirect: (context, state) {
    final user = FirebaseAuth.instance.currentUser;

    final loggedIn = user != null && user.emailVerified;

    final loggingIn =
        state.matchedLocation == '/login' ||
        state.matchedLocation == '/register';

    final protectedRoutes = [
      '/dashboard',
      '/dashboard/informeventas',
      '/dashboard/guitar-customizer',
      '/settings',
    ];

    if (!loggedIn && protectedRoutes.contains(state.matchedLocation)) {
      return '/login';
    }

    if (loggedIn && loggingIn) {
      return '/dashboard';
    }

    return null;
  },

  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomePage()),

    GoRoute(
      path: '/informeventas',
      builder: (context, state) => const InformeVentasPage(),
    ),

    GoRoute(
      path: '/guitar-customizer',
      builder: (context, state) => const GuitarCustomizerPage(),
    ),

    GoRoute(
      path: '/informeventas/csv',
      builder: (context, state) => const CsvGuidePage(),
    ),

    GoRoute(path: '/login', builder: (context, state) => const LoginPage()),

    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterPage(),
    ),

    GoRoute(
      path: '/dashboard',
      builder: (context, state) => const DashboardPage(),
    ),
    GoRoute(
      path: '/dashboard/informeventas',
      builder: (context, state) => const DashboardInformeVentasPage(),
    ),
    GoRoute(
      path: '/dashboard/guitar-customizer',
      builder: (context, state) => const DashboardGuitarCustomizerPage(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsPage(),
    ),
    GoRoute(
      path: '/verify-email',
      builder: (context, state) {
        final email = state.extra as String;

        return VerifyEmailPage(email: email);
      },
    ),
  ],
);

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();

    _subscription = stream.asBroadcastStream().listen((_) => notifyListeners());
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
