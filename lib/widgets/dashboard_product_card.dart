import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class DashboardProductCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String version;
  final String lastUpdate;
  final String buttonText;
  final Color statusColor;
  final String status;
  final VoidCallback onPressed;

  const DashboardProductCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.version,
    required this.lastUpdate,
    required this.buttonText,
    required this.status,
    required this.statusColor,
    required this.onPressed,
  });

  @override
  State<DashboardProductCard> createState() => _DashboardProductCardState();
}

class _DashboardProductCardState extends State<DashboardProductCard> {
  bool hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => hovering = true),
      onExit: (_) => setState(() => hovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,
        width: 360,
        padding: const EdgeInsets.all(28),
        transform: Matrix4.identity()..translate(0.0, hovering ? -6.0 : 0.0),
        decoration: BoxDecoration(
          color: hovering ? const Color(0xFF25292C) : const Color(0xFF202325),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: hovering ? AppColors.primary : const Color(0xFF31363A),
          ),
          boxShadow: hovering
              ? [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(.15),
                    blurRadius: 22,
                    offset: const Offset(0, 10),
                  ),
                ]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(widget.icon, size: 46, color: AppColors.primary),

                const Spacer(),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
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
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            Text(
              widget.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Text(
              widget.subtitle,
              style: const TextStyle(
                color: AppColors.textSecondary,
                height: 1.6,
              ),
            ),

            const SizedBox(height: 24),

            const Divider(),

            const SizedBox(height: 20),

            const Text("Versión", style: TextStyle(color: Colors.white54)),

            const SizedBox(height: 4),

            Text(
              widget.version,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),

            const SizedBox(height: 18),

            const Text(
              "Última actualización",
              style: TextStyle(color: Colors.white54),
            ),

            const SizedBox(height: 4),

            Text(widget.lastUpdate),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: widget.onPressed,
                icon: const Icon(Icons.arrow_forward),
                label: Text(widget.buttonText),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
