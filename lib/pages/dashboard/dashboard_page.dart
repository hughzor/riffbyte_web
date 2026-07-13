import 'package:flutter/material.dart';

import '../../layout/site_layout.dart';
import '../../widgets/footer.dart';

import 'package:go_router/go_router.dart';

import '../../widgets/dashboard_product_card.dart';
import '../../widgets/dashboard_sidebar.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const DashboardSidebar(),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: const [
                  _WelcomeSection(),
                  _ProductsSection(),
                  _QuickActionsSection(),
                  Footer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _WelcomeSection extends StatelessWidget {
  const _WelcomeSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(80, 80, 80, 30),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(45),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF20262A), Color(0xFF181A1B)],
          ),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: const Color(0xFF31363A)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hola, Hugh 👋",
              style: Theme.of(
                context,
              ).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            const Text(
              "Bienvenido a tu panel de Riffbyte. Aquí podrás gestionar todos tus productos y licencias.",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white70,
                height: 1.7,
              ),
            ),

            const SizedBox(height: 45),

            Wrap(
              spacing: 24,
              runSpacing: 24,
              children: const [
                _StatCard(icon: Icons.apps, value: "2", label: "Productos"),
                _StatCard(
                  icon: Icons.verified,
                  value: "1",
                  label: "Licencia activa",
                ),
                _StatCard(
                  icon: Icons.update,
                  value: "0",
                  label: "Actualizaciones",
                ),
                _StatCard(
                  icon: Icons.check_circle,
                  value: "100%",
                  label: "Cuenta lista",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const _StatCard({
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF232729),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.lightBlueAccent, size: 34),

          const SizedBox(height: 18),

          Text(
            value,
            style: const TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 8),

          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }
}

class _ProductsSection extends StatelessWidget {
  const _ProductsSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Tus productos",
            style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 45),

          Wrap(
            spacing: 35,
            runSpacing: 35,
            children: [
              DashboardProductCard(
                icon: Icons.description_outlined,
                title: "InformeVentas",
                subtitle:
                    "Generador automático de informes PDF a partir de archivos CSV.",

                version: "Versión 1.0",
                status: "Disponible",
                statusColor: Colors.green,

                onPressed: () {
                  context.go('/informeventas');
                },
              ),

              DashboardProductCard(
                icon: Icons.music_note,
                title: "Guitar Customizer",
                subtitle: "Diseña tu guitarra antes de comprar una sola pieza.",

                version: "En desarrollo",
                status: "Próximamente",
                statusColor: Colors.orange,

                onPressed: () {
                  context.go('/guitar-customizer');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _QuickActionsSection extends StatelessWidget {
  const _QuickActionsSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(80, 100, 80, 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Acciones rápidas",
            style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 40),

          Wrap(
            spacing: 25,
            runSpacing: 25,
            children: const [
              _ActionTile(icon: Icons.shopping_bag_outlined, title: "Comprar"),
              _ActionTile(icon: Icons.download_outlined, title: "Descargas"),
              _ActionTile(icon: Icons.settings_outlined, title: "Ajustes"),
            ],
          ),
        ],
      ),
    );
  }
}

class _ActionTile extends StatelessWidget {
  final IconData icon;
  final String title;

  const _ActionTile({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 130,
      decoration: BoxDecoration(
        color: const Color(0xFF202325),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 34),

          const SizedBox(height: 14),

          Text(title),
        ],
      ),
    );
  }
}
