import 'package:flutter/material.dart';

import '../widgets/dashboard_sidebar.dart';

class DashboardLayout extends StatelessWidget {
  final Widget child;

  const DashboardLayout({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF181A1B),
      body: Row(
        children: [
          const DashboardSidebar(),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(60),
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}