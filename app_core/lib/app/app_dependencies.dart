import 'package:app_core/init_core.dart';
import 'package:app_core/src/services/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppDependencies {
  static Future<void> globalAppDependencies() async {
    // device infos
    DeviceInfosService deviceInfosService = DeviceInfosServiceImpl(packageInfo: await PackageInfo.fromPlatform());
    I.registerDependency<DeviceInfosService>(deviceInfosService);
    await deviceInfosService.init();

    // flavor
    I.registerDependency<FlavorService>(FlavorServiceImpl());

    // firebase
    await Firebase.initializeApp();

    // analytics
    I.registerDependency<AnalyticsService>(AnalyticsServiceImpl());

    // secure storage
    I.registerDependency<StorageService>(StorageServiceImpl());

    // connectivity
    I.registerDependency<ConnectivityService>(ConnectivityServiceImpl());

    // http
    I.registerDependency<HttpClientService>(HttpClientServiceImpl());
  }
}
