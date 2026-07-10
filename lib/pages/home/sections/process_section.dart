import 'package:flutter/material.dart';

class ProcessSection extends StatelessWidget {
  const ProcessSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 80,
        vertical: 100,
      ),
      child: Column(
        children: [
          const Text(
            "Cómo construimos",
            style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          const SizedBox(
            width: 700,
            child: Text(
              "Cada herramienta sigue un proceso simple: entender el problema, diseñar una solución elegante y construir un software que realmente sea útil.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white70,
                height: 1.8,
              ),
            ),
          ),

          const SizedBox(height: 70),

          const Wrap(
            spacing: 35,
            runSpacing: 35,
            alignment: WrapAlignment.center,
            children: [

              _StepCard(
                icon: Icons.lightbulb_outline,
                title: "Idea",
                description: "Encontramos un problema real.",
              ),

              _StepCard(
                icon: Icons.draw_outlined,
                title: "Diseño",
                description: "Diseñamos una experiencia sencilla.",
              ),

              _StepCard(
                icon: Icons.code,
                title: "Desarrollo",
                description: "Construimos un software sólido.",
              ),

              _StepCard(
                icon: Icons.rocket_launch_outlined,
                title: "Lanzamiento",
                description: "Publicamos y seguimos mejorándolo.",
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StepCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _StepCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: const Color(0xFF202325),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xFF2F3438),
        ),
      ),
      child: Column(
        children: [

          Icon(
            icon,
            size: 42,
            color: Colors.lightBlueAccent,
          ),

          const SizedBox(height: 20),

          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 16),

          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white70,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}