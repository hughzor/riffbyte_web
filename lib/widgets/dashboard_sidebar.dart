import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../theme/app_colors.dart';

class DashboardSidebar extends StatelessWidget {
  const DashboardSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();

    return Container(
      width: 250,
      decoration: const BoxDecoration(
        color: Color(0xFF181A1B),
        border: Border(right: BorderSide(color: Color(0xFF2A2D2F))),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: () => context.go('/'),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 6),
                child: Text(
                  "RIFFBYTE",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 50),

            _item(
              context,
              icon: Icons.dashboard_outlined,
              text: "Dashboard",
              selected: location == '/dashboard',
              onTap: () => context.go('/dashboard'),
            ),

            _item(
              context,
              icon: Icons.description_outlined,
              text: "InformeVentas",
              selected: location.startsWith('/dashboard/informeventas'),
              onTap: () => context.go('/dashboard/informeventas'),
            ),

            _item(
              context,
              icon: Icons.music_note_outlined,
              text: "Guitar Customizer",
              selected: location.startsWith('/dashboard/guitar-customizer'),
              onTap: () => context.go('/dashboard/guitar-customizer'),
            ),

            _item(
              context,
              icon: Icons.settings_outlined,
              text: "Ajustes",
              selected: location == '/settings',
              onTap: () => context.go('/settings'),
            ),

            const Spacer(),

            const Divider(),

            const SizedBox(height: 20),

            TextButton.icon(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();

                if (context.mounted) {
                  context.go('/');
                }

                if (context.mounted) {
                  context.go('/');
                }
              },
              icon: const Icon(Icons.logout),
              label: const Text("Cerrar sesión"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _item(
    BuildContext context, {
    required IconData icon,
    required String text,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Material(
        color: selected
            ? AppColors.primary.withOpacity(.15)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: selected ? AppColors.primary : Colors.white70,
                ),

                const SizedBox(width: 16),

                Text(
                  text,
                  style: TextStyle(
                    color: selected ? AppColors.primary : Colors.white70,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
