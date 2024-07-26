import 'package:app_core/src/services/analytics/analytics_service.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsServiceImpl implements AnalyticsService {
  FirebaseAnalytics firebaseAnalytics = FirebaseAnalytics.instance;

  @override
  Future<void> registerEvent(String name) async {
    await firebaseAnalytics.logEvent(name: name);
  }

  @override
  Future<void> saveConfigLogin(String id) async {
    await firebaseAnalytics.setUserId(id: id);
  }
}
