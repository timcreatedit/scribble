import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';

class GestureCatcher extends StatelessWidget {
  const GestureCatcher({
    Key? key,
    required this.pointerKindsToCatch,
    required this.child,
  }) : super(key: key);

  final Set<PointerDeviceKind> pointerKindsToCatch;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return RawGestureDetector(
      key: ValueKey(pointerKindsToCatch),
      gestures: {
        GestureCatcherRecognizer:
            GestureRecognizerFactoryWithHandlers<GestureCatcherRecognizer>(
          () => GestureCatcherRecognizer(
            debugOwner: this,
            pointerKindsToCatch: pointerKindsToCatch,
          ),
          (GestureCatcherRecognizer instance) {
          },
        )
      },
      child: child,
    );
  }
}

/// Catches movement both horizontally and vertically for a given set of
/// pointer kinds..
///
/// See also:
///
///  * [ImmediateMultiDragGestureRecognizer], for a similar recognizer that
///    tracks each touch point independently.
///  * [DelayedMultiDragGestureRecognizer], for a similar recognizer that
///    tracks each touch point independently, but that doesn't start until
///    some time has passed.
class GestureCatcherRecognizer extends OneSequenceGestureRecognizer {
  /// Create a gesture recognizer for tracking movement on a plane.
  GestureCatcherRecognizer({
    required Set<PointerDeviceKind> pointerKindsToCatch,
    Object? debugOwner,
  }) : super(debugOwner: debugOwner, supportedDevices: pointerKindsToCatch);

  @override
  String get debugDescription => 'pan catcher';

  @override
  void didStopTrackingLastPointer(int pointer) {
  }

  @override
  void handleEvent(PointerEvent event) {
    resolve(GestureDisposition.accepted);
  }
}
