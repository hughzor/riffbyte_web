import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'router/app_router.dart';
import 'services/auth_service.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AuthService(),
      child: const RiffbyteApp(),
    ),
  );
}

class RiffbyteApp extends StatelessWidget {
  const RiffbyteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Riffbyte',
      theme: AppTheme.darkTheme,
      routerConfig: appRouter,
    );
  }
}