import 'dart:math';

import 'package:simpli/src/data/visvalingam_simplifier.dart';
import 'package:test/test.dart';

void main() {
  group('VisvalingamSimplifier', () {
    late VisvalingamSimplifier sut;
    setUp(() {
      sut = const VisvalingamSimplifier();
    });

    const path = [
      Point(0, 0),
      Point(1, 1),
      Point(2, 0),
      Point(3, 2),
      Point(4, 0),
      Point(5, 1),
      Point(6, 0),
      Point(7, 2),
      Point(8, 0),
      Point(9, 1),
      Point(10, 2),
    ];

    group('simplify', () {
      test('does not simplify when tolerance == 0', () async {
        final simplified = sut.simplify(path, pixelTolerance: 0);
        expect(simplified, path);
      });

      test('does not simplify when path has less than 3 points', () async {
        const shortLine = [Point(0, 0), Point(1, 1)];
        final simplified = sut.simplify(shortLine, pixelTolerance: 1);
        expect(simplified, shortLine);
      });

      test('strips all points if tolerance is zero', () async {
        final simplified = sut.simplify(path, pixelTolerance: double.infinity);
        expect(simplified, [path.first, path.last]);
      });

      test('simplifies path', () async {
        final simplified = sut.simplify(path, pixelTolerance: 1.5);
        final pathOnlyOutliers =
            path.where((p) => p.y == 2 || p.y == 0).toList();
        expect(simplified, pathOnlyOutliers);
      });
    });
  });
}
