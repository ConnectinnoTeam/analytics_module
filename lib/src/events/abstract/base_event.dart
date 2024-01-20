import 'package:flutter/foundation.dart';

import '../../controller/analytics_controller.dart';

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
