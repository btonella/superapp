import 'package:app_core/app_core.dart';
import 'package:base_app/core/app_base_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => initApp();

void initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await initCore();
  await AppDependencies.globalAppDependencies();
  runApp(AppBaseMain());
}
