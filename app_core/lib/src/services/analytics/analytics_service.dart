abstract class AnalyticsService {
  Future<void> saveConfigLogin(String id);
  Future<void> registerEvent(String name);
}
