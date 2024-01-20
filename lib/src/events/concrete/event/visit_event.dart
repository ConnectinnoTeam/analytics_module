import '../../abstract/base_event.dart';

/// [VisitEvent] that associates with [initState]
/// [VisitEvent] is a sub-class of [IEvent]
/// Any render related event should be either [VisitEvent] or sub-class of it
class VisitEvent with IEvent {
  VisitEvent({required this.data});
  final Map<String, dynamic> data;

  @override
  Map<String, dynamic> toJson() => data;

  @override
  String get eventName => "visit_event";
}
