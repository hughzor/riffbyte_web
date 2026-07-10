import 'package:flutter/material.dart';

class InformeVentasPage extends StatelessWidget {
  const InformeVentasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("InformeVentas"),
        backgroundColor: const Color(0xFF181A1B),
      ),
      body: SingleChildScrollView(
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
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 24),

                      const Text(
                        "InformeVentas transforma un simple archivo CSV en un informe PDF con estadísticas, gráficos y un diseño profesional listo para entregar.",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white70,
                          height: 1.7,
                        ),
                      ),
              
                      const SizedBox(height: 40),
            
                      Row(
                        children: [
                          FilledButton(
                            onPressed: () {},
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 16,
                              ),
                              child: Text("Descargar"),
                            ),
                          ),
              
                          const SizedBox(width: 20),
            
                          OutlinedButton(
                            onPressed: () {},
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 16,
                              ),
                              child: Text("Ver código"),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 50),

                      Wrap(
                        spacing: 20,
                        runSpacing: 20,
                        children: [
                          _feature("📄", "PDF automático"),
                          _feature("📊", "Gráficas"),
                          _feature("📁", "Importación CSV"),
                          _feature("⚡", "Proceso en segundos"),
                        ],
                      ),

                      const SizedBox(height: 60),

                      FilledButton(
                        onPressed: () {},
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 16,
                          ),
                          child: Text("Descargar"),
                        ),
                      ),

                      const SizedBox(height: 70),

                      Container(
                        height: 420,
                        decoration: BoxDecoration(
                          color: const Color(0xFF25282B),
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(
                            color: Colors.white10,
                          ),
                        ),

                        child: const Center(
                          child: Text(
                            "Captura del programa",
                            style: TextStyle(
                              color: Colors.white38,
                              fontSize: 24,
                            ),
                          ),
                       ),
                      ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _feature(String emoji, String text) {
    return Container(
      width: 180,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF202325),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          Text(
            emoji,
            style: const TextStyle(fontSize: 30),
          ),
          const SizedBox(height: 12),
          Text(text),
        ],
      ),
    );
  }
}