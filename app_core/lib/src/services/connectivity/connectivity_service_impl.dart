import 'package:app_core/src/services/connectivity/connectivity.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityServiceImpl extends ConnectivityService {
  final Connectivity connectivity = Connectivity();
  @override
  Future<bool> hasConnection() async {
    final connectivityResult = await connectivity.checkConnectivity();

    return connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.ethernet);
  }
}
