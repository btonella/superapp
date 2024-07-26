import 'package:app_core/app_core.dart';

class SplashController {
  void config() {}

  void navigateToNextPage(String pageName) async {
    await Future.delayed(const Duration(milliseconds: 500));
    AppNavigator.navigatorState.pushReplacementNamed(pageName);
  }
}
