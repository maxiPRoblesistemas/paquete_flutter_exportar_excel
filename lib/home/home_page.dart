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

  // Lista de datos
  List<Map<String, dynamic>> listData = Results().datos;

  // Nombre del archivo
  String fileName = "archivo_excel_prueba";

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
        elevation: 2,
        title: const Text('Exportar datos a Excel'),
        centerTitle: true,
      );

  FilledButton _buildExportButton() {
    return FilledButton(
        child: const Text('Exportar'),
        onPressed: () =>
            generaArchivoExcel(listData, fileName, schema, listaEncabezados));
  }
}
