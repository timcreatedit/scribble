import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:value_notifier_tools/value_notifier_tools.dart';

import '../../util/mock_listener.dart';

class _MockUpdateShouldNotify extends Mock {
  bool call(int previous, int next);
}

void main() {
  group('WhereValueNotifierFromParent', () {
    late ValueNotifier<int> notifier;
    late MockListener notifierListener;
    late WhereValueNotifierFromParent<int> sut;
    late MockListener sutListener;
    late _MockUpdateShouldNotify updateShouldNotify;
    setUp(() {
      notifier = ValueNotifier(0);
      notifierListener = MockListener();
      notifier.addListener(notifierListener.call);
      addTearDown(() => notifier.removeListener(notifierListener.call));

      updateShouldNotify = _MockUpdateShouldNotify();
      sut = WhereValueNotifierFromParent(
        parentNotifier: notifier,
        updateShouldNotify: updateShouldNotify.call,
      );
      sutListener = MockListener();
      sut.addListener(sutListener.call);
      addTearDown(() => sut.removeListener(sutListener.call));
    });

    group('notifyListeners()', () {
      test('should notify listeners when updateShouldNotify is true', () {
        when(() => updateShouldNotify.call(any(), any())).thenReturn(true);

        notifier.value = -1;
        verify(() => notifierListener.call());
        verify(() => sut.updateShouldNotify(0, -1));
        verify(() => sutListener.call());
        expect(sut.value, -1);
      });

      test('should not notify listeners when updateShouldNotify is false', () {
        when(() => sut.updateShouldNotify(any(), any())).thenReturn(false);

        notifier.value = 1;
        verify(() => notifierListener.call());
        verify(() => sut.updateShouldNotify(0, 1));
        verifyNever(() => sutListener.call());
        expect(sut.value, 1);
      });
    });

    group('set value', () {
      test('should set the parent notifier value', () {
        when(() => updateShouldNotify.call(any(), any())).thenReturn(true);
        sut.value = 2;
        expect(notifier.value, 2);
      });

      test('should notify listeners when updateShouldNotify is true', () {
        when(() => updateShouldNotify.call(any(), any())).thenReturn(true);

        sut.value = -1;
        verify(() => notifierListener.call());
        verify(() => sut.updateShouldNotify(0, -1));
        verify(() => sutListener.call());
        expect(sut.value, -1);
      });

      test('should not notify listeners when updateShouldNotify is false', () {
        when(() => sut.updateShouldNotify(any(), any())).thenReturn(false);

        sut.value = 1;
        verify(() => notifierListener.call());
        verify(() => sut.updateShouldNotify(0, 1));
        verifyNever(() => sutListener.call());
        expect(sut.value, 1);
      });
    });

    group('dispose()', () {
      test('should remove the listener from the parent notifier', () {
        when(() => updateShouldNotify.call(any(), any())).thenReturn(true);

        notifier.value = -1;
        verify(() => notifierListener.call());
        verify(() => sutListener.call());
        sut.dispose();
        notifier.value = 2;
        verifyNever(() => sutListener.call());
      });
    });

    group('SelectedValueNotifierX', () {
      test('should create a WhereValueNotifierFromParent', () {
        when(() => updateShouldNotify.call(any(), any())).thenReturn(true);

        final where = notifier.where(updateShouldNotify.call);
        expect(where, isA<WhereValueNotifierFromParent<int>>());
        where.updateShouldNotify(0, 1);
        verify(() => updateShouldNotify.call(0, 1));
      });
    });
  });
}
