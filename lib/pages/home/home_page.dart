import 'package:flutter/material.dart';

import '../../widgets/navbar.dart';
import 'sections/hero_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          HeroSection(),
          Navbar(),
        ],
      ),
    );
  }
}