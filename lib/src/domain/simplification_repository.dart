import 'package:scribble/scribble.dart';

/// A repository for simplifying a list of points.
abstract interface class SimplificationRepository {
  /// Simplifies a list of points by reducing the number of points in the
  /// returned list.
  ///
  /// The [degree] parameter controls the amount of simplification. A higher
  /// value will result in more points being removed. The [degree] value should
  /// be between 0 and 1, the default value is 0.5.
  List<Point> simplifyPoints(
    List<Point> points, {
    double degree = 0.5,
  });
}
