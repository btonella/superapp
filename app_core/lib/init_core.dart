import 'package:app_core/app_core.dart';

///A variável "I" é uma instância do serviço de injeção de dependência
late final AppInjector I;

///A variável "logger" é uma instância do serviço de registro de logs
late final LoggerServices logger;

Future<void> initCore() async {
  I = AppInjectorImpl();
  logger = LoggerServicesImpl()..init();
}
