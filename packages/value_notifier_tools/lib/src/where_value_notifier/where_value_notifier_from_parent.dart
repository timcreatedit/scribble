import 'package:flutter/foundation.dart';
import 'package:value_notifier_tools/src/where_value_notifier/where_value_notifier.dart';

/// A function that compares the previous value with the new value and returns
/// whether the listener should be notified.
typedef WhereFilter<T> = bool Function(T previous, T next);

///
/// A [WhereValueNotifier] that listens to a parent [ValueNotifier] and notifies
/// listeners based on the provided [updateShouldNotify] function.
class WhereValueNotifierFromParent<T> extends WhereValueNotifier<T> {
  /// {@macro selected_value_notifier}
  WhereValueNotifierFromParent({
    required this.parentNotifier,
    required WhereFilter<T> updateShouldNotify,
  })  : filter = updateShouldNotify,
        super(parentNotifier.value) {
    parentNotifier.addListener(_parentListener);
  }

  /// The parent notifier to listen to.
  final ValueNotifier<T> parentNotifier;

  /// The function that determines whether the listeners should be notified.
  final WhereFilter<T> filter;

  @override
  set value(T newValue) {
    parentNotifier.value = newValue;
  }

  void _parentListener() {
    super.value = parentNotifier.value;
  }

  @override
  bool updateShouldNotify(T previous, T next) {
    return filter(previous, next);
  }

  @override
  void dispose() {
    parentNotifier.removeListener(_parentListener);
    super.dispose();
  }
}

/// An extension on [ValueNotifier] that provides a `where` method to create a
/// [WhereValueNotifier] from the notifier.
extension SelectedValueNotifierX<T> on ValueNotifier<T> {
  /// Creates a [WhereValueNotifier] from the notifier.
  WhereValueNotifier<T> where(WhereFilter<T> updateShouldNotify) {
    return WhereValueNotifierFromParent(
      parentNotifier: this,
      updateShouldNotify: updateShouldNotify,
    );
  }
}
