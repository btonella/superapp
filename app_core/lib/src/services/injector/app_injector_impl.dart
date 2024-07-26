import 'package:app_core/src/services/injector/injector.dart';
import 'package:get_it/get_it.dart';

class AppInjectorImpl implements AppInjector {
  final GetIt _getIt = GetIt.I;

  @override
  T getDependency<T extends Object>() {
    return _getIt.get<T>();
  }

  @override
  Future<void> registerDependency<T extends Object>(T dependency) async {
    if (!_getIt.isRegistered<T>()) {
      _getIt.registerSingleton<T>(dependency);
    }
  }

  @override
  Future<void> registerDependencyLazySingleton<T extends Object>(T Function() factoryFunc) async {
    if (!_getIt.isRegistered<T>()) {
      _getIt.registerLazySingleton<T>(factoryFunc);
    }
  }
}
