import 'package:app_core/src/enums/enums.dart';
import 'package:firebase_core/firebase_core.dart';

abstract class FlavorService {
  String getAppName();

  String getAppVersion();

  String getBuildNumber();

  String? getDeviceVersion();

  Environment getEnvironment();

  Flavor getFlavor();

  FirebaseOptions getFirebaseConfig();

  Map<ApiName, String> getUrlBase();
}
