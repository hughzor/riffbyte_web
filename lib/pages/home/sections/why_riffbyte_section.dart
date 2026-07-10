import 'package:flutter/material.dart';

class WhyRiffbyteSection extends StatelessWidget {
  const WhyRiffbyteSection({super.key});

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
            "¿Por qué Ryffbyte?",
            style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          const SizedBox(
            width: 700,
            child: Text(
              "Creamos herramientas modernas para resolver problemas reales mediante un software rápido, intuitivo y bien diseñado.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white70,
                height: 1.8,
              ),
            ),
          ),

          const SizedBox(height: 70),

          Wrap(
            spacing: 30,
            runSpacing: 30,
            alignment: WrapAlignment.center,
            children: const [
              _InfoCard(
                icon: Icons.psychology_outlined,
                title: "Problemas reales",
                description:
                    "Cada producto nace para solucionar una necesidad concreta.",
              ),

              _InfoCard(
                icon: Icons.flash_on_outlined,
                title: "Rápido",
                description:
                    "Software ligero, intuitivo y pensado para trabajar sin distracciones.",
              ),

              _InfoCard(
                icon: Icons.workspace_premium_outlined,
                title: "Calidad",
                description:
                    "Preferimos lanzar un gran producto antes que diez mediocres.",
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _InfoCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      padding: const EdgeInsets.all(30),
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
            size: 46,
            color: Colors.lightBlueAccent,
          ),

          const SizedBox(height: 25),

          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 18),

          Text(
            description,
            textAlign: TextAlign.center,
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