import 'package:analytics/analytics.dart';
import 'package:flutter/cupertino.dart';

/// [VisitEventMixin] that associates with [StatefulWidget]
/// [VisitEventMixin] is a mixin of [State]
mixin VisitEventMixin<T extends StatefulWidget> on State<T> {
  VisitEvent get visitEvent => VisitEvent(data: _visitEventData);

  @override
  void initState() {
    super.initState();
    visitEvent.registerEvent();
  }

  Map<String, dynamic> get _visitEventData => {
        'screen_name': T.toString(),
      };
}
