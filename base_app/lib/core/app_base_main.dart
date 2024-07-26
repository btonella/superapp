import 'package:app_core/app_core.dart';
import 'package:app_micro_login/app_micro_login.dart';
import 'package:base_app/core/routes.dart';
import 'package:base_app/modules/modules.dart';
import 'package:flutter/material.dart';

class AppBaseMain extends BaseApp with MainApp {
  final ThemeData themeData;
  AppBaseMain({required this.themeData, super.key});

  @override
  Widget build(BuildContext context) {
    super.registerRouters();

    return FutureBuilder(
      future: Future.wait([
        initAppDependencies(),
      ]),
      builder: (context, snapshot) => MaterialApp(
        title: 'SuperApp',
        theme: themeData,
        navigatorKey: AppNavigator.navigatorKey,
        onGenerateRoute: super.generateRoute,
        initialRoute: BaseRoutes.splash.value,
      ),
    );
  }

  @override
  Map<String, WidgetBuilderArgs> get baseRoutes => BaseAppRoutes.getRoutes();

  @override
  List<MicroApp> get microApps => [
        const MicroLogin(),
      ];

  @override
  Future<void> initDependencies() async {
    I.registerDependency<SplashController>(SplashController());
  }

  @override
  Future<void> initAppDependencies() async {
    await initDependencies();
    for (final microapp in microApps) {
      await microapp.initDependencies();
    }
  }
}
