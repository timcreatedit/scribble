import 'package:flutter_test/flutter_test.dart';
import 'package:scribble/scribble.dart';
import 'package:scribble/src/data/dp_simplification_repository.dart';

void main() {
  setUp(() {});

  group('DpSimplificationRepository', () {
    late DpSimplificationRepository sut;

    setUp(() {
      sut = const DpSimplificationRepository();
    });

    group('perpendicularDistance', () {
      test('0 if point equals start', () async {
        final distance = sut.perpendicularDistance(
          point: const Point(0, 0),
          lineStart: const Point(0, 0),
          lineEnd: const Point(2, 0),
        );
        expect(distance, 0);
      });
      test('0 if point equals end', () async {
        final distance = sut.perpendicularDistance(
          point: const Point(0, 0),
          lineStart: const Point(0, 0),
          lineEnd: const Point(2, 0),
        );
        expect(distance, 0);
      });
      test('0 if point is on line', () async {
        final distance = sut.perpendicularDistance(
          point: const Point(1, 0),
          lineStart: const Point(0, 0),
          lineEnd: const Point(2, 0),
        );
        expect(distance, 0);
      });

      test('correct distance if point is above line', () async {
        final distance = sut.perpendicularDistance(
          point: const Point(1, 1),
          lineStart: const Point(0, 0),
          lineEnd: const Point(2, 0),
        );
        expect(distance, 1);
      });

      test('correct distance if point is next to line', () async {
        final distance = sut.perpendicularDistance(
          point: const Point(4, 0),
          lineStart: const Point(0, 0),
          lineEnd: const Point(2, 0),
        );
        expect(distance, 0);
      });

      test('correct distance if point is below line', () async {
        final distance = sut.perpendicularDistance(
          point: const Point(1, -1),
          lineStart: const Point(0, 0),
          lineEnd: const Point(2, 0),
        );
        expect(distance, 1);
      });

      test('works for angled lines', () async {
        final distance = sut.perpendicularDistance(
          point: const Point(1, 1),
          lineStart: const Point(0, 0),
          lineEnd: const Point(2, 2),
        );
        expect(distance, 0);
      });
    });
  });
}
