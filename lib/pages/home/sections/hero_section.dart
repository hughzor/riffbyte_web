import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';
import '../../../widgets/logo.dart';
import '../../../widgets/primary_button.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 700,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Logo(),

              const SizedBox(height: 40),

              const Text(
                "Software built with purpose.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 46,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 32),

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

              const SizedBox(height: 42),

              PrimaryButton(
                text: "Explorar productos",
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}