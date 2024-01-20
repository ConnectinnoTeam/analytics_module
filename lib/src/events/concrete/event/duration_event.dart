import 'package:analytics/analytics.dart';

/// [DurationEvent] that associates with [Timer]
/// [DurationEvent] is a sub-class of [IEvent]
/// Any Duration related event should be either [DurationEvent] or sub-class of it
class DurationEvent with IEvent {
  DurationEvent({required this.data});

  @override
  String get eventName => "duration_event";

  final Map<String, dynamic> data;

  @override
  Map<String, dynamic> toJson() => data;
}
