import 'package:flutter/foundation.dart';
import 'package:value_notifier_tools/src/history_value_notifier/history_value_notifier_mixin.dart';

/// {@template history_value_notifier}
/// Works like a [ValueNotifier] with the added benefit of maintaining an
/// internal undo history that can be navigated through.
///
/// All states that get set using the [value] setter will automatically be
/// remembered for up to [maxHistoryLength] entries. If you want to update
/// the state without adding it to the history, use the [temporaryValue] setter
/// instead.
/// > Note: The initial undo history will start with the initial [value].
/// {@endtemplate}
class HistoryValueNotifier<T> extends ValueNotifier<T>
    with HistoryValueNotifierMixin<T> {
  /// {@macro history_value_notifier}
  HistoryValueNotifier(super._value);
}
