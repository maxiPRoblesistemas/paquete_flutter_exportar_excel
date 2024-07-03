import 'package:flutter/material.dart';
import 'package:paquete_syncfusion_exportar_excel/home/results.dart';
import 'package:paquete_syncfusion_exportar_excel/home/web_save_excel.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';
import 'dart:typed_data';

part 'home_page_func.dart';

class ExportarDatosToExcel extends StatefulWidget {
  const ExportarDatosToExcel({super.key});

  @override
  State<ExportarDatosToExcel> createState() => _ExportarDatosToExcelState();
}

class _ExportarDatosToExcelState extends State<ExportarDatosToExcel> {
  // Esquemas de datos
  Map<String, dynamic> schema = Results().esquema;

  // Lista de encabezados
  List<String> listaEncabezados = [];

  bool isExporting = false;

  double progress = 0.0;

  // Lista de datos
  List<Map<String, dynamic>> listData = Results().generateData(5000);

  // Nombre del archivo
  String fileName = "archivo_excel_prueba";


  /// Esta función gestiona el estado de la exportación,
  /// actualiza la interfaz de usuario para mostrar el progreso, 
  /// y se asegura de que la exportación de datos se ejecute en segundo plano 
  /// sin bloquear la interfaz de usuario principal.
  Future<void> _exportData(List<Map<String, dynamic>> data, String fileName,
      Map<String, dynamic> schema, List<String> listaEncabezados) async {
    // Actualiza el estado del widget para indicar que la exportación ha comenzado.
    setState(() {
      isExporting = true;
      progress = 0.0;
    });

    // Llama a la función `generaArchivoExcel`, que ahora es asincrónica, para exportar los datos.
    // La función `await` se asegura de que este código espere a que `generaArchivoExcel` termine antes de continuar.
    await generaArchivoExcel(
        data: data,
        fileName: fileName,
        schema: schema,
        listaEncabezados: listaEncabezados,
        onProgress: (value) {
          setState(() {
            progress = value;
          });
        });
    // Actualiza el estado del widget para indicar que la exportación ha terminado.
    setState(() {
      isExporting = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBarPlaceholder(),
      body: _buildBodyPlaceholder(),
    );
  }

  Center _buildBodyPlaceholder() {
    return Center(
      child: _buildExportButton(),
    );
  }

  AppBar _buildAppBarPlaceholder() => AppBar(
        elevation: 50,
        title: const Text('Exportar datos a Excel'),
        centerTitle: true,
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1),
            child: isExporting
                ? LinearProgressIndicator(value: progress)
                : const SizedBox(
                    height: 1,
                  )),
      );

  FilledButton _buildExportButton() {
    return FilledButton(
        child: const Text('Exportar'),
        onPressed: () =>
            _exportData(listData, fileName, schema, listaEncabezados));
  }
}
