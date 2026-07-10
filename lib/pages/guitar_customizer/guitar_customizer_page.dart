import 'package:flutter/material.dart';

import '../../layout/site_layout.dart';

class GuitarCustomizerPage extends StatelessWidget {
  const GuitarCustomizerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SiteLayout(
      child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 900),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Guitar Customizer",
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "Diseña tu guitarra antes de gastar un euro.",
                    style: TextStyle(
                      fontSize: 56,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                  ),

                  const SizedBox(height: 30),

                  const Text(
                    "Combina colores, golpeadores, pastillas, clavijeros y hardware utilizando inteligencia artificial y una enorme base de datos.",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white70,
                      height: 1.7,
                    ),
                  ),

                  const SizedBox(height: 60),

                  Container(
                    height: 400,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFF202325),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                      child: Text(
                        "Vista previa próximamente",
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ),

                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}