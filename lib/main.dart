import 'package:flutter/material.dart';

import 'pages/home/home_page.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const RiffbyteApp());
}

class RiffbyteApp extends StatelessWidget {
  const RiffbyteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Riffbyte',
      theme: AppTheme.darkTheme,
      home: const HomePage(),
    );
  }
}