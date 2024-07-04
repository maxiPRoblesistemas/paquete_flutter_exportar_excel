part of 'home_page.dart';

String formateaFechaSelectores(String fecha) {
  String nuevaFecha = '';
  try {
    if (fecha.isNotEmpty && fecha.length < 12) {
      nuevaFecha =
          '${fecha.substring(6, 10)}-${fecha.substring(3, 5)}-${fecha.substring(0, 2)}';
      log('nueva fecha formateada: $nuevaFecha');
    }
  } catch (e) {
    return 'error: $e';
  }
  return nuevaFecha;
}

List<Map<String, dynamic>> buildListaDatosFiltrados(
    List<Map<String, dynamic>> data, String fechaDesde, String fechaHasta) {
  List<Map<String, dynamic>> listaDatosFiltrados = [];

  DateTime desde = DateTime.parse(fechaDesde);
  DateTime hasta = DateTime.parse(fechaHasta);

  listaDatosFiltrados = data.where((element) {
    DateTime fecha = DateTime.parse(element['creadoEl']);
    return fecha.isAfter(desde) && fecha.isBefore(hasta) ||
        fecha.isAtSameMomentAs(desde) ||
        fecha.isAtSameMomentAs(hasta);
  }).toList();

  return listaDatosFiltrados;
}

List<String> extractHeadersFromSchema(
    {required Map<String, dynamic> schema,
    required xlsio.Worksheet sheet,
    required List<String> listaEncabezados}) {
  schema['properties'].forEach((key, value) {
    listaEncabezados.add(value['label'] ?? key);
  });
  for (int i = 0; i < listaEncabezados.length; i++) {
    sheet.getRangeByIndex(1, i + 1).setValue(listaEncabezados[i]);

    /// Establece el estilo de las columnas
    sheet.getRangeByIndex(1, i + 1).cellStyle
      ..fontName = 'Times New Roman'
      ..fontSize = 16
      ..bold = true;

    /// Ajuste automático del ancho de las columnas
    sheet.autoFitColumn(i + 1);
  }
  return listaEncabezados;
}

Future<void> extractDataFromSchema(
    {required Map<String, dynamic> schema,
    required List<Map<String, dynamic>> data,
    required xlsio.Worksheet sheet,
    required Function(double) onProgress}) async {
  List<String> keys = [];
  schema['properties'].forEach((key, value) {
    keys.add(key);
  });
  await _cargaRowData(data, sheet, keys, onProgress);
}

/// Esta función se encarga de cargar los datos en una hoja de cálculo de Excel.
///
/// Parámetros:
/// - [data]: Una lista de mapas que contiene los datos a exportar.
/// - [sheet]: La hoja de cálculo de Excel donde se escribirán los datos.
/// - [keys]: Una lista de claves que define las columnas de datos a exportar.
Future<void> _cargaRowData(
    List<Map<String, dynamic>> data,
    xlsio.Worksheet sheet,
    List<String> keys,
    Function(double) onProgress) async {
  for (int i = 0; i < data.length; i++) {
    var row = data[i];
    for (int j = 0; j < keys.length; j++) {
      var value = row[keys[j]];

      // agrega el valor a la celda
      sheet.getRangeByIndex(i + 2, j + 1).setValue(value);

      // Establece el estilo de las filas
      sheet.getRangeByIndex(i + 2, j + 1).cellStyle
        ..fontSize = 12
        ..hAlign = xlsio.HAlignType.left
        ..fontName = 'Arial';

      sheet.autoFitRow(j + 1);
    }

    if (i % 100 == 0) {
      // Actualiza el progreso cada 100 filas
      onProgress(i / data.length);
      await Future.delayed(
          const Duration(milliseconds: 10)); // Permite que la UI se actualice
    }
  }
  // Asegurarse de que el progreso sea 100% al final
  onProgress(1.0);
}

Future<void> generaArchivoExcel(
    {required List<Map<String, dynamic>> data,
    required String fileName,
    required Map<String, dynamic> schema,
    required List<String> listaEncabezados,
    required Function(double) onProgress}) async {
  // Crear un nuevo libro de trabajo y una hoja de cálculo
  final xlsio.Workbook workbook = xlsio.Workbook();
  final xlsio.Worksheet sheet = workbook.worksheets[0];

  // Personalizar la hoja de cálculo
  sheet.pageSetup.paperSize = xlsio.ExcelPaperSize.paperA4;

  // Agragar encabezados
  extractHeadersFromSchema(
      schema: schema, sheet: sheet, listaEncabezados: listaEncabezados);

  // Agregar datos
  await extractDataFromSchema(
      schema: schema, data: data, sheet: sheet, onProgress: onProgress);

  // Guardar el archivo
  final List<int> bytes = await workbook.save();
  workbook.dispose();

  GuardarExcel.saveFile(Uint8List.fromList(bytes), '$fileName.xlsx');
}
