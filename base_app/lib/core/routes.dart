import 'package:app_core/app/core_utils.dart';
import 'package:base_app/modules/modules.dart';

enum BaseRoutes {
  splash('/');

  const BaseRoutes(this.value);
  final String value;
}

class BaseAppRoutes {
  static Map<String, WidgetBuilderArgs> getRoutes() {
    return {
      BaseRoutes.splash.value: (context, args) => const SplashPage(),
    };
  }
}
