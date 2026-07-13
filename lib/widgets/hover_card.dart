import 'package:flutter/material.dart';

class HoverCard extends StatefulWidget {
  final Widget child;

  const HoverCard({
    super.key,
    required this.child,
  });

  @override
  State<HoverCard> createState() => _HoverCardState();
}

class _HoverCardState extends State<HoverCard> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,

      onEnter: (_) {
        setState(() {
          _hovering = true;
        });
      },

      onExit: (_) {
        setState(() {
          _hovering = false;
        });
      },

      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,

        transform: Matrix4.translationValues(
          0,
          _hovering ? -8 : 0,
          0,
        ),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),

          border: Border.all(
            color: _hovering
                ? const Color(0xFF4D9EFF)
                : const Color(0xFF2F3438),
          ),

          boxShadow: _hovering
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.35),
                    blurRadius: 25,
                    offset: const Offset(0, 12),
                  ),
                ]
              : [],
        ),

        child: widget.child,
      ),
    );
  }
}