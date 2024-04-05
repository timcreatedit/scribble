import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:value_notifier_tools/src/select_value_notifier/select_value_notifier.dart';

import '../../util/mock_listener.dart';

typedef _Model = ({int interesting, int uninteresting});

void main() {
  group('SelectValueNotifier', () {
    late ValueNotifier<_Model> notifier;
    late MockListener notifierListener;
    late SelectValueNotifier<_Model, int> sut;
    late MockListener sutListener;

    setUp(() {
      notifier = ValueNotifier((interesting: 0, uninteresting: 0));
      notifierListener = MockListener();
      notifier.addListener(notifierListener.call);
      addTearDown(() => notifier.removeListener(notifierListener.call));

      sut = SelectValueNotifier(
        parentNotifier: notifier,
        selector: (model) => model.interesting,
      );
      sutListener = MockListener();

      sut.addListener(sutListener.call);
      addTearDown(() => sut.removeListener(sutListener.call));
    });

    group('notifyListeners()', () {
      test(
          'should notify listeners when the new value is different from the '
          'previous value', () {
        notifier.value = (interesting: 1, uninteresting: 1);
        verify(() => notifierListener.call());
        verify(() => sutListener.call());
        expect(sut.value, 1);
      });

      test(
          'should not notify listeners when the new value is the same as the '
          'previous value', () {
        notifier.value = (interesting: 0, uninteresting: 1);
        verify(() => notifierListener.call());
        verifyNever(() => sutListener.call());
        expect(sut.value, 0);
      });
    });

    group('set value', () {
      test('should throw an UnsupportedError', () {
        // ignore: invalid_use_of_protected_member
        expect(() => sut.value = 1, throwsUnsupportedError);
      });
    });
  });

  group('SelectValueNotifierX', () {
    late ValueNotifier<_Model> notifier;

    setUp(() {
      notifier = ValueNotifier((interesting: 0, uninteresting: 0));
    });

    group('select()', () {
      test('should return a SelectValueNotifier that is set up correctly', () {
        // ignore: omit_local_variable_types, prefer_function_declarations_over_variables
        final Selector<_Model, int> selector = (model) => model.interesting;
        final sut = notifier.select(selector);

        expect(sut.parentNotifier, notifier);
        expect(sut.selector, selector);
      });
    });
  });
}
