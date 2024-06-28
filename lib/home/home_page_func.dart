part of 'home_page.dart';

List<String> extractHeadersFromSchema(
      Map<String, dynamic> schema, Worksheet sheet, List<String> listaEncabezados) {
    schema['properties'].forEach((key, value) {
      listaEncabezados.add(value['label'] ?? key);
    });
    for (int i = 0; i < listaEncabezados.length; i++) {
      sheet.getRangeByIndex(1, i + 1).setText(listaEncabezados[i]);

      sheet.getRangeByIndex(1, i + 1).cellStyle.bold = true;

      /// Ajuste personalizado del ancho de las columnas
      // sheet.setColumnWidthInPixels(i + 1, 150);

      /// Ajuste personalizado del ancho de las filas
      // sheet.setRowHeightInPixels(1, 20);

      /// Ajuste automático del ancho de las columnas
      sheet.autoFitColumn(i + 1);

      /// Ajuste automático del ancho de las filas
      sheet.autoFitRow(i + 1);
    }
    return listaEncabezados;
  }

  void extractDataFromSchema(Map<String, dynamic> schema,
      List<Map<String, dynamic>> data, Worksheet sheet) {
    List<String> keys = [];
    schema['properties'].forEach((key, value) {
      keys.add(key);
    });
    _cargaRowData(data, sheet, keys);
  }

  /// Esta función se encarga de cargar los datos en una hoja de cálculo de Excel.
  ///
  /// Parámetros:
  /// - [data]: Una lista de mapas que contiene los datos a exportar.
  /// - [sheet]: La hoja de cálculo de Excel donde se escribirán los datos.
  /// - [keys]: Una lista de claves que define las columnas de datos a exportar.
  void _cargaRowData(
      List<Map<String, dynamic>> data, Worksheet sheet, List<String> keys) {
    // Iterar a través de cada fila de datos en la lista `data`.
    for (int i = 0; i < data.length; i++) {
      // Obtener el mapa que representa la fila actual de datos.
      var row = data[i];
      // Iterar a través de cada clave en la lista `keys` para obtener los valores correspondientes.
      for (int j = 0; j < keys.length; j++) {
        // Obtener el valor correspondiente a la clave actual en la fila de datos.
        var value = row[keys[j]];
        // Verificar el tipo de dato del valor y asignarlo a la celda correspondiente en la hoja de cálculo.
        if (value is String) {
          sheet.getRangeByIndex(i + 2, j + 1).setText(value);
        } else if (value is int) {
          sheet.getRangeByIndex(i + 2, j + 1).setNumber(value.toDouble());
        } else {
          sheet.getRangeByIndex(i + 2, j + 1).setText(value.toString());
        }
      }
    }
  }

  void generaArchivoExcel(List<Map<String, dynamic>> data, String fileName, Map<String, dynamic> schema, List<String> listaEncabezados) {
    // Se crea una instancia de la clase Workbook
    final Workbook workbook = Workbook();

    final Worksheet sheet = workbook.worksheets[0];

    // Agragar encabezados
    extractHeadersFromSchema(schema, sheet, listaEncabezados);

    // Agregar datos
    extractDataFromSchema(schema, data, sheet);

    // Guardar el archivo
    final List<int> bytes = workbook.saveAsStream();
    workbook.dispose();

    GuardarExcel.saveFile(Uint8List.fromList(bytes), '$fileName.xlsx');
  }