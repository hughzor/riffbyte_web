import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      "RIFFBYTE",
      style: TextStyle(
        color: AppColors.text,
        fontSize: 30,
        fontWeight: FontWeight.w900,
        letterSpacing: 5,
      ),
    );
  }
}