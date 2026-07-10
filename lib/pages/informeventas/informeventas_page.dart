import 'package:flutter/material.dart';

import '../../layout/site_layout.dart';
import '../../widgets/footer.dart';
import '../../widgets/primary_button.dart';

class InformeVentasPage extends StatelessWidget {
  const InformeVentasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SiteLayout(
      child: SingleChildScrollView(
        child: Column(
          children: [

            // HERO
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 60,
                vertical: 90,
              ),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1000),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      const Text(
                        "InformeVentas",
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 30),

                      const Text(
                        "Genera informes profesionales en segundos",
                        style: TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                          height: 1.2,
                        ),
                      ),

                      const SizedBox(height: 30),

                      const Text(
                        "Transforma un archivo CSV en un informe PDF con estadísticas, gráficos y un diseño profesional listo para entregar.",
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white70,
                          height: 1.6,
                        ),
                      ),

                      const SizedBox(height: 45),

                      Row(
                        children: [

                          PrimaryButton(
                            text: "Descargar",
                            onPressed: () {},
                          ),

                          const SizedBox(width: 20),

                          OutlinedButton(
                            onPressed: () {},
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 28,
                                vertical: 18,
                              ),
                              child: Text("Ver código"),
                            ),
                          ),

                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const Divider(),

            // CARACTERÍSTICAS
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 60,
                vertical: 70,
              ),
              child: Wrap(
                spacing: 25,
                runSpacing: 25,
                alignment: WrapAlignment.center,
                children: const [

                  _FeatureCard(
                    icon: Icons.picture_as_pdf,
                    title: "PDF profesional",
                  ),

                  _FeatureCard(
                    icon: Icons.bar_chart,
                    title: "Gráficas automáticas",
                  ),

                  _FeatureCard(
                    icon: Icons.upload_file,
                    title: "Importación CSV",
                  ),

                  _FeatureCard(
                    icon: Icons.flash_on,
                    title: "Proceso instantáneo",
                  ),
                ],
              ),
            ),

            const Divider(),

            // GALERÍA
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 60,
                vertical: 80,
              ),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [

                      Text(
                        "Así funciona",
                        style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 70),

                      ScreenshotSection(
                        image: "assets/images/informeventas_home.png",
                        title: "1. Selecciona un CSV",
                        description:
                            "Importa tus ventas con un solo clic.",
                      ),

                      ScreenshotSection(
                        image: "assets/images/informeventas_csv.png",
                        title: "2. Analiza los datos",
                        description:
                            "InformeVentas procesa automáticamente toda la información.",
                      ),

                      ScreenshotSection(
                        image: "assets/images/informeventas_pdf.png",
                        title: "3. Obtén un PDF profesional",
                        description:
                            "Con estadísticas, tablas y un diseño listo para entregar.",
                      ),

                      ScreenshotSection(
                        image: "assets/images/informeventas_chart.png",
                        title: "4. Visualiza la evolución",
                        description:
                            "Gráficas generadas automáticamente para facilitar el análisis.",
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const Divider(),

            // CTA FINAL
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 90),
              child: Column(
                children: [

                  const Text(
                    "Empieza a generar informes hoy mismo",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 30),

                  PrimaryButton(
                    text: "Descargar InformeVentas",
                    onPressed: () {},
                  ),

                ],
              ),
            ),

            const Footer(),

          ],
        ),
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;

  const _FeatureCard({
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      height: 150,
      decoration: BoxDecoration(
        color: const Color(0xFF202325),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Icon(
            icon,
            size: 40,
            color: Colors.lightBlueAccent,
          ),

          const SizedBox(height: 20),

          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class ScreenshotSection extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const ScreenshotSection({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            title,
            style: const TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          Text(
            description,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white70,
            ),
          ),

          const SizedBox(height: 35),

          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(image),
          ),

        ],
      ),
    );
  }
}