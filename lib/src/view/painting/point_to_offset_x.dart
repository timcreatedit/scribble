import 'dart:ui';

import 'package:scribble/src/domain/model/sketch/sketch.dart';

/// Extension on [Point] to convert it to an [Offset].
extension PointToOffsetX on Point {
  /// Converts a [Point] to a [Offset].
  Offset get asOffset => Offset(x, y);
}
