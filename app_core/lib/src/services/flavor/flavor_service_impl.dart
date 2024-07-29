import 'package:app_core/app_core.dart';
import 'package:firebase_core/firebase_core.dart';

class FlavorServiceImpl implements FlavorService {
  final DeviceInfosService deviceInfosService = I.getDependency<DeviceInfosService>();

  @override
  String getAppName() {
    return deviceInfosService.appName;
  }

  @override
  String getAppVersion() {
    return deviceInfosService.appVersion;
  }

  @override
  String getBuildNumber() {
    return deviceInfosService.buildNumber;
  }

  @override
  String? getDeviceVersion() {
    return deviceInfosService.deviceVersion;
  }

  @override
  Environment getEnvironment() {
    String lastName = deviceInfosService.packageName.split(".").last;
    switch (lastName) {
      case 'dev':
        return Environment.dev;
      case 'hml':
        return Environment.hml;
      case 'prod':
        return Environment.prod;
      default:
        return Environment.prod;
    }
  }

  @override
  Flavor getFlavor() {
    List<String> names = deviceInfosService.packageName.split('.');
    names.removeLast(); // remove environment name

    switch (names.last) {
      case 'base':
        return Flavor.base;
      case 'partner':
        return Flavor.partner;
      default:
        return Flavor.base;
    }
  }

  @override
  FirebaseOptions getFirebaseConfig() {
    Environment enviroment = getEnvironment();
    Flavor flavor = getFlavor();
    logger.info('getFirebaseConfig: enviroment $enviroment, flavor $flavor');
    switch (flavor) {
      case Flavor.base:
        switch (enviroment) {
          case Environment.dev:
            return DefaultFirebaseOptionsDev.currentPlatform;
          case Environment.hml:
            return DefaultFirebaseOptionsHml.currentPlatform;
          default:
            return DefaultFirebaseOptions.currentPlatform;
        }
      case Flavor.partner:
        switch (enviroment) {
          case Environment.dev:
            return DefaultFirebaseOptionsPartnerDev.currentPlatform;
          case Environment.hml:
            return DefaultFirebaseOptionsPartnerHml.currentPlatform;
          default:
            return DefaultFirebaseOptionsPartner.currentPlatform;
        }
      default:
        return DefaultFirebaseOptions.currentPlatform;
    }
  }

  @override
  Map<ApiName, String> getUrlBase() {
    Environment environment = getEnvironment();
    Flavor flavor = getFlavor();

    if (apiUrls.containsKey(flavor)) {
      if (apiUrls[flavor]!.containsKey(environment)) {
        return apiUrls[flavor]![environment]!;
      } else {
        // default response when no environment
        return apiUrls[flavor]![Environment.prod]!;
      }
    } else {
      // default response
      return apiUrls[Flavor.base]![Environment.prod]!;
    }
  }
}
