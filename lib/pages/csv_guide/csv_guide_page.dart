import 'package:flutter/material.dart';

import '../../layout/site_layout.dart';
import '../../widgets/footer.dart';
import '../../widgets/primary_button.dart';

class CsvGuidePage extends StatelessWidget {
  const CsvGuidePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SiteLayout(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 80),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1000),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Formato del CSV",
                        style: TextStyle(
                          fontSize: 52,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 24),

                      const Text(
                        "InformeVentas necesita un archivo CSV con una estructura determinada. "
                        "Sigue este formato y podrás generar informes sin problemas.",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white70,
                          height: 1.7,
                        ),
                      ),

                      const SizedBox(height: 60),

                      const Text(
                        "Columnas obligatorias",
                        style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 20),

                      Table(
                        border: TableBorder.all(color: Colors.white24),
                        columnWidths: const {
                          0: FlexColumnWidth(),
                          1: FlexColumnWidth(2),
                        },
                        children: const [
                          TableRow(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(12),
                                child: Text(
                                  "Columna",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(12),
                                child: Text(
                                  "Descripción",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(12),
                                child: Text("fecha"),
                              ),
                              Padding(
                                padding: EdgeInsets.all(12),
                                child: Text("Fecha de la venta"),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(12),
                                child: Text("producto"),
                              ),
                              Padding(
                                padding: EdgeInsets.all(12),
                                child: Text("Nombre del producto"),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(12),
                                child: Text("unidades"),
                              ),
                              Padding(
                                padding: EdgeInsets.all(12),
                                child: Text("Cantidad vendida"),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(12),
                                child: Text("precio"),
                              ),
                              Padding(
                                padding: EdgeInsets.all(12),
                                child: Text("Precio por unidad"),
                              ),
                            ],
                          ),
                        ],
                      ),

                      const SizedBox(height: 60),

                      const Text(
                        "Ejemplo",
                        style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 20),

                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF202325),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.white12),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Table(
                          border: TableBorder.all(
                            color: Colors.white12,
                            width: 1,
                          ),
                          columnWidths: const {
                            0: FlexColumnWidth(2),
                            1: FlexColumnWidth(3),
                            2: FlexColumnWidth(2),
                            3: FlexColumnWidth(2),
                          },
                          children: const [
                            TableRow(
                              decoration: BoxDecoration(
                                color: Color(0xFF2A2D2F),
                              ),
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(14),
                                  child: Text(
                                    "fecha",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),

                                Padding(
                                  padding: EdgeInsets.all(14),
                                  child: Text(
                                    "producto",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),

                                Padding(
                                  padding: EdgeInsets.all(14),
                                  child: Text(
                                    "unidades",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),

                                Padding(
                                  padding: EdgeInsets.all(14),
                                  child: Text(
                                    "precio",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            TableRow(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(14),
                                  child: Text("01/01/2026"),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(14),
                                  child: Text("Café"),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(14),
                                  child: Text("20"),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(14),
                                  child: Text("1.50"),
                                ),
                              ],
                            ),

                            TableRow(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(14),
                                  child: Text("01/01/2026"),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(14),
                                  child: Text("Tostada"),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(14),
                                  child: Text("12"),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(14),
                                  child: Text("2.00"),
                                ),
                              ],
                            ),

                            TableRow(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(14),
                                  child: Text("02/01/2026"),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(14),
                                  child: Text("Zumo"),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(14),
                                  child: Text("8"),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(14),
                                  child: Text("2.30"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),

                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1F2A33),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.info_outline,
                              color: Colors.lightBlueAccent,
                            ),

                            SizedBox(width: 15),

                            Expanded(
                              child: Text(
                                "Este es únicamente un ejemplo. El archivo puede contener cientos o miles de ventas siempre que mantenga la misma estructura.",
                                style: TextStyle(
                                  height: 1.6,
                                  color: Colors.white70,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 60),

                      const Text(
                        "Requisitos",
                        style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 20),

                      const Text(
                        "• La primera fila debe contener los nombres de las columnas.\n"
                        "• El archivo debe estar en formato .csv.\n"
                        "• Utiliza una coma (,) como separador.\n"
                        "• Cada fila representa una venta.\n"
                        "• El precio debe ser un número decimal.",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white70,
                          height: 1.8,
                        ),
                      ),

                      const SizedBox(height: 70),

                      Center(
                        child: PrimaryButton(
                          text: "Descargar CSV de ejemplo",
                          onPressed: () {},
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
