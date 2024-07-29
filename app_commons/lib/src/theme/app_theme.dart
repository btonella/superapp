import 'package:app_core/app_core.dart';
import 'package:flutter/material.dart';
import '../styles/styles.dart';

///
/// Esta classe define um tema personalizado para o aplicativo.
/// O tema inclui estilos de texto, cores primárias e de fundo, densidade visual e esquema de cores.
/// A cor do tema pode ser personalizada para um parceiro específico, se necessário.
///
class AppTheme {
  static AppColors getAppColors() {
    Flavor appFlavor = I.getDependency<FlavorService>().getFlavor();
    switch (appFlavor) {
      case Flavor.base:
        return AppColors();
      case Flavor.partner:
        return PartnerColors();
      default:
        return AppColors();
    }
  }

  static String getAppFont() {
    Flavor appFlavor = I.getDependency<FlavorService>().getFlavor();
    switch (appFlavor) {
      case Flavor.base:
        return 'Montserrat';
      case Flavor.partner:
        return 'Montserrat';
      default:
        return 'Montserrat';
    }
  }

  static TextTheme getTextTheme() {
    String package = "app_commons";
    String family = getAppFont();
    AppColors appColors = getAppColors();
    return TextTheme(
      displayLarge: TextStyle(color: appColors.primary, fontSize: 36, package: package, fontFamily: family),
      displayMedium: TextStyle(color: appColors.title, fontSize: 24, package: package, fontFamily: family),
      displaySmall: TextStyle(color: appColors.title, fontSize: 20, package: package, fontFamily: family),
      bodyLarge: TextStyle(color: appColors.body, fontWeight: FontWeight.bold, package: package, fontFamily: family),
      bodyMedium: TextStyle(color: appColors.body, fontWeight: FontWeight.normal, package: package, fontFamily: family),
      titleMedium: TextStyle(color: appColors.label, fontWeight: FontWeight.w300, fontSize: 16, package: package, fontFamily: family),
      titleSmall: TextStyle(color: appColors.label, fontWeight: FontWeight.w300, fontSize: 14, package: package, fontFamily: family),
    );
  }

  static ThemeData getThemeData() => ThemeData(
        useMaterial3: true,
        textTheme: getTextTheme(),
        primaryColor: getAppColors().primary,
        scaffoldBackgroundColor: getAppColors().white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        disabledColor: getAppColors().body,
        colorScheme: ColorScheme.fromSwatch(
          accentColor: getAppColors().secondary,
          backgroundColor: getAppColors().background,
          brightness: Brightness.light,
          errorColor: getAppColors().error,
        ),
      );
}
