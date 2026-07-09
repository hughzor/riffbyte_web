import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      "RIFFBYTE",
      style: TextStyle(
        fontSize: 42,
        fontWeight: FontWeight.bold,
        letterSpacing: 4,
      ),
    );
  }
}