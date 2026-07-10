import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../pages/home/home_page.dart';
import '../pages/about/about_page.dart';
import '../pages/informeventas/informeventas_page.dart';
import '../pages/guitar_customizer/guitar_customizer_page.dart';
import '../pages/csv_guide/csv_guide_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/informeventas',
      builder: (context, state) => const InformeVentasPage(),
    ),
    GoRoute(
      path: '/about',
      builder: (context, state) => const AboutPage(),
    ),
    GoRoute(
      path: '/guitar-customizer',
      builder: (context, state) => const GuitarCustomizerPage(),
    ),
    GoRoute(
      path: '/informeventas/csv',
      builder: (context, state) => const CsvGuidePage(),
    ),
  ],
);