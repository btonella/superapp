import 'package:app_core/app_core.dart';
import 'package:flutter/material.dart';

abstract class BaseApp extends StatelessWidget {
  BaseApp({super.key});

  List<MicroApp> get microApps;

  Map<String, WidgetBuilderArgs> get baseRoutes;

  final Map<String, WidgetBuilderArgs> routes = {};

  Future<void> initDependencies() async {
    AppDependencies.globalAppDependencies();
  }

  void registerRouters() {
    if (baseRoutes.isNotEmpty) routes.addAll(baseRoutes);
    if (microApps.isNotEmpty) {
      for (MicroApp microapp in microApps) {
        routes.addAll(microapp.routes);
      }
    }
  }

  Route<dynamic>? generateRoute(RouteSettings settings) {
    var routerName = settings.name;
    var routerArgs = settings.arguments;

    var navigateTo = routes[routerName];
    if (navigateTo == null) return null;

    return MaterialPageRoute(
      builder: (context) => navigateTo.call(context, routerArgs),
    );
  }
}