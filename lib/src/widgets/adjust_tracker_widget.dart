import 'package:analytics/src/mixin/adjust_session_tracker_mixin.dart';
import 'package:flutter/material.dart';

/// Call this widget in MaterialApp Builder to initialize Adjust SDK
/// MaterialApp(
///   builder: (context, child) {
///     return AdjustSdkWidget(child:child);
///   },
///  home: HomeScreen(),
/// )
///
class AdjustTrackerWidget extends StatefulWidget {
  const AdjustTrackerWidget({super.key, required this.child});
  final Widget child;

  @override
  State<AdjustTrackerWidget> createState() => _AdjustTrackerWidgetState();
}

class _AdjustTrackerWidgetState extends State<AdjustTrackerWidget>
    with AdjustSessionTrackerMixin {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
