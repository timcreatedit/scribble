import 'package:flutter_test/flutter_test.dart';
import 'package:scribble/scribble.dart';
import 'package:scribble/src/view/simplification/sketch_simplifier.dart';

void main() {
  setUp(() {});

  group('VisvalingamSimplifier', () {
    late VisvalingamSimplifier sut;

    setUp(() {
      sut = const VisvalingamSimplifier();
    });
    group('simplify', () {
      const points = [
        Point(0, 0),
        Point(1, 1),
        Point(2, 0),
        Point(3, 3),
        Point(4, 0),
      ];
      const line = SketchLine(points: points, color: 0xFF000000, width: 2);
      test('simplifies the given list of points', () async {
        final simplified = sut.simplify(line, pixelTolerance: 2);

        expect(
          simplified,
          line.copyWith(
            points: [
              points[0],
              points[2],
              points[3],
              points[4],
            ],
          ),
        );
      });
    });

    group('simplifySketch', () {
      const sketch = Sketch(
        lines: [
          SketchLine(
            points: [
              Point(0, 0),
              Point(1, 1),
              Point(2, 0),
              Point(3, 3),
              Point(4, 0),
            ],
            color: 0xFF000000,
            width: 10,
          ),
          SketchLine(
            points: [
              Point(0, 0),
              Point(1, 1),
              Point(2, 0),
              Point(3, 3),
              Point(4, 0),
            ],
            color: 0xFF000000,
            width: 10,
          ),
        ],
      );
      test('simplifies the given sketch', () async {
        final simplified = sut.simplifySketch(sketch, pixelTolerance: 2);

        expect(
          simplified,
          const Sketch(
            lines: [
              SketchLine(
                points: [
                  Point(0, 0),
                  Point(2, 0),
                  Point(3, 3),
                  Point(4, 0),
                ],
                color: 0xFF000000,
                width: 10,
              ),
              SketchLine(
                points: [
                  Point(0, 0),
                  Point(2, 0),
                  Point(3, 3),
                  Point(4, 0),
                ],
                color: 0xFF000000,
                width: 10,
              ),
            ],
          ),
        );
      });
    });
  });
}
