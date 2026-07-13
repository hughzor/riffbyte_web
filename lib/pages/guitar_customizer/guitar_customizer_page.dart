import 'package:flutter/material.dart';

import '../../layout/site_layout.dart';
import '../../widgets/footer.dart';

class GuitarCustomizerPage extends StatelessWidget {
  const GuitarCustomizerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SiteLayout(
      child: SingleChildScrollView(
        child: Column(
          children: [

            // HERO
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 60,
                vertical: 90,
              ),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1000),
                  child: Column(
                    children: [

                      const Icon(
                        Icons.audiotrack,
                        size: 90,
                      ),

                      const SizedBox(height: 30),

                      const Text(
                        "Guitar Customizer",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 54,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 25),

                      const Text(
                        "Un proyecto en desarrollo para ayudarte a visualizar modificaciones en tu guitarra antes de comprar las piezas.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white70,
                          height: 1.7,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const Divider(),

            // VISIÓN

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 60,
                vertical: 80,
              ),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1000),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      const Text(
                        "Nuestra visión",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 30),

                      const Text(
                        "Modificar una guitarra suele implicar comprar piezas sin saber exactamente cómo quedarán una vez instaladas. Guitar Customizer nace con el objetivo de reducir esa incertidumbre mediante una experiencia visual sencilla e intuitiva.",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white70,
                          height: 1.8,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const Divider(),

            // ESTADO

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 60,
                vertical: 80,
              ),
              child: Wrap(
                spacing: 30,
                runSpacing: 30,
                alignment: WrapAlignment.center,
                children: const [

                  _StatusCard(
                    icon: Icons.check_circle_outline,
                    title: "Concepto definido",
                    description:
                        "La idea y los objetivos principales ya están establecidos.",
                  ),

                  _StatusCard(
                    icon: Icons.construction_outlined,
                    title: "Desarrollo activo",
                    description:
                        "Actualmente estamos construyendo la primera versión.",
                  ),

                  _StatusCard(
                    icon: Icons.schedule,
                    title: "Funciones en evolución",
                    description:
                        "Las características finales pueden cambiar durante el desarrollo.",
                  ),
                ],
              ),
            ),

            const Divider(),

            // FUTURO

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 60,
                vertical: 80,
              ),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 900),
                  child: Column(
                    children: [

                      const Text(
                        "Ideas que estamos explorando",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 40),

                      const ListTile(
                        leading: Icon(Icons.palette_outlined),
                        title: Text("Cambios de colores y acabados"),
                      ),

                      const ListTile(
                        leading: Icon(Icons.memory_outlined),
                        title: Text("Reconocimiento de guitarras"),
                      ),

                      const ListTile(
                        leading: Icon(Icons.hardware_outlined),
                        title: Text("Catálogo de componentes"),
                      ),

                      const ListTile(
                        leading: Icon(Icons.attach_money),
                        title: Text("Estimación de presupuesto"),
                      ),

                      const ListTile(
                        leading: Icon(Icons.shopping_cart_outlined),
                        title: Text("Lista de piezas"),
                      ),

                      const SizedBox(height: 40),

                      const Text(
                        "Estas funcionalidades representan la dirección del proyecto y podrán evolucionar durante el desarrollo.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white60,
                          height: 1.7,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const Footer(),
          ],
        ),
      ),
    );
  }
}

class _StatusCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _StatusCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: const Color(0xFF202325),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xFF2F3438),
        ),
      ),
      child: Column(
        children: [

          Icon(
            icon,
            size: 42,
            color: Colors.lightBlueAccent,
          ),

          const SizedBox(height: 20),

          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 16),

          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white70,
              height: 1.7,
            ),
          ),
        ],
      ),
    );
  }
}