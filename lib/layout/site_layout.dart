import 'package:flutter/material.dart';

import '../widgets/navbar.dart';

class SiteLayout extends StatelessWidget {
  final Widget child;

  const SiteLayout({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Contenido
          Padding(
            padding: const EdgeInsets.only(top: 90),
            child: child,
          ),

          // Navbar siempre visible
          const Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Navbar(),
          ),
        ],
      ),
    );
  }
}