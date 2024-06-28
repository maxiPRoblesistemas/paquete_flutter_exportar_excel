import 'package:flutter/material.dart';
import 'package:paquete_syncfusion_exportar_excel/home/results.dart';
import 'package:paquete_syncfusion_exportar_excel/home/web_save_excel.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';
import 'dart:typed_data';

class ExportarDatosToExcel extends StatefulWidget {
  const ExportarDatosToExcel({super.key});

  @override
  State<ExportarDatosToExcel> createState() => _ExportarDatosToExcelState();
}

class _ExportarDatosToExcelState extends State<ExportarDatosToExcel> {
  //Lista de datos
  List<Map<String, dynamic>> dataList = Results.dataList;

  //Lista de encabezados
  List<String> columnasObligatorias = Results.columnasObligatorias;

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
        onPressed: () => generaArchivoExcel(dataList, fileName));
  }

  void cargarColumnas(Worksheet sheet) {
    for (int i = 0; i < columnasObligatorias.length; i++) {
      sheet.getRangeByIndex(1, i + 1).setText(columnasObligatorias[i]);
      sheet.workbook.fonts = [
        Font()
          ..name = 'Arial'
          ..bold = true
          ..size = 12
      ];
      sheet.autoFitColumn(i + 1);
    }
  }

  void cargaDatosFilas(List<Map<String, dynamic>> data,
      List<String> columnasObligatorias, Worksheet sheet) {
    for (int i = 0; i < data.length; i++) {
      var row = data[i];
      for (int j = 0; j < columnasObligatorias.length; j++) {
        var value = row[columnasObligatorias[j]];
        if (value is String) {
          sheet.getRangeByIndex(i + 2, j + 1).setText(value);
        } else if (value is int) {
          sheet.getRangeByIndex(i + 2, j + 1).setNumber(value.toDouble());
        } else if (value is double) {
          sheet.getRangeByIndex(i + 2, j + 1).setNumber(value);
        } else {
          sheet.getRangeByIndex(i + 2, j + 1).setText(value.toString());
        }
      }
    }
  }

  void generaArchivoExcel(List<Map<String, dynamic>> data, String fileName) {
    // Se crea una instancia de la clase Workbook
    final Workbook workbook = Workbook();

    final Worksheet sheet = workbook.worksheets[0];

    // Agragar encabezados
    cargarColumnas(sheet);

    // Agregar datos
    cargaDatosFilas(data, columnasObligatorias, sheet);

    // Guardar el archivo
    final List<int> bytes = workbook.saveAsStream();
    workbook.dispose();

    GuardarExcel.saveFile(Uint8List.fromList(bytes), '$fileName.xlsx');
  }
}