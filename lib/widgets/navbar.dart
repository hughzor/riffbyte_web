import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'logo.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 60),
      decoration: const BoxDecoration(
        color: Color(0xCC181A1B),
        border: Border(
          bottom: BorderSide(
            color: Color(0xFF2A2D2F),
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () => context.go('/'),
            child: const Logo(),
          ),

          const Spacer(),

          _navButton(
            context,
            "InformeVentas",
            () => context.go('/informeventas'),
          ),

          _navButton(
            context,
            "Guitar Customizer",
            () => context.go('/guitar-customizer'),
          ),

          _navButton(
            context,
            "Sobre Riffbyte",
            () => context.go('/about'),
          ),

          _navButton(
            context,
            "Contacto",
            () {},
          ),
        ],
      ),
    );
  }

  Widget _navButton(
    BuildContext context,
    String text,
    VoidCallback onPressed,
  ) {
    return TextButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}