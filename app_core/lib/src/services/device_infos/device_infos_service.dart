abstract class DeviceInfosService {
  Future<void> init();

  String get appName;
  String get packageName;
  String get appVersion;
  String get buildNumber;
  String? get deviceVersion;
}
