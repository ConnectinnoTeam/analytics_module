import 'package:flutter/cupertino.dart';

import '../event/duration_event.dart';

/// [DurationEventMixin] that associates with [StatefulWidget]
/// [DurationEventMixin] is a mixin of [State]
/// Any Duration related event should be either [DurationEventMixin] or sub-class of it
///
mixin DurationEventMixin<T extends StatefulWidget> on State<T> {
  final DateTime _startTime = DateTime.now();

  DurationEvent get durationEvent => DurationEvent(data: _durationData);

  @override
  void dispose() {
    super.dispose();
    durationEvent.registerEvent();
  }

  Map<String, dynamic> get _durationData {
    final DateTime endTime = DateTime.now();
    final Duration duration = endTime.difference(_startTime);
    return {
      'screen_name': T.toString(),
      'time_spent': duration.inMilliseconds,
    };
  }
}
