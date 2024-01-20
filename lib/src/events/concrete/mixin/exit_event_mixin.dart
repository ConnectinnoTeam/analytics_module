import 'package:analytics/analytics.dart';
import 'package:flutter/cupertino.dart';

mixin ExitEventMixin<T extends StatefulWidget> on State<T> {
  ExitEvent get exitEvent => ExitEvent(data: _exitEventData);

  @override
  void dispose() {
    exitEvent.registerEvent();
    super.dispose();
  }

  Map<String, dynamic> get _exitEventData => {
        'screen_name': T.toString(),
      };
}
