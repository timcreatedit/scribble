import 'dart:math';

import 'package:simpli/src/data/rdp_simplifier.dart';
import 'package:simpli/src/data/visvalingam_simplifier.dart';

/// Represents a line simplificatoin algorithm.
abstract interface class Simplifier {
  const factory Simplifier.ramerDouglasPeucker() = RdpSimplifier;
  const factory Simplifier.visvalingam() = VisvalingamSimplifier;

  /// Simplifies a list of points using a sensible default simplification.
  ///
  /// The [pixelTolerance] parameter is used to determine the tolerance for
  /// simplification. A value of 0.0 will result in no simplification.
  /// Defaults to 50px.
  /// The exact effect of the value will depend on the implementation.
  List<Point> simplify(
    List<Point> points, {
    double pixelTolerance = 50.0,
  });
}
