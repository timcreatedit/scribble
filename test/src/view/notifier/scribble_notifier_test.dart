import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:scribble/scribble.dart';
import 'package:scribble/src/view/simplification/sketch_simplifier.dart';

class _MockSimplifier extends Mock implements SketchSimplifier {}

void main() {
  setUp(() {
    registerFallbackValue(const Sketch(lines: []));
    registerFallbackValue(
      const SketchLine(points: [], color: 0xFFFFFF, width: 2),
    );
  });

  group('ScribbleNotifier', () {
    late ScribbleNotifier sut;
    late _MockSimplifier simplifier;

    const line = SketchLine(points: [Point(1, 1)], color: 0xFFFFFFFF, width: 2);
    const emptyLine = SketchLine(points: [], color: 0x0, width: 0);
    const sketch = Sketch(lines: [line]);
    const emptySketch = Sketch(lines: []);

    setUp(() {
      simplifier = _MockSimplifier();

      when(
        () => simplifier.simplify(
          any(),
          pixelTolerance: any(named: "pixelTolerance"),
        ),
      ).thenReturn(emptyLine);

      when(
        () => simplifier.simplifySketch(
          any(),
          pixelTolerance: any(named: "pixelTolerance"),
        ),
      ).thenAnswer(
        (invocation) => invocation.namedArguments[#pixelTolerance] == 0
            ? invocation.positionalArguments[0] as Sketch
            : emptySketch,
      );

      sut = ScribbleNotifier(
        sketch: sketch,
        simplifier: simplifier,
      );
    });

    group("constructor", () {
      test('initializes with the given sketch', () async {
        expect(sut.value.sketch, sketch);
        verify(() => simplifier.simplifySketch(sketch, pixelTolerance: 0));
      });
    });

    group('setSketch', () {
      test('is undoable by default if nothing happened before', () async {
        expect(sut.canUndo, false);
        expect(sut.canRedo, false);
        sut.setSketch(sketch: emptySketch);
        expect(sut.canUndo, true);
        expect(sut.canRedo, false);
        sut.undo();
        expect(sut.currentSketch, sketch);
      });

      test('is undoable by default if something happened before', () async {
        sut
          ..onPointerDown(const PointerDownEvent())
          ..onPointerUpdate(const PointerMoveEvent(position: Offset(100, 100)))
          ..onPointerUp(const PointerUpEvent(position: Offset(100, 100)));

        final newSketch = sut.currentSketch;
        expect(sut.canUndo, true);

        sut.setSketch(sketch: emptySketch);
        expect(sut.canUndo, true);
        expect(sut.canRedo, false);
        sut.undo();
        expect(sut.currentSketch, newSketch);
      });

      test('is not undoable if set so', () async {
        expect(sut.canUndo, false);
        expect(sut.canRedo, false);
        sut.setSketch(sketch: emptySketch, addToUndoHistory: false);
        expect(sut.canUndo, false);
        expect(sut.canRedo, false);
        sut.undo();
        expect(sut.currentSketch, emptySketch);
      });

      test('is not undoable if it changed nothing', () async {
        expect(sut.canUndo, false);
        expect(sut.canRedo, false);
        sut.setSketch(sketch: sketch);
        expect(sut.canUndo, false);
        expect(sut.canRedo, false);
      });
    });

    group("simplify", () {
      test('calls simplifier method', () async {
        sut.setSimplificationTolerance(2);
        expect(sut.value.simplificationTolerance, 2);
        sut.simplify();
        verify(() => simplifier.simplifySketch(sketch, pixelTolerance: 2));
        expect(sut.value.sketch, emptySketch);
      });

      test('is undoable by default', () async {
        expect(sut.canUndo, false);
        sut
          ..setSimplificationTolerance(2)
          ..simplify();
        expect(sut.canUndo, true);
      });

      test('is not undoable if set so', () async {
        expect(sut.canUndo, false);
        sut
          ..setSimplificationTolerance(2)
          ..simplify(addToUndoHistory: false);
        expect(sut.canUndo, false);
      });

      test('is not undoable if it did nothing', () async {
        expect(sut.canUndo, false);
        sut
          ..setSimplificationTolerance(0)
          ..simplify();
        expect(sut.canUndo, false);
      });
    });
  });
}
