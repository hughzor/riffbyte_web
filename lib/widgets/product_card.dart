import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onPressed;

  const ProductCard({
    super.key,
    required this.title,
    required this.description,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: const Color(0xFF202325),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xFF2F3438),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.description_outlined,
            size: 42,
          ),

          const SizedBox(height: 20),

          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 16),

          Text(
            description,
            style: const TextStyle(
              color: AppColors.textSecondary,
              height: 1.6,
            ),
          ),

          const SizedBox(height: 30),

          InkWell(
            onTap: onPressed,
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Ver producto",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 8),
                Icon(
                  Icons.arrow_forward,
                  size: 18,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}