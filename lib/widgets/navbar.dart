import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../theme/app_colors.dart';
import 'logo.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();

    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
        child: Container(
          height: 90,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 60),
          decoration: BoxDecoration(
            color: const Color(0xCC181A1B),
            border: const Border(
              bottom: BorderSide(color: Color(0xFF2A2D2F), width: 1),
            ),
            boxShadow: const [
              BoxShadow(
                color: Color(0x33000000),
                blurRadius: 24,
                offset: Offset(0, 6),
              ),
            ],
          ),
          child: Row(
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () => context.go('/'),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Logo(),
                ),
              ),

              const Spacer(),

              _navButton(
                context,
                text: "InformeVentas",
                selected: location.startsWith('/informeventas'),
                onPressed: () => context.go('/informeventas'),
              ),

              const SizedBox(width: 10),

              _navButton(
                context,
                text: "Guitar Customizer",
                selected: location.startsWith('/guitar-customizer'),
                onPressed: () => context.go('/guitar-customizer'),
              ),

              const SizedBox(width: 10),

              _navButton(
                context,
                text: "Iniciar sesión",
                selected: location.startsWith('/login'),
                onPressed: () => context.go('/login'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navButton(
    BuildContext context, {
    required String text,
    required bool selected,
    required VoidCallback onPressed,
  }) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        overlayColor: AppColors.primary.withOpacity(.08),
        foregroundColor: selected ? AppColors.primary : Colors.white70,
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: AnimatedDefaultTextStyle(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,
        style: TextStyle(
          color: selected ? AppColors.primary : Colors.white70,
          fontSize: 15,
          fontWeight: selected ? FontWeight.bold : FontWeight.w500,
        ),
        child: Text(text),
      ),
    );
  }
}
