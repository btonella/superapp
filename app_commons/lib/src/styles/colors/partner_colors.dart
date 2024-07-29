import 'dart:ui';

import 'package:app_commons/src/styles/colors/colors.dart';

class PartnerColors implements AppColors {
  @override
  Color get primary => const Color(0xFF61b358);
  @override
  Color get secondary => const Color(0xFF414594);
  @override
  Color get complementary => const Color(0xFFF7921E);

  @override
  Color get warning => const Color(0xFFFFBE0B);
  @override
  Color get error => const Color(0xFFCF0000);
  @override
  Color get success => const Color(0xFF369638);

  @override
  Color get title => const Color(0xFF212529);
  @override
  Color get body => const Color(0xFF3A3A3A);
  @override
  Color get label => const Color(0xFF7E868A);
  @override
  Color get placeholder => const Color(0xFFA0A3BD);
  @override
  Color get line => const Color(0xFFDEE2E6);
  @override
  Color get inputBackground => const Color(0xFFECECEC);
  @override
  Color get background => const Color(0xFFFAFAFA);
  @override
  Color get offWhite => const Color(0xFFFCFCFC);
  @override
  Color get white => const Color(0xFFFFFFFF);
}
