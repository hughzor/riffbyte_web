import 'dart:convert';
import 'dart:html' as html;
import 'package:flutter/services.dart';

class DownloadService {
  static Future<void> downloadSampleCsv() async {
    final csv = await rootBundle.loadString('assets/sample_csv/ejemplo.csv');

    final blob = html.Blob(['\uFEFF$csv'], 'text/csv;charset=utf-8');

    final url = html.Url.createObjectUrlFromBlob(blob);

    html.AnchorElement(href: url)
      ..download = 'InformeVentas_Ejemplo.csv'
      ..click();

    html.Url.revokeObjectUrl(url);
  }

  static Future<void> downloadExamplePdf() async {
    final data = await rootBundle.load('assets/sample_csv/informe_ejemplo.pdf');

    final bytes = data.buffer.asUint8List();

    final blob = html.Blob([bytes]);

    final url = html.Url.createObjectUrlFromBlob(blob);

    html.AnchorElement(href: url)
      ..download = "InformeVentas_Ejemplo.pdf"
      ..click();

    html.Url.revokeObjectUrl(url);
  }
}
