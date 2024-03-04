import 'package:adjust_sdk/adjust.dart';
import 'package:adjust_sdk/adjust_config.dart';
import 'package:adjust_sdk/adjust_event.dart';
import 'package:analytics/src/events/adjust_event.dart';

/// [AdjustService] is a wrapper around the Adjust SDK
/// It is responsible for setting up the Adjust SDK and logging events
/// Methods should be called in the following order:
/// 1. [setup]
/// 2. [setExternalDeviceId]
/// 3. [start]
class AdjustService {
  static final AdjustService _instance = AdjustService._init();
  static AdjustService get instance => _instance;
  AdjustService._init();

  /// The Adjust SDK configuration
  late final AdjustConfig _config;

  /// The environment to use for the Adjust SDK
  AdjustEnvironment _environment = AdjustEnvironment.sandbox;

  /// Setup the Adjust SDK
  /// [appId] the app id from the Adjust dashboard
  /// [environment] the environment to use for the Adjust SDK
  /// [eventBuffering] whether to enable event buffering
  /// [coppaCompliant] whether to enable coppa compliance
  /// This method should be called before calling [start]
  /// It should be called only once
  void setup({
    required String appId,
    required AdjustEnvironment environment,
    bool eventBuffering = true,
    bool coppaCompliant = true,
  }) {
    _environment = environment;
    _config = AdjustConfig(appId, _environment);
    _config.eventBufferingEnabled = eventBuffering;
    _config.coppaCompliantEnabled = coppaCompliant;
    _setLogLevel();
  }

  /// Start the Adjust SDK
  /// This method should be called after calling [setup]
  void start() {
    Adjust.start(_config);
  }

  /// Set the log level for the Adjust SDK
  void _setLogLevel() {
    switch (_environment) {
      case AdjustEnvironment.sandbox:
        _config.logLevel = AdjustLogLevel.verbose;
        break;
      case AdjustEnvironment.production:
        _config.logLevel = AdjustLogLevel.error;
        break;
    }
  }

  /// Set the external device id for the Adjust SDK
  /// [deviceId] the external device id
  /// This method should be called before calling [start]
  void setExternalDeviceId(String deviceId) {
    _config.externalDeviceId = deviceId;
  }

  /// Log an event to the Adjust SDK
  /// [event] the event to log
  /// This method should be called after calling [start]
  void trackEvent<T extends IAdjustEvent>({
    required T event,
  }) {
    return switch (event) {
      AdjustTrackEvent() => _logTrackEvent(event: event),
      AdjustRevenueEvent() => _logRevenueEvent(event: event),
    };
  }

  /// Log a track event to the Adjust SDK
  /// [event] the track event to log
  /// This method should be called after calling [start]
  void _logTrackEvent({
    required AdjustTrackEvent event,
  }) {
    final adjustEvent = AdjustEvent(event.token);
    Adjust.trackEvent(adjustEvent);
  }

  /// Log a revenue event to the Adjust SDK
  /// [event] the revenue event to log
  /// This method should be called after calling [start]
  void _logRevenueEvent({
    required AdjustRevenueEvent event,
  }) {
    final adjustEvent = AdjustEvent(event.token);
    adjustEvent.setRevenue(event.revenue, event.currency);
    Adjust.trackEvent(adjustEvent);
  }

  /// Get the Adjust SDK ad id
  /// This method should be called after calling [start]
  Future<String?> adId() => Adjust.getAdid();
}
