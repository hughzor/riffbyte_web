import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';
import '../../../widgets/primary_button.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 32,
          vertical: 120,
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Column(
              children: [
                const SizedBox(height: 60),

                const Text(
                  "Software built with purpose.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 52,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 36),

                const SizedBox(
                  width: 700,
                  child: Text(
                    "Diseñamos herramientas modernas que resuelven problemas reales mediante un software cuidado, intuitivo y eficiente.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: AppColors.textSecondary,
                      height: 1.8,
                    ),
                  ),
                ),

                const SizedBox(height: 48),

                PrimaryButton(
                  text: "Ver herramientas",
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}