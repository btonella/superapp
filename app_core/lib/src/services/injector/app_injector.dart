abstract class AppInjector {
  T getDependency<T extends Object>();

  Future<void> registerDependency<T extends Object>(T dependency);

  Future<void> registerDependencyLazySingleton<T extends Object>(T Function() factoryFunc);
}
