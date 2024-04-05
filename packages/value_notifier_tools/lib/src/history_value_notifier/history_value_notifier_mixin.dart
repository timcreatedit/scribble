import 'package:flutter/foundation.dart';
import 'package:value_notifier_tools/src/history_value_notifier/history_value_notifier.dart';

/// Use this mixin on any [ValueNotifier] to add a history functionality to it.
///
/// {@macro history_value_notifier}
mixin HistoryValueNotifierMixin<T> on ValueNotifier<T> {
  int? _maxHistoryLength;

  /// How many values to keep track of.
  ///
  /// If null, all values will be stored.
  int? get maxHistoryLength => _maxHistoryLength;
  set maxHistoryLength(int? value) {
    assert(
      value == null || value >= 0,
      "The maxHistoryLength can't be negative!",
    );
    _maxHistoryLength = value;
    if (value == null) return;
    if (_undoHistory.length > value) {
      _undoHistory = _undoHistory.sublist(0, value);
      _undoIndex = _undoIndex >= value ? value - 1 : _undoIndex;
    }
  }

  bool get _keepAny => _maxHistoryLength == null || _maxHistoryLength! > 0;

  late List<T> _undoHistory = [
    if (includeInitialValueInHistory && _keepAny) value,
  ];

  int _undoIndex = 0;

  /// Sets the value of this [HistoryValueNotifier], notifies listeners,
  /// and adds the new value to the undo history.
  @override
  set value(T value) {
    _internalClearRedoQueue();
    if (_undoHistory.isEmpty ||
        shouldInsertValueIntoQueue(value, _undoHistory[0])) {
      _undoHistory.insert(0, value);
      if (_maxHistoryLength != null &&
          _undoHistory.length > _maxHistoryLength!) {
        _undoHistory = _undoHistory.sublist(0, _maxHistoryLength);
      }
    }

    super.value = value;
  }

  /// Sets the current "value" of this [HistoryValueNotifier] **without** adding
  /// the new value to the undo history.
  ///
  /// This is helpful for loading values or in general any other value that the
  /// user should not be able to undo to.
  @protected
  set temporaryValue(T value) {
    super.value = value;
  }

  /// Whether currently an undo operation is possible.
  bool get canUndo => _undoIndex + 1 < _undoHistory.length;

  /// Whether a redo operation is currently possible.
  bool get canRedo => _undoIndex > 0;

  /// You can override this to prevent undo/redo operations in certain cases
  /// (e.g. when in a loading value)
  @protected
  bool get allowOperations => true;

  /// Whether to include the initial [value] in the undo history.
  ///
  /// `true` by default, override and set to false if the initial value should
  /// be treated like [temporaryValue].
  @protected
  bool get includeInitialValueInHistory => true;

  /// You can override this function if you want to transform values from the
  /// history before they get applied.
  ///
  /// This can be useful if your value contains values that aren't supposed
  /// to be changed upon undoing for example.
  @protected
  T transformHistoryValue(T newValue, T currentValue) {
    return newValue;
  }

  /// You can override this function if you want to filter certain values before
  /// adding them to the history.
  ///
  /// By default, this uses value equality, but you could for example always
  /// return true in case your value doesn't support value equality.
  /// [newValue] holds the value that's supposed to be added, [lastInQueue] is
  /// the value that's currently last in the undo queue.
  @protected
  bool shouldInsertValueIntoQueue(T newValue, T lastInQueue) {
    return newValue != lastInQueue;
  }

  /// Returns to the previous value in the history.
  void undo() {
    if (canUndo && allowOperations) {
      temporaryValue = transformHistoryValue(_undoHistory[++_undoIndex], value);
    }
  }

  /// Proceeds to the next value in the history.
  void redo() {
    if (canRedo && allowOperations) {
      temporaryValue = transformHistoryValue(_undoHistory[--_undoIndex], value);
    }
  }

  /// Removes all history items from the queue.
  void clearQueue() {
    _undoHistory = [];
    _undoIndex = 0;
    temporaryValue = value;
  }

  /// Removes all history items that happened after the current undo position.
  ///
  /// Internally this is used whenever a change occurs, but you might want to
  /// use it for something else.
  void clearRedoQueue() {
    _internalClearRedoQueue();
    temporaryValue = value;
  }

  void _internalClearRedoQueue() {
    if (canRedo) {
      _undoHistory = _undoHistory.sublist(_undoIndex, _undoHistory.length);
      _undoIndex = 0;
    }
  }
}
