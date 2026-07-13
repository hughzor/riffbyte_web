import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../widgets/product_card.dart';

import '../../../utils/scroll_controller_service.dart';

class ProductsSection extends StatelessWidget {
  const ProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 80,
        vertical: 100,
      ),
      key: ScrollControllerService.productsKey,
      child: Column(
        children: [
          const Text(
            "Productos",
            style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 60),

          Wrap(
            spacing: 40,
            runSpacing: 40,
            alignment: WrapAlignment.center,
            children: [

              ProductCard(
                title: "InformeVentas",
                description:
                    "Genera informes PDF profesionales automáticamente a partir de archivos CSV.",

                icon: Icons.description_outlined,

                status: "Disponible",
                statusColor: Colors.green,

                features: const [
                  "Windows",
                  "PDF automático",
                  "Importación CSV",
                ],

                onPressed: () => context.go('/informeventas'),
              ),

              ProductCard(
                title: "Guitar Customizer",
                description:
                    "Diseña la guitarra perfecta antes de comprar una sola pieza.",

                icon: Icons.music_note,

                status: "Próximamente",
                statusColor: Colors.orange,

                features: const [
                  "IA",
                  "Catálogo",
                  "Presupuestos",
                ],

                onPressed: () => context.go('/guitar-customizer'),
              ),

            ],
          ),
        ],
      ),
    );
  }
}