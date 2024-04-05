import 'package:flutter/foundation.dart';

/// Use this mixin on any [ValueNotifier] to add a custom [updateShouldNotify]
/// function to determine whether the listeners should be notified.
///
/// {@macro where_value_notifier}
mixin WhereValueNotifierMixin<T> on ValueNotifier<T> {
  late T _value = super.value;

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
