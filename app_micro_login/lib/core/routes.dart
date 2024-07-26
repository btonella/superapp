import 'package:app_core/app/core_utils.dart';
import 'package:app_micro_login/modules/modules.dart';

enum MicroLoginRoutes {
  login('/login');

  const MicroLoginRoutes(this.value);
  final String value;
}

class MicroAppRoutes {
  static Map<String, WidgetBuilderArgs> getRoutes() {
    return {
      MicroLoginRoutes.login.value: (context, args) => const LoginPage(),
    };
  }
}
