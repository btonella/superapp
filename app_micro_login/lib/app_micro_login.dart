// library app_micro_login;

import 'package:app_core/app_core.dart';
import 'package:app_micro_login/core/core.dart';
import 'package:app_micro_login/core/dependencies.dart';
import 'package:flutter/material.dart';

class MicroLogin extends StatelessWidget implements MicroApp {
  const MicroLogin({super.key});

  @override
  String get microAppName => 'MicroLogin';

  @override
  Map<String, WidgetBuilderArgs> get routes => MicroAppRoutes.getRoutes();

  @override
  Future<void> initDependencies() {
    return registerMicroAppDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: microAppName,
      initialRoute: MicroLoginRoutes.login.value,
    );
  }
}
