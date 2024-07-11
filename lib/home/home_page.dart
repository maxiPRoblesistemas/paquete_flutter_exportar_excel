import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:paquete_syncfusion_exportar_excel/home/results.dart';
import 'package:paquete_syncfusion_exportar_excel/home/web_save_excel.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' as xlsio;
import 'package:syncfusion_officechart/officechart.dart';
import 'dart:typed_data';

import 'package:view_ui_flutter/widgets/textfield/textfield_widget.dart';

part 'home_page_func.dart';

class ExportarDatosToExcel extends StatefulWidget {
  const ExportarDatosToExcel({super.key});

  @override
  State<ExportarDatosToExcel> createState() => _ExportarDatosToExcelState();
}

class _ExportarDatosToExcelState extends State<ExportarDatosToExcel> {
  // Esquemas de datos
  Map<String, dynamic> schema = Results().esquema;

  // Lista de datos
  List<Map<String, dynamic>> listData = Results().baseData;

  // Lista de encabezados
  List<String> listaEncabezados = [];

  // Nombre del archivo
  String fileName = "archivo_excel_prueba";

  TextEditingController controllerDesde = TextEditingController();
  TextEditingController controllerHasta = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBarPlaceholder(),
      body: _buildBodyPlaceholder(),
    );
  }

  LayoutBuilder _buildBodyPlaceholder() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ConstrainedBox(
          constraints: constraints,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildFiltroDatosPorFecha(),
              _buildExportButton(context: context),
            ],
          ),
        );
      },
    );
  }

  Padding _buildFiltroDatosPorFecha() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
            child: TextfieldWidget.fecha(
              labelTitulo: 'Desde',
              controller: controllerDesde,
              onSubmitted: (p0) {
                log('VALOR TEXTFIELD DESDE:>>>> $p0');
                setState(() {
                  controllerDesde.text = p0;
                });
              },
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: TextfieldWidget.fecha(
              labelTitulo: 'Hasta',
              controller: controllerHasta,
              onSubmitted: (p0) {
                log('VALOR TEXTFIELD HASTA:>>>> $p0');
                setState(() {
                  controllerHasta.text = p0;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBarPlaceholder() => AppBar(
        elevation: 50,
        title: const Text('Exportar datos a Excel'),
        centerTitle: true,
      );

  FilledButton _buildExportButton({required BuildContext context}) {
    return FilledButton(
        child: const Text('Exportar'),
        onPressed: () {
          if (controllerDesde.text.isEmpty || controllerHasta.text.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Debe seleccionar un rango de fechas'),
              ),
            );
          } else {
            generaArchivoExcel(
                fileName: fileName,
                schema: schema,
                listaEncabezados: listaEncabezados,
                data: buildListaDatosFiltrados(
                    listData,
                    formateaFechaSelectores(controllerDesde.text),
                    formateaFechaSelectores(controllerHasta.text)));
          }
        });
  }
}
