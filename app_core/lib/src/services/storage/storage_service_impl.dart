import 'package:app_core/src/services/storage/storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageServiceImpl implements StorageService {
  FlutterSecureStorage secureStorage = const FlutterSecureStorage(aOptions: AndroidOptions(encryptedSharedPreferences: true), iOptions: IOSOptions());

  @override
  Future<String?> getToken() async {
    return await secureStorage.read(key: 'token');
  }
}
