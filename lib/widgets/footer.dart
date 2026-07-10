import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: 50,
        horizontal: 60,
      ),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Color(0xFF2A2D2F),
          ),
        ),
      ),
      child: Column(
        children: [
          const Text(
            "RIFFBYTE",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              letterSpacing: 4,
            ),
          ),

          const SizedBox(height: 18),

          const Text(
            "Software diseñado para resolver problemas reales.",
            style: TextStyle(
              color: Colors.white70,
            ),
          ),

          const SizedBox(height: 30),

          const Divider(),

          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "© 2026 Riffbyte",
                style: TextStyle(color: Colors.white54),
              ),
            ],
          ),
        ],
      ),
    );
  }
}