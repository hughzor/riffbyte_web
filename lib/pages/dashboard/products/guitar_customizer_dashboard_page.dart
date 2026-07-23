import 'package:flutter/material.dart';

import '../../../layout/dashboard_layout.dart';

class DashboardGuitarCustomizerPage extends StatelessWidget {
  const DashboardGuitarCustomizerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DashboardLayout(
      child: Padding(
        padding: const EdgeInsets.all(80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Guitar Customizer",
              style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            const Text(
              "Estado del proyecto",
              style: TextStyle(color: Colors.white70, fontSize: 20),
            ),

            const SizedBox(height: 40),

            const Card(
              child: ListTile(
                leading: Icon(Icons.construction),
                title: Text("En desarrollo"),
                subtitle: Text("La aplicación todavía no está disponible."),
              ),
            ),

            const SizedBox(height: 40),

            const Text(
              "Próximas funciones",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            const Text("• IA para reconocer guitarras"),
            const Text("• Cambio de pastillas"),
            const Text("• Cambio de golpeador"),
            const Text("• Cambio de clavijeros"),
            const Text("• Presupuesto automático"),
          ],
        ),
      ),
    );
  }
}
