import 'package:flutter/material.dart';

import 'logo.dart';

import '../pages/about/about_page.dart';

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
          const Logo(),

          const Spacer(),

          _navButton("Productos", () {}),

          _navButton("Sobre Riffbyte", () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const AboutPage(),
              ),
            );
          }          ),

          _navButton("Contacto", () {}),
                  ],
                ),
              );
            }

  Widget _navButton(
    String text,
   VoidCallback onPressed,
  ) {
    return TextButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}