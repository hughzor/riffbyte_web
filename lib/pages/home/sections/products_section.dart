import 'package:flutter/material.dart';

import '../../../widgets/product_card.dart';

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
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}