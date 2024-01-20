import 'package:firebase_analytics/firebase_analytics.dart';

import '../events/abstract/base_event.dart';

/// [AnalyticsService] is a singleton class that is responsible for logging events
class AnalyticsService {
  AnalyticsService._();

  FirebaseAnalytics? _analytics;

  AnalyticEnv _env = AnalyticEnv.production;

  /// Singleton instance of [AnalyticsService]
  static final AnalyticsService instance = AnalyticsService._();

  /// [FirebaseAnalytics] instance
  FirebaseAnalytics get analytics => _analytics ??= FirebaseAnalytics.instance;

  /// [setAnalytics] sets the [FirebaseAnalytics] instance
  void setAnalytics(FirebaseAnalytics analytics) {
    _analytics = analytics;
  }

  /// [setEnv] sets the environment of the app
  void setEnv(AnalyticEnv env) {
    _env = env;
  }

  /// [logEvent] logs the event to FirebaseAnalytics
  /// [T] is the type of [IEvent]
  /// [event] is the instance of [IEvent]
  Future<void> logEvent<T extends IEvent>({
    required T event,
  }) async {
    await _analytics?.logEvent(
      name: event.eventName,
      parameters: event.toJson(),
    );
  }

  /// [setUserDefaults] sets the user defaults
  /// [userDefaults] is the map of user defaults
  /// [setUserDefaults] records also current env under [staging] key
  Future<void> setUserDefaults({
    required Map<String, dynamic> userDefaults,
  }) async {
    for (final entry in userDefaults.entries) {
      await _analytics?.setUserProperty(name: entry.key, value: entry.value);
    }
    _analytics?.setUserProperty(name: "staging", value: _env.value);
  }

  /// [setUserId] sets the user id
  Future<void> setUserId({
    required String userId,
  }) async {
    await _analytics?.setUserId(id: userId);
  }
}

/// [AnalyticEnv] is the enum class that represents the environment of the app
/// [development] is the development environment
/// [production] is the production environment
enum AnalyticEnv {
  development('development'),
  production('production');

  final String value;
  const AnalyticEnv(this.value);
}
