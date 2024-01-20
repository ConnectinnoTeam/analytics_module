import 'package:analytics/src/events/abstract/base_event.dart';

class ClickEvent with IEvent {
  ClickEvent({required this.data});
  final Map<String, dynamic> data;

  @override
  String get eventName => "click_event";

  @override
  Map<String, dynamic> toJson() => data;
}
