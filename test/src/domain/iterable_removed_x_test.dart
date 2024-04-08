import 'package:flutter_test/flutter_test.dart';
import 'package:scribble/src/domain/iterable_removed_x.dart';

void main() {
  setUp(() {});

  group('IterableRemovedX', () {
    group('removedIndices', () {
      const list = [1, 2, 3, 4, 5, 3];
      test('returns empty list if iterables are the same', () async {
        final removedIndices = list.removedIndices(list);
        expect(removedIndices, isEmpty);
      });

      test('returns indices of one removed element', () async {
        final removedIndices = list.removedIndices([2, 3, 4, 5, 3]);
        expect(removedIndices, equals([0]));
      });

      test('works with duplicates', () async {
        final removedIndices = list.removedIndices([1, 2, 4, 5, 3]);
        expect(removedIndices, equals([2]));
      });

      test('works with multiple removed elements', () async {
        final removedIndices = list.removedIndices([1, 2, 4, 5]);
        expect(removedIndices.toList(), [2, 5]);
      });
    });
  });
}
