import 'package:analytics/analytics.dart';
import 'package:flutter/material.dart';

/// [ClickEventMixin] that associates with [ElevatedButton],[TextButton]
/// [IconButton] etc. Any Click related event should be either [ClickEventMixin]
mixin ClickEventMixin on ButtonStyleButton {
  ClickEvent get clickEvent => ClickEvent(data: data);

  @override
  VoidCallback get onPressed => () {
        clickEvent.registerEvent();
        super.onPressed?.call();
      };

  Map<String, dynamic> get data;
}
