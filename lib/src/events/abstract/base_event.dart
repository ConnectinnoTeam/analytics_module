import 'package:analytics/src/service/analytics_service.dart';
import 'package:flutter/foundation.dart';

mixin IEvent {
  String get eventName;
  Map<String, dynamic> toJson();

  Future<void> registerEvent() async {
    await AnalyticsService.instance.logEvent(event: this);
    printEvent();
  }

  void printEvent() {
    if (!kDebugMode) return;
    print("-" * 20);
    print('Event: $eventName');
    print('Data: ${toJson()}');
    print("-" * 20);
  }
}
