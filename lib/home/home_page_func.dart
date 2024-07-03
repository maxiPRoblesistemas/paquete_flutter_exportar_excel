part of 'home_page.dart';

List<String> extractHeadersFromSchema(
    {required Map<String, dynamic> schema,
    required Worksheet sheet,
    required List<String> listaEncabezados}) {
  schema['properties'].forEach((key, value) {
    listaEncabezados.add(value['label'] ?? key);
  });
  for (int i = 0; i < listaEncabezados.length; i++) {
    sheet.getRangeByIndex(1, i + 1).setValue(listaEncabezados[i]);

    sheet.getRangeByIndex(1, i + 1).cellStyle.bold = true;
    sheet.getRangeByIndex(1, i + 1).cellStyle.fontSize = 14;
    sheet.getRangeByIndex(1, i + 1).cellStyle.fontName = 'Times New Roman';

    /// Ajuste automático del ancho de las columnas
    sheet.autoFitColumn(i + 1);

    /// Ajuste automático del ancho de las filas
    sheet.autoFitRow(i + 1);
  }
  return listaEncabezados;
}

Future<void> extractDataFromSchema(
    {required Map<String, dynamic> schema,
    required List<Map<String, dynamic>> data,
    required Worksheet sheet,
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
Future<void> _cargaRowData(List<Map<String, dynamic>> data, Worksheet sheet,
    List<String> keys, Function(double) onProgress) async {
  for (int i = 0; i < data.length; i++) {
    var row = data[i];
    for (int j = 0; j < keys.length; j++) {
      var value = row[keys[j]];

      // agrega el valor a la celda
      sheet.getRangeByIndex(i + 2, j + 1).setValue(value);

      // Establece el estilo de la celda
      sheet.getRangeByIndex(i + 2, j + 1).cellStyle.fontSize = 12;
      sheet.getRangeByIndex(i + 2, j + 1).cellStyle.hAlign = HAlignType.left;
      sheet.getRangeByIndex(i + 2, j + 1).cellStyle.fontName =
          'Times New Roman';
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
  final Workbook workbook = Workbook();
  final Worksheet sheet = workbook.worksheets[0];

  // Agragar encabezados
  extractHeadersFromSchema(
      schema: schema, sheet: sheet, listaEncabezados: listaEncabezados);

  // Agregar datos
  await extractDataFromSchema(
      schema: schema, data: data, sheet: sheet, onProgress: onProgress);

  // Guardar el archivo
  final List<int> bytes = workbook.saveAsStream();
  workbook.dispose();

  GuardarExcel.saveFile(Uint8List.fromList(bytes), '$fileName.xlsx');
}
