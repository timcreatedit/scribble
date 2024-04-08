import 'dart:math';

import 'package:simpli/src/domain/simplifier.dart';

/// {@template visvalingam_simplifier}
/// A simplifier that uses the Visvalingam algorithm to simplify a list of
/// points.
/// {@endtemplate}
class VisvalingamSimplifier implements Simplifier {
  /// {@macro visvalingam_simplifier}
  const VisvalingamSimplifier();

  @override
  List<Point<num>> simplify(
    List<Point<num>> points, {
    double pixelTolerance = 50,
  }) {
    throw UnimplementedError();
  }
}
