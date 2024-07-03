import 'package:flutter/material.dart';
import 'package:paquete_syncfusion_exportar_excel/global/theme.dart';
import 'package:paquete_syncfusion_exportar_excel/home/home_page.dart';

void main() {
  runApp(const MyApp());
  ThemeCDM.instance.initTheme();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeCDM.instance.lightTheme,
      home: const ExportarDatosToExcel(),
    );
  }
}