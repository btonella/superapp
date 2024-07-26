import 'dart:io';

import 'package:app_core/app_core.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';

class DeviceInfosServiceImpl implements DeviceInfosService {
  final PackageInfo packageInfo;
  DeviceInfosServiceImpl({required this.packageInfo});

  late final AndroidDeviceInfo androidDeviceInfo;
  late final IosDeviceInfo iosDeviceInfo;
  late final WebBrowserInfo webBrowserInfo;

  @override
  Future<void> init() async {
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    if (kIsWeb) {
      webBrowserInfo = await deviceInfoPlugin.webBrowserInfo;
    } else if (Platform.isIOS) {
      iosDeviceInfo = await deviceInfoPlugin.iosInfo;
    } else if (Platform.isAndroid) {
      androidDeviceInfo = await deviceInfoPlugin.androidInfo;
    }
  }

  @override
  String get appName => packageInfo.appName;

  @override
  String get packageName => packageInfo.packageName;

  @override
  String get appVersion => packageInfo.version;

  @override
  String get buildNumber => packageInfo.buildNumber;

  @override
  String? get deviceVersion {
    if (!kIsWeb && Platform.isIOS) {
      return iosDeviceInfo.systemVersion;
    } else if (Platform.isAndroid) {
      return androidDeviceInfo.version.release;
    } else {
      return null;
    }
  }
}
