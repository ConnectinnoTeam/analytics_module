import '../../abstract/base_event.dart';

/// [ExitEvent] that associates with [WillPopScope]
/// [ExitEvent] is a sub-class of [IEvent]
/// Any Exit related event should be either [ExitEvent] or sub-class of it
class ExitEvent with IEvent {
  ExitEvent({required this.data});
  final Map<String, dynamic> data;

  @override
  Map<String, dynamic> toJson() => data;

  @override
  String get eventName => "exit_event";
}
