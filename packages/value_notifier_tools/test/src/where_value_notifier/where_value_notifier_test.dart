import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:value_notifier_tools/src/where_value_notifier/where_value_notifier.dart';

import '../../util/mock_listener.dart';

class _TestNotifier extends WhereValueNotifier<int> with Mock {
  _TestNotifier(super.value);

  @override
  bool updateShouldNotify(int previous, int next);
}

void main() {
  group('WhereValueNotifier', () {
    late _TestNotifier sut;
    late MockListener listener;
    setUp(() {
      sut = _TestNotifier(0);
      listener = MockListener();
      sut.addListener(listener.call);
      addTearDown(() => sut.removeListener(listener.call));
    });

    group('notifyListeners()', () {
      test('should notify listeners when updateShouldNotify is true', () {
        when(() => sut.updateShouldNotify(any(), any())).thenReturn(true);

        sut.value = -1;
        verify(() => listener.call());
        verify(() => sut.updateShouldNotify(0, -1));
        expect(sut.value, -1);
      });

      test('should not notify listeners when updateShouldNotify is false', () {
        when(() => sut.updateShouldNotify(any(), any())).thenReturn(false);

        sut.value = 1;
        verifyNever(() => listener.call());
        verify(() => sut.updateShouldNotify(0, 1));
        expect(sut.value, 1);
      });
    });
  });
}
