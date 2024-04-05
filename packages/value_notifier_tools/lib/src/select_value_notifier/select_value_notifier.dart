import 'package:flutter/foundation.dart';

/// A function that maps a value of type [FromT] to a value of type [ToT].
typedef Selector<FromT, ToT> = ToT Function(FromT value);

/// {@template selected_value_notifier}
/// A [ValueNotifier] that wraps another [ValueNotifier] and selects updates
/// based on a provided function.
///
/// Updates will only be sent to listeners when the new value is different from
/// the previous value.
/// {@endtemplate}
class SelectValueNotifier<FromT, ToT> extends ValueNotifier<ToT> {
  /// {@macro selected_value_notifier}
  SelectValueNotifier({
    required this.parentNotifier,
    required this.selector,
  }) : super(selector(parentNotifier.value)) {
    parentNotifier.addListener(_updateFromParent);
  }

  /// The [ValueNotifier] that this [SelectValueNotifier] listens to and
  /// filters updates from.
  final ValueNotifier<FromT> parentNotifier;

  /// A function that maps the value of the parent notifier to the value of this
  /// notifier.
  final Selector<FromT, ToT> selector;

  @override
  @protected
  set value(ToT newValue) {
    throw UnsupportedError('Cannot set value on SelectValueNotifier');
  }

  void _updateFromParent() {
    super.value = selector(parentNotifier.value);
  }

  @override
  void dispose() {
    parentNotifier.removeListener(_updateFromParent);
    super.dispose();
  }
}

/// An extension on [ValueNotifier] that provides a `select` method to create a
/// [SelectValueNotifier] from the notifier.
extension SelectValueNotifierX<FromT> on ValueNotifier<FromT> {
  /// Selects updates from this notifier using the provided [selector]
  /// function.
  ///
  /// The [selector] function is called whenever the parent notifier updates and
  /// the result is used as the new value for the [SelectValueNotifier].
  SelectValueNotifier<FromT, ToT> select<ToT>(
    ToT Function(FromT value) selector,
  ) {
    return SelectValueNotifier(
      parentNotifier: this,
      selector: selector,
    );
  }
}
