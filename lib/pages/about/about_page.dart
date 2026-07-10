import 'package:flutter/material.dart';

import '../../layout/site_layout.dart';
import '/widgets/footer.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SiteLayout(
      child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1000),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),

                  const Text(
                    "Software built with purpose.",
                    style: TextStyle(
                      fontSize: 58,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 30),

                  const Text(
                    "Riffbyte desarrolla herramientas modernas para resolver problemas reales mediante un software rápido, intuitivo y bien diseñado.",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white70,
                      height: 1.8,
                    ),
                  ),

                  const SizedBox(height: 80),

                  const Text(
                    "Nuestra filosofía",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 40),

                  Row(
                    children: const [
                      Expanded(
                        child: _ValueCard(
                          icon: Icons.extension,
                          title: "Problemas reales",
                          description:
                              "Cada proyecto nace para solucionar una necesidad concreta.",
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: _ValueCard(
                          icon: Icons.flash_on,
                          title: "Simplicidad",
                          description:
                              "Interfaces limpias, rápidas y sin funciones innecesarias.",
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: _ValueCard(
                          icon: Icons.verified,
                          title: "Calidad",
                          description:
                              "Preferimos publicar una gran herramienta antes que diez mediocres.",
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 80),
                  
                  const Footer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ValueCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _ValueCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: const Color(0xFF202325),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 40),

          const SizedBox(height: 20),

          Text(
            title,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 16),

          Text(
            description,
            style: const TextStyle(
              color: Colors.white70,
              height: 1.7,
            ),
          ),
        ],
      ),
    );
  }
}