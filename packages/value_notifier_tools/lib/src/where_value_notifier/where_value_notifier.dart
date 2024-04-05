import 'package:flutter/foundation.dart';

/// {@template where_value_notifier}
/// A [ValueNotifier] that provides a custom [updateShouldNotify] function to
/// determine whether the listener should be notified.
///
/// Extend this to create a custom [ValueNotifier] that notifies listeners based
/// on the provided [updateShouldNotify] function.
///
/// **Example:**
/// In this example, the MyValueNotifier notifies listeners when the new value
/// is less than the previous value.
/// ```dart
/// class MyValueNotifier extends WhereValueNotifier<int> {
///  MyValueNotifier(int value) : super(value);
///
///  @override
///  bool updateShouldNotify(int previous, int next) {
///   return previous > next;
///  }
/// }
/// ```
/// {@endtemplate}
abstract class WhereValueNotifier<T> extends ValueNotifier<T> {
  /// {@macro where_value_notifier}
  WhereValueNotifier(super.value) : _value = value;

  T _value;

  @override
  T get value => _value;

  @override
  set value(T newValue) {
    final previous = _value;
    _value = newValue;
    if (updateShouldNotify(previous, newValue)) notifyListeners();
  }

  /// The function that determines whether the listeners should be notified.
  ///
  /// If this function returns `true`, the listener will be notified.
  bool updateShouldNotify(T previous, T next);
}
