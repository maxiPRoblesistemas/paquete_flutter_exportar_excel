import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:view_ui_flutter/theme/theme.dart';

///tamaño por defecto para textos
double defaultTextSmall = 13;
double defaultTextMedium = 15;
double defaultTextLarge = 17;
double defaultTextTitleSmall = 20;
double defaultTextTitleMedium = 25;
double defaultTextTitleLarge = 30;
double defaultTextHeadlineSmall = 35;
double defaultTextHeadlineMedium = 40;
double defaultTextHeadlineLarge = 45;

class ThemeCDM {
  ThemeCDM._();
  static final instance = ThemeCDM._();
  static double bordeRadius = 7;
  static double barraDivisoriaWidth = 1.3;
  static Color colorRojo = const Color.fromRGBO(255, 60, 50, 1);
  static Color colorBlanco = const Color.fromRGBO(237, 232, 228, 1);
  static Color colorAzul = const Color(0xFF628AD9);
  static const Color colorMarron = Color(0xff5B5048);
  static const Color fondoTerminal = Color.fromARGB(255, 17, 19, 29);
  static Color colorPrimario = const Color(0xFF519259);
  static FlexScheme scheme = FlexScheme.bahamaBlue;

  //color appBar lightTheme
  static Color colorAppBarThemeLight = const Color.fromARGB(255, 186, 230, 176);
  //color appBar darkTheme
  static Color colorAppBarThemeDark = const Color.fromARGB(255, 43, 80, 43);

  ///El el remarcado de la linea al seleccionar un componente
  double anchoLineaRemarcado = 0.8;
  //raleway,roboto,robotoFlex ,notoMusic,openSans,lato,montserrat,sourceSans3,sourceSansPro,barlow,nunitoSans
  ThemeMode themeMode = ThemeMode.system;
  static final TextStyle style = GoogleFonts.robotoFlex();

  late ThemeData lightTheme;

