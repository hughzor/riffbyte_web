import 'package:flutter/material.dart';

import '../../layout/site_layout.dart';
import '../../widgets/primary_button.dart';
import '/widgets/footer.dart';

class InformeVentasPage extends StatelessWidget {
  const InformeVentasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SiteLayout(
      child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 900),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "InformeVentas",
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "Genera informes profesionales en segundos",
                    style: TextStyle(
                      fontSize: 56,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                  ),

                  const SizedBox(height: 30),

                  const Text(
                    "InformeVentas transforma un simple archivo CSV en un informe PDF con estadísticas, gráficos y un diseño profesional listo para entregar.",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white70,
                      height: 1.7,
                    ),
                  ),

                  const SizedBox(height: 40),

                  Row(
                    children: [
                      PrimaryButton(
                        text: "Descargar",
                        onPressed: () {},
                      ),

                      const SizedBox(width: 20),

                      OutlinedButton(
                        onPressed: () {},
                        child: const Text("Ver código"),
                      ),
                    ],
                  ),

                  const SizedBox(height: 60),

                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: 2.8,
                    children: const [
                      _FeatureCard("📄", "PDF automático"),
                      _FeatureCard("📊", "Gráficas"),
                      _FeatureCard("📁", "Importación CSV"),
                      _FeatureCard("⚡", "Proceso en segundos"),
                    ],
                  ),

                  const SizedBox(height: 80),

                  Center(
                    child: PrimaryButton(
                      text: "Descargar InformeVentas",
                      onPressed: () {},
                    ),
                  ),

                  const SizedBox(height: 80),
                  
                  const Footer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final String icon;
  final String title;

  const _FeatureCard(this.icon, this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: const Color(0xFF202325),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(icon, style: const TextStyle(fontSize: 34)),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}