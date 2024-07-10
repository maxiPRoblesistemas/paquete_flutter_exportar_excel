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

  String fechaSinEspaciosDesde = fechaDesde.replaceAll('-', '');
  String fechaSinEspaciosHasta = fechaHasta.replaceAll('-', '');

  int desde = int.parse(fechaSinEspaciosDesde);
  int hasta = int.parse(fechaSinEspaciosHasta);

  listaDatosFiltrados = data.where((item) {
    String fechaSinEspacios = item['creadoEl'].replaceAll('-', '');
    int fechaFiltro = int.parse(fechaSinEspacios);
    return fechaFiltro >= desde && fechaFiltro <= hasta;
  }).toList();

  return listaDatosFiltrados;
}

List<String> extractHeadersFromSchema(
    {required Map<String, dynamic> schema,
    required xlsio.Worksheet sheet,
    required List<String> listaEncabezados}) {
  listaEncabezados.clear();
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
    required xlsio.Worksheet sheet}) async {
  List<String> keys = [];
  schema['properties'].forEach((key, value) {
    keys.add(key);
  });
  await _cargaRowData(data, sheet, keys);
}

/// Esta función se encarga de cargar los datos en una hoja de cálculo de Excel.
///
/// Parámetros:
/// - [data]: Una lista de mapas que contiene los datos a exportar.
/// - [sheet]: La hoja de cálculo de Excel donde se escribirán los datos.
/// - [keys]: Una lista de claves que define las columnas de datos a exportar.
Future<void> _cargaRowData(List<Map<String, dynamic>> data,
    xlsio.Worksheet sheet, List<String> keys) async {
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
      sheet.autoFitColumn(j + 1);
    }
  }
}

/// Totalizadores
void totalizadores(
    {required List<Map<String, dynamic>> data,
    required xlsio.Worksheet sheet,
    required List<String> listaEncabezados}) {
  int totalRow = data.length + 2;
  sheet.getRangeByIndex(totalRow, 1).setText('Total de registros:');
  sheet.getRangeByIndex(totalRow, 2).setNumber(obtenerTotalRegistros(data));

  for (var column = 0; column < listaEncabezados.length; column++) {
    sheet.getRangeByIndex(totalRow, column + 1).cellStyle
      ..fontSize = 12
      ..bold = true;
    sheet.autoFitColumn(column + 1);
  }
}

double obtenerTotalRegistros(List<Map<String, dynamic>> data) {
  return data.length.toDouble();
}

void buildGraficoEnExcel(
    {required List<Map<String, dynamic>> data,
    required xlsio.Worksheet sheet,
    required List<String> listaEncabezados}) {
  final ChartCollection charts = ChartCollection(sheet);
  final Chart chart = charts.add();
  chart.chartType = ExcelChartType.bar;

  for (var i = 0; i < data.length; i++) {
    for (var j = 0; j < listaEncabezados.length; j++) {
      chart.dataRange = sheet.getRangeByIndex(i + 2, 1);
      chart.isSeriesInRows = false;
    }
  }
  sheet.charts = charts;
}

Future<void> generaArchivoExcel(
    {required List<Map<String, dynamic>> data,
    required String fileName,
    required Map<String, dynamic> schema,
    required List<String> listaEncabezados}) async {
  // Crear un nuevo libro de trabajo y una hoja de cálculo
  final xlsio.Workbook workbook = xlsio.Workbook();

  /// se hace referencia a la hoja n°1  [hoja 1]
  final xlsio.Worksheet sheet = workbook.worksheets[0];
  sheet.name = 'Hoja1';

  /// se hace referencia a la hoja n°2 [hoja 2]
  final xlsio.Worksheet sheet2 = workbook.worksheets.addWithName('Hoja2');

  /// se hace referencia a la hoja n°3 [hoja 3]
  final xlsio.Worksheet sheet3 = workbook.worksheets.addWithName('Hoja3');

  // Personalizar la hoja de cálculo
  sheet.pageSetup.paperSize = xlsio.ExcelPaperSize.paperA4;

  // Agragar encabezados
  extractHeadersFromSchema(
      schema: schema, sheet: sheet, listaEncabezados: listaEncabezados);

  // Agregar datos
  await extractDataFromSchema(schema: schema, data: data, sheet: sheet);

  // Agregar totalizadores
  totalizadores(data: data, sheet: sheet3, listaEncabezados: listaEncabezados);

  // Agregar gráfico
  buildGraficoEnExcel(
      data: data, sheet: sheet2, listaEncabezados: listaEncabezados);

  // Guardar el archivo
  final List<int> bytes = await workbook.save();
  workbook.dispose();

  GuardarExcel.saveFile(Uint8List.fromList(bytes), '$fileName.xlsx');
}
