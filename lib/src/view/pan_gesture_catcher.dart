import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';

/// {@template gesture_catcher}
/// A widget that catches gestures for a given set of pointer kinds.
///
/// Any gestures of pointers contained in [pointerKindsToCatch] will be caught
/// by this widget and not be passed to any other widgets in the widget tree.
/// {@endtemplate}
class GestureCatcher extends StatelessWidget {
  /// {@macro gesture_catcher}
  const GestureCatcher({
    required this.pointerKindsToCatch,
    required this.child,
    super.key,
  });

  /// The pointer kinds to catch.
  final Set<PointerDeviceKind> pointerKindsToCatch;

  /// The child widget.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return RawGestureDetector(
      key: ValueKey(pointerKindsToCatch),
      gestures: {
        _GestureCatcherRecognizer:
            GestureRecognizerFactoryWithHandlers<_GestureCatcherRecognizer>(
          () => _GestureCatcherRecognizer(
            debugOwner: this,
            pointerKindsToCatch: pointerKindsToCatch,
          ),
          (_GestureCatcherRecognizer instance) {},
        ),
      },
      child: child,
    );
  }
}

class _GestureCatcherRecognizer extends OneSequenceGestureRecognizer {
  /// Create a gesture recognizer for tracking movement on a plane.
  _GestureCatcherRecognizer({
    required Set<PointerDeviceKind> pointerKindsToCatch,
    super.debugOwner,
  }) : super(supportedDevices: pointerKindsToCatch);

  @override
  String get debugDescription => 'pan catcher';

  @override
  void didStopTrackingLastPointer(int pointer) {}

  @override
  void handleEvent(PointerEvent event) {
    resolve(GestureDisposition.accepted);
  }
}
