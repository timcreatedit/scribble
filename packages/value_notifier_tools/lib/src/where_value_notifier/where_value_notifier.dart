import 'package:flutter/foundation.dart';
import 'package:value_notifier_tools/src/where_value_notifier/where_value_notifier_mixin.dart';

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
abstract class WhereValueNotifier<T> extends ValueNotifier<T>
    with WhereValueNotifierMixin<T> {
  /// {@macro where_value_notifier}
  WhereValueNotifier(super.value);
}
