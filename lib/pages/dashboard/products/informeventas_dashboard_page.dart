import 'package:flutter/material.dart';

import '../../../layout/dashboard_layout.dart';

class DashboardInformeVentasPage extends StatelessWidget {
  const DashboardInformeVentasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DashboardLayout(
      child: Padding(
        padding: const EdgeInsets.all(80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "InformeVentas",
              style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            const Text(
              "Gestiona tu instalación de InformeVentas.",
              style: TextStyle(color: Colors.white70, fontSize: 18),
            ),

            const SizedBox(height: 50),

            Wrap(
              spacing: 25,
              runSpacing: 25,
              children: const [
                _Card(title: "Versión", value: "1.0.0"),
                _Card(title: "Estado", value: "Disponible"),
                _Card(title: "Última actualización", value: "Julio 2026"),
              ],
            ),

            const SizedBox(height: 50),

            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.download),
              label: Text("Descargar última versión"),
            ),
          ],
        ),
      ),
    );
  }
}

class _Card extends StatelessWidget {
  final String title;
  final String value;

  const _Card({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF202325),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(color: Colors.white54)),
          const SizedBox(height: 10),
          Text(
            value,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
