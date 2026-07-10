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
      body: Column(
        children: [
          const Navbar(),

          Expanded(
            child: child,
          ),
        ],
      ),
    );
  }
}