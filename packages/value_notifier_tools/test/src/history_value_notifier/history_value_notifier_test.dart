// ignore_for_file: prefer_const_constructors
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:value_notifier_tools/src/history_value_notifier/history_value_notifier.dart';

class _MockNotifier extends HistoryValueNotifier<int> with Mock {
  _MockNotifier(super.value);
}

void main() {
  group('HistoryValueNotifier', () {
    test('can be instantiated', () {
      expect(HistoryValueNotifier(1), isNotNull);
      expect(HistoryValueNotifier(1).value, 1);
    });

    group('as-is', () {
      late HistoryValueNotifier<int> sut;

      setUp(() {
        sut = HistoryValueNotifier(0);
      });
      test('can undo to initial state', () {
        expect(sut.value, 0);
        expect(sut.canUndo, false);
        expect(sut.canRedo, false);
        sut.value = 1;
        expect(sut.value, 1);
        expect(sut.canUndo, true);
        expect(sut.canRedo, false);
        sut.undo();
        expect(sut.value, 0);
        expect(sut.canUndo, false);
        expect(sut.canRedo, true);
        sut.redo();
        expect(sut.value, 1);
        expect(sut.canUndo, true);
        expect(sut.canRedo, false);
      });

      test('clears redo queue when setting value while undone', () {
        expect(sut.value, 0);
        expect(sut.canUndo, false);
        expect(sut.canRedo, false);
        sut.value = 1;
        expect(sut.value, 1);
        expect(sut.canUndo, true);
        expect(sut.canRedo, false);
        sut.undo();
        expect(sut.value, 0);
        expect(sut.canUndo, false);
        expect(sut.canRedo, true);
        sut.value = 2;
        expect(sut.value, 2);
        expect(sut.canUndo, true);
        expect(sut.canRedo, false);
      });

      test('clearRedoQueue works', () {
        sut.value = 1;
        expect(sut.value, 1);
        sut.value = 2;
        expect(sut.canUndo, true);
        expect(sut.canRedo, false);
        sut.undo();
        expect(sut.value, 1);
        expect(sut.canUndo, true);
        expect(sut.canRedo, true);
        sut.clearRedoQueue();
        expect(sut.canRedo, false);
      });
    });

    group('as extension', () {
      late _MockNotifier sut;

      setUp(() {
        sut = _MockNotifier(0);
      });

      test('can undo to initial state', () {
        expect(sut.value, 0);
        expect(sut.canUndo, false);
        expect(sut.canRedo, false);
        sut.value = 1;
        expect(sut.value, 1);
        expect(sut.canUndo, true);
        expect(sut.canRedo, false);
        sut.undo();
        expect(sut.value, 0);
        expect(sut.canUndo, false);
        expect(sut.canRedo, true);
        sut.redo();
        expect(sut.value, 1);
        expect(sut.canUndo, true);
        expect(sut.canRedo, false);
      });

      test('clears redo queue when setting value while undone', () {
        expect(sut.value, 0);
        expect(sut.canUndo, false);
        expect(sut.canRedo, false);
        sut.value = 1;
        expect(sut.value, 1);
        expect(sut.canUndo, true);
        expect(sut.canRedo, false);
        sut.undo();
        expect(sut.value, 0);
        expect(sut.canUndo, false);
        expect(sut.canRedo, true);
        sut.value = 2;
        expect(sut.value, 2);
        expect(sut.canUndo, true);
        expect(sut.canRedo, false);
      });

      test('clearRedoQueue works', () {
        sut.value = 1;
        expect(sut.value, 1);
        sut.value = 2;
        expect(sut.canUndo, true);
        expect(sut.canRedo, false);
        sut.undo();
        expect(sut.value, 1);
        expect(sut.canUndo, true);
        expect(sut.canRedo, true);
        sut.clearRedoQueue();
        expect(sut.canRedo, false);
      });
    });
  });
}