  late ThemeData darkTheme;
  initTheme() {
    lightTheme = FlexThemeData.light(
      scheme: scheme,
      colors: const FlexSchemeColor(
        primary: Color(0xff5b5048),
        primaryContainer: Color(0xffd0e4ff),
        secondary: Color(0xffac3306),
        secondaryContainer: Color(0xffffdbcf),
        tertiary: Color(0xff006875),
        tertiaryContainer: Color(0xff95f0ff),
        appBarColor: Color(0xffffdbcf),
        error: Color(0xffb00020),
      ),
      colorScheme: const ColorScheme.light(
          primary: Color(0xff5b5048),
          primaryContainer: Color.fromRGBO(237, 232, 228, 1),
          secondary: colorMarron,
          secondaryContainer: Color(0xFFCA9D7C),
          tertiary: colorMarron,
          tertiaryContainer: Color(0xff5b5048),
          onTertiaryContainer: Color.fromARGB(255, 11, 80, 136),
          error: Color(0xFFC62828),
          onSurface: Color.fromARGB(255, 5, 5, 5)),
      surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
      blendLevel: 9,
      tooltipsMatchBackground: true,
      appBarStyle: FlexAppBarStyle.scaffoldBackground,
      scaffoldBackground: Colors.white,
      primary: colorMarron,
      subThemesData: FlexSubThemesData(
        elevatedButtonSchemeColor: SchemeColor.onPrimaryContainer,
        elevatedButtonSecondarySchemeColor: SchemeColor.secondaryContainer,
        defaultRadius: bordeRadius,
        elevatedButtonRadius: bordeRadius,
        inputDecoratorSchemeColor: SchemeColor.secondary,
        switchSchemeColor: SchemeColor.primary,
        inputDecoratorIsFilled: false,
        tooltipRadius: bordeRadius,
        textButtonTextStyle: WidgetStatePropertyAll(
            GoogleFonts.workSans().copyWith(color: colorAzul)),
        inputDecoratorRadius: bordeRadius,
        inputDecoratorBorderType: FlexInputBorderType.underline,
        outlinedButtonBorderWidth: 0.2,
        appBarBackgroundSchemeColor: SchemeColor.primary,
      ),

      ///Color para las tarjetas de los dialogos
      surfaceTint: Colors.white,
      textTheme: TextTheme(
        bodySmall:
            style.copyWith(fontSize: defaultTextSmall, color: colorMarron),

        ///Esto usan los botones
        bodyMedium:
            style.copyWith(fontSize: defaultTextMedium, color: colorMarron),
        bodyLarge:
            style.copyWith(fontSize: defaultTextLarge, color: colorMarron),

        ///fuente para titulos
        titleSmall: style.copyWith(
            fontSize: defaultTextTitleSmall,
            fontWeight: FontWeight.w500,
            color: colorMarron),
        titleMedium: style.copyWith(
            fontSize: defaultTextTitleMedium,
            fontWeight: FontWeight.bold,
            color: colorMarron),
        titleLarge:
            style.copyWith(fontSize: defaultTextTitleLarge, color: colorMarron),

        ///Contenido con un tamaño mayor que el titulo
        headlineSmall: style.copyWith(
            fontSize: defaultTextHeadlineSmall, color: colorMarron),
        headlineMedium: style.copyWith(
            fontSize: defaultTextHeadlineMedium, color: colorMarron),
        headlineLarge: style.copyWith(
            fontSize: defaultTextHeadlineLarge, color: colorMarron),
      ),

      tones: FlexTones.vivid(Brightness.light),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      useMaterial3: true,
      fontFamily: GoogleFonts.robotoFlex().fontFamily,
      swapLegacyOnMaterial3: true,
    ).copyWith(
        dividerTheme:
            const DividerThemeData(thickness: 0.3, color: Colors.grey));
    darkTheme = FlexThemeData.dark(
      scheme: FlexScheme.blue,
      surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
      blendLevel: 15,
      tooltipsMatchBackground: true,
      appBarStyle: FlexAppBarStyle.scaffoldBackground,
      scaffoldBackground: const Color.fromARGB(255, 49, 49, 49),
      subThemesData: FlexSubThemesData(
        inputDecoratorBorderType: FlexInputBorderType.underline,
        blendOnLevel: 20,
        defaultRadius: bordeRadius,
        dialogBackgroundSchemeColor: SchemeColor.onPrimary,
        elevatedButtonRadius: bordeRadius,
        elevatedButtonSchemeColor: SchemeColor.error,
        elevatedButtonSecondarySchemeColor: SchemeColor.secondaryContainer,
        inputDecoratorRadius: bordeRadius,
        tooltipRadius: bordeRadius,
        tooltipSchemeColor: SchemeColor.primaryContainer,
      ),
      colorScheme: const ColorScheme.dark(
        primary: Color(0xff5b5048),
        primaryContainer: Color.fromARGB(255, 17, 19, 29),
        secondary: Colors.green, //colorMarron,
        secondaryContainer: Color(0xFFCA9D7C),
        tertiary: colorMarron,
        tertiaryContainer: colorMarron,
        onTertiaryContainer: Colors.green,
        error: Color(0xFFC62828),
      ),
      textTheme: TextTheme(
        bodySmall:
            style.copyWith(fontSize: defaultTextSmall, color: colorBlanco),

        ///Esto usan los botones
        bodyMedium:
            style.copyWith(fontSize: defaultTextMedium, color: colorBlanco),
        bodyLarge:
            style.copyWith(fontSize: defaultTextLarge, color: colorBlanco),

        ///fuente para titulos
        titleSmall: style.copyWith(
            fontSize: defaultTextTitleSmall,
            fontWeight: FontWeight.w500,
            color: colorBlanco),
        titleMedium: style.copyWith(
            fontSize: defaultTextTitleMedium,
            fontWeight: FontWeight.bold,
            color: colorBlanco),
        titleLarge:
            style.copyWith(fontSize: defaultTextTitleLarge, color: colorBlanco),

        ///Contenido con un tamaño mayor que el titulo
        headlineSmall: style.copyWith(
            fontSize: defaultTextHeadlineSmall, color: colorBlanco),
        headlineMedium: style.copyWith(
            fontSize: defaultTextHeadlineMedium, color: colorBlanco),
        headlineLarge: style.copyWith(
            fontSize: defaultTextHeadlineLarge, color: colorBlanco),
      ),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      useMaterial3: true,
      fontFamily: style.fontFamily,
      swapLegacyOnMaterial3: true,
    ).copyWith(
        dividerTheme:
            const DividerThemeData(thickness: 0.3, color: Colors.grey));
    ThemeModel().initTheme(
        altoCampos: 40,
        paddingInput: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
        colorPrimario: colorPrimario,
        cdmAzul: colorPrimario,
        lightTheme: lightTheme,
        darkTheme: darkTheme);
  }
}
