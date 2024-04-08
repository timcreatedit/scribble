import 'package:flutter_test/flutter_test.dart';
import 'package:scribble/scribble.dart';
import 'package:scribble/src/view/simplification/simplifier.dart';

void main() {
  setUp(() {});

  group('VisvalingamSimplifier', () {
    group('simplify', () {
      late VisvalingamSimplifier sut;

      setUp(() {
        sut = const VisvalingamSimplifier();
      });

      const points = [
        Point(0, 0),
        Point(1, 1),
        Point(2, 0),
        Point(3, 3),
        Point(4, 0),
      ];
      test('simplifies the given list of points', () async {
        final simplified = sut.simplify(points, pixelTolerance: 2);

        expect(simplified, [
          points[0],
          points[2],
          points[3],
          points[4],
        ]);
      });
    });
  });
}
