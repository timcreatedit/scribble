import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:scribble/scribble.dart';
import 'package:scribble/src/view/painting/scribble_editing_painter.dart';
import 'package:scribble/src/view/painting/scribble_painter.dart';

void main() {
  setUp(() {});

  group('Scribble', () {
    group('simulatePressure', () {
      Widget build({required bool simulatePressure}) {
        return MaterialApp(
          home: Scribble(
            notifier: ScribbleNotifier(),
            simulatePressure: simulatePressure,
          ),
        );
      }

      testWidgets(
        'sets simulatePressure on ScribbleEditingPainter',
        (WidgetTester tester) async {
          await tester.pumpWidget(build(simulatePressure: true));
          final finder = find.byType(CustomPaint);
          final widgets =
              finder.evaluate().map((e) => e.widget).cast<CustomPaint>();
          final painters = widgets.map((e) => e.foregroundPainter).toList();
          final painter = painters.whereType<ScribbleEditingPainter>().first;
          expect(painter.simulatePressure, isTrue);
        },
      );

      testWidgets(
        'sets simulatePressure on ScribblePainter',
        (WidgetTester tester) async {
          await tester.pumpWidget(build(simulatePressure: true));
          final finder = find.byType(CustomPaint);
          final widgets =
              finder.evaluate().map((e) => e.widget).cast<CustomPaint>();
          final painters = widgets.map((e) => e.painter).toList();
          final painter = painters.whereType<ScribblePainter>().first;
          expect(painter.simulatePressure, isTrue);
        },
      );
    });
  });
}
