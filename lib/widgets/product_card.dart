import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class ProductCard extends StatefulWidget {
  final String title;
  final String description;
  final VoidCallback onPressed;
  final IconData icon;
  final String status;
  final Color statusColor;
  final List<String> features;

  const ProductCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.status,
    required this.statusColor,
    required this.features,
    required this.onPressed,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => hovering = true),
      onExit: (_) => setState(() => hovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOutCubic,

        width: 340,
        padding: const EdgeInsets.all(30),

        transform: Matrix4.identity()
          ..translate(0.0, hovering ? -8.0 : 0.0),

        decoration: BoxDecoration(
          color: hovering
              ? const Color(0xFF25292C)
              : const Color(0xFF202325),

          borderRadius: BorderRadius.circular(20),

          border: Border.all(
            color: hovering
                ? AppColors.primary
                : const Color(0xFF31363A),
          ),

          boxShadow: hovering
              ? [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(.12),
                    blurRadius: 28,
                    spreadRadius: 0,
                    offset: const Offset(0, 14),
                  ),
                ]
              : [
                  const BoxShadow(
                    color: Color(0x22000000),
                    blurRadius: 12,
                    offset: Offset(0, 6),
                  ),
                ],
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: widget.statusColor.withOpacity(.15),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  widget.status,
                  style: TextStyle(
                    color: widget.statusColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Icon(
              widget.icon,
              size: 54,
              color: AppColors.primary,
            ),

            const SizedBox(height: 24),

            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 18),

            Text(
              widget.description,
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 16,
                height: 1.7,
              ),
            ),

            const SizedBox(height: 26),

            ...widget.features.map(_Feature.new),

            const SizedBox(height: 32),

            InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: widget.onPressed,
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Ver producto",
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(
                      Icons.arrow_forward,
                      size: 18,
                      color: AppColors.primary,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Feature extends StatelessWidget {
  final String text;

  const _Feature(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          const Icon(
            Icons.circle,
            size: 7,
            color: AppColors.primary,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: AppColors.textSecondary,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}