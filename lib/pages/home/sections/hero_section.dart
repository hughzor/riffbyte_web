import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../theme/app_colors.dart';
import '../../../utils/scroll_controller_service.dart';
import '../../../widgets/primary_button.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 90,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF1D2327),
            Color(0xFF181A1B),
            Color(0xFF141617),
          ],
        ),
      ),
      child: Stack(
        children: [
          // Brillo azul
          Positioned(
            top: -220,
            left: -180,
            child: Container(
              width: 550,
              height: 550,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue.withOpacity(0.08),
              ),
            ),
          ),

          // Brillo verde
          Positioned(
            bottom: -250,
            right: -180,
            child: Container(
              width: 500,
              height: 500,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green.withOpacity(0.05),
              ),
            ),
          ),

          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 80,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Software construido con propósito",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 60,
                      height: 1.15,
                      letterSpacing: -1,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  )
                      .animate()
                      .fadeIn(
                        duration: 900.ms,
                        curve: Curves.easeOut,
                      )
                      .slideY(
                        begin: 0.35,
                        end: 0,
                        duration: 900.ms,
                        curve: Curves.easeOutCubic,
                      ),

                  const SizedBox(height: 40),

                  SizedBox(
                    width: 760,
                    child: const Text(
                      "Creamos herramientas modernas, intuitivas y eficientes para simplificar tareas reales mediante un software cuidado hasta el último detalle.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w300,
                        color: AppColors.textSecondary,
                        height: 1.9,
                      ),
                    ),
                  )
                      .animate(delay: 250.ms)
                      .fadeIn(
                        duration: 900.ms,
                        curve: Curves.easeOut,
                      )
                      .slideY(
                        begin: 0.35,
                        end: 0,
                        duration: 900.ms,
                        curve: Curves.easeOutCubic,
                      ),

                  const SizedBox(height: 55),

                  PrimaryButton(
                    text: "Ver herramientas",
                    onPressed: () {
                      final context =
                          ScrollControllerService.productsKey.currentContext;

                      if (context != null) {
                        Scrollable.ensureVisible(
                          context,
                          duration: const Duration(milliseconds: 700),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                  )
                      .animate(delay: 500.ms)
                      .fadeIn(
                        duration: 900.ms,
                        curve: Curves.easeOut,
                      )
                      .slideY(
                        begin: 0.35,
                        end: 0,
                        duration: 900.ms,
                        curve: Curves.easeOutCubic,
                      ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}