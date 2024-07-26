import 'app.dart';

abstract class MicroApp {
  String get microAppName;

  Map<String, WidgetBuilderArgs> get routes;

  Future<void> initDependencies();
}
