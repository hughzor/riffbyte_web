import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sobre Riffbyte"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1100),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 70,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const Text(
                    "Software built with purpose.",
                    style: TextStyle(
                      fontSize: 52,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 28),

                  const Text(
                    "Riffbyte desarrolla herramientas modernas para resolver problemas reales mediante un software rápido, intuitivo y bien diseñado.",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white70,
                      height: 1.7,
                    ),
                  ),

                  const SizedBox(height: 90),

                  const Text(
                    "Nuestra filosofía",
                    style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 40),

                  Wrap(
                    spacing: 30,
                    runSpacing: 30,
                    children: const [
                      _ValueCard(
                        icon: Icons.extension,
                        title: "Problemas reales",
                        text:
                            "Cada proyecto nace para solucionar una necesidad concreta.",
                      ),
                      _ValueCard(
                        icon: Icons.bolt,
                        title: "Simplicidad",
                        text:
                            "Interfaces limpias, rápidas y sin funciones innecesarias.",
                      ),
                      _ValueCard(
                        icon: Icons.verified,
                        title: "Calidad",
                        text:
                            "Preferimos publicar una gran herramienta antes que diez mediocres.",
                      ),
                    ],
                  ),

                  const SizedBox(height: 100),

                  const Text(
                    "Tecnologías",
                    style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 40),

                  Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    children: const [
                      _TechChip("Flutter"),
                      _TechChip("Dart"),
                      _TechChip("Python"),
                      _TechChip("Git"),
                      _TechChip("GitHub"),
                      _TechChip("Firebase"),
                    ],
                  ),
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
  final String text;

  const _ValueCard({
    required this.icon,
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 310,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: const Color(0xFF202325),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Icon(
            icon,
            size: 40,
            color: Colors.lightBlueAccent,
          ),

          const SizedBox(height: 20),

          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 16),

          Text(
            text,
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

class _TechChip extends StatelessWidget {
  final String name;

  const _TechChip(this.name);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 22,
        vertical: 14,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF202325),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        name,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}