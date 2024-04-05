import 'package:mocktail/mocktail.dart';

/// A simple listener that can be used in tests to verify that it was called.
class MockListener extends Mock {
  void call();
}
