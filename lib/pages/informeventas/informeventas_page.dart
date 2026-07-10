import 'package:flutter/material.dart';

import '../../widgets/navbar.dart';
import '../../theme/app_colors.dart';
import '../../widgets/primary_button.dart';

class InformeVentasPage extends StatelessWidget {
  const InformeVentasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Navbar(),

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 80,
                vertical: 80,
              ),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      TextButton.icon(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back),
                        label: const Text("Volver"),
                      ),

                      const SizedBox(height: 40),

                      const Text(
                        "InformeVentas",
                        style: TextStyle(
                          fontSize: 54,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 24),

                      const Text(
                        "Genera informes PDF profesionales automáticamente a partir de archivos CSV en cuestión de segundos.",
                        style: TextStyle(
                          fontSize: 22,
                          color: AppColors.textSecondary,
                          height: 1.7,
                        ),
                      ),

                      const SizedBox(height: 60),

                      Container(
                        height: 420,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xFF25292C),
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(
                            color: const Color(0xFF34393D),
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            "Captura del programa",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 80),

                      const Text(
                        "Características",
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 30),

                      const FeatureTile("Generación automática de PDF"),
                      FeatureTile("Estadísticas de ventas"),
                      FeatureTile("Gráficos"),
                      FeatureTile("Importación CSV"),

                      const SizedBox(height: 80),

                      const Text(
                        "Precio",
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 24),

                      const Text(
                        "19,99 €",
                        style: TextStyle(
                          fontSize: 46,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),

                      const SizedBox(height: 40),

                      PrimaryButton(
                        text: "Comprar",
                        onPressed: () {},
                      ),

                      const SizedBox(height: 120),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FeatureTile extends StatelessWidget {
  final String text;

  const FeatureTile(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Row(
        children: [
          const Icon(
            Icons.check_circle,
            color: AppColors.primary,
          ),
          const SizedBox(width: 14),
          Text(
            text,
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}