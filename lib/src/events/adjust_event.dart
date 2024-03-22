import 'package:analytics/src/service/adjust_service.dart';
import 'package:flutter/foundation.dart';

sealed class IAdjustEvent {
  IAdjustEvent({required this.token});

  final String token;

  void registerEvent() {
    AdjustService.instance.trackEvent(event: this);
    printEvent();
  }

  void printEvent() {
    if (!kDebugMode) return;
    print("-" * 20);
    print('Event: $token');
    print("-" * 20);
  }
}

class AdjustTrackEvent extends IAdjustEvent {
  AdjustTrackEvent({required super.token});
}

class AdjustRevenueEvent extends IAdjustEvent {
  AdjustRevenueEvent({
    required super.token,
    required this.revenue,
    required this.currency,
  });

  final double revenue;
  final String currency;

  @override
  void printEvent() {
    if (!kDebugMode) return;
    print("-" * 20);
    print('Event: $token');
    print('Revenue: $revenue');
    print('Currency: $currency');
    print("-" * 20);
  }
}

class AdjustAdRevenueEvent extends IAdjustEvent {
  AdjustAdRevenueEvent({
    required super.token,
    required this.revenue,
    required this.currency,
    required this.source,
    required this.placement,
    required this.network,
  });

  final double revenue;
  final String currency;
  final String source;
  final String placement;
  final String network;

  @override
  void printEvent() {
    if (!kDebugMode) return;
    print("-" * 20);
    print('Event: $token');
    print('Revenue: $revenue');
    print('Source: $source');
    print('Placement: $placement');
    print('Network: $network');
    print("-" * 20);
  }
}
