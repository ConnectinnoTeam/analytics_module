import 'package:adjust_sdk/adjust.dart';
import 'package:flutter/material.dart';

mixin AdjustSessionTrackerMixin<T extends StatefulWidget> on State<T> {
  late final AppLifecycleListener listener;
  @override
  void initState() {
    super.initState();
    listener = AppLifecycleListener(
      onResume: () => Adjust.onResume(),
      onPause: () => Adjust.onPause(),
    );
  }

  @override
  void dispose() {
    listener.dispose();
    super.dispose();
  }
}
