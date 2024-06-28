import 'dart:html' as html;

import 'package:flutter/material.dart';

class GuardarExcel {
  static List<int>? saveFile(List<int>? val, String fileName) {
    try {
      // Se crea un objeto Blob a partir de los bytes del archivo, especificando el tipo MIME adecuado para archivos Excel.
      final blob = html.Blob([val]);
      // Se crea una URL temporal que apunta al Blob.
      final url = html.Url.createObjectUrlFromBlob(blob);
      final anchor = html.document.createElement('a') as html.AnchorElement
        ..href = url
        ..style.display = 'none'
        ..download = fileName;
      html.document.body?.children.add(anchor);

      // download the file
      anchor.click();
      // cleanup
      html.document.body?.children.remove(anchor);
      //La URL temporal se revoca para liberar memoria.
      html.Url.revokeObjectUrl(url);
    } catch (e) {
      debugPrint('Error al exportar excel >>>>>>>>>>> : $e');
    }
    return val;
  }
}
