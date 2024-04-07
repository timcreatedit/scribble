# Value Notifier Tools

[![Powered by Mason](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge)](https://github.com/felangel/mason)
[![melos](https://img.shields.io/badge/maintained%20with-melos-f700ff.svg?style=flat-square)](https://github.com/invertase/melos)
![coverage](./coverage.svg)

Helpful lightweight tools for working with `ValueNotifier`s

## Installation 💻

**❗ In order to start using History Value Notifier you must have the [Dart SDK][dart_install_link] installed on your machine.**

Install via `dart pub add`:

```sh
dart pub add value_notifier_tools
```

## Features
This package adds helpful tools for working with `ValueNotifier`s. Currently, it offers the following:

* 🕐 [HistoryValueNotifier](#historyvaluenotifier) allows you to undo and redo changes to the state of the notifier. This is useful for implementing undo/redo functionality in your app.
* 🎯 [SelectValueNotifier](#selectvaluenotifier) allows you to select a subset of the state of a `ValueNotifier`. This is useful for when you only want to listen to a specific part of the state of and rebuild a widget when that changes.
* 🔎 [WhereValueNotifier](#wherevaluenotifier) allows you to provide a custom predicate to determine whether a state change should be propagated to listeners. This is useful for when only certain state transitions should cause a rebuild.
* 🪶 No dependencies on any other packages and super lightweight.
* 🧩 Easy to use and integrate into your existing projects.
* 🧪 100% test coverage


## HistoryValueNotifier

* ↩️ Add `undo()` and `redo()` to `ValueNotifier`
* 🕐 Limit the size of your history
* 💕 Offers both a mixin that can be added to your existing `ValueNotifier`s and a class that you can extend
* 🔎 Choose which states get stored to the history
* 🔄 Transform states before applying them from the history

### Usage
Getting started is easy! There are three main ways in which you can add `HistoryValueNotifier` to your project:

#### Use it as-is
If you don't need any extra functionality, you can use `HistoryValueNotifier` as-is.

```dart
import 'package:history_value_notifier/history_value_notifier.dart';

final notifier = HistoryValueNotifier<int>(0);
notifier.value = 1;
notifier.undo(); // 0
notifier.redo(); // 1
```

#### Upgrade an existing `ValueNotifier`

```dart
class CounterNotifier extends ValueNotifier<int>
    with HistoryValueNotifierMixin<int> {
  CounterNotifier() : super(0) {
    // This is how you limit the size of your history.
    // Set it to null to keep all state (default)
    maxHistoryLength = 30;
  }

  void increment() => ++state;

  void decrement() => --state;

  // By using temporaryState setter, the change won't be stored in history
  void reset() => temporaryState = 0;

  // You can override this function to apply a transformation to a state
  // from the history before it gets applied.
  @override
  int transformHistoryState(int newState, int currentState) {
    return newState;
  }
}
```

#### Create a `HistoryValueNotifier`

If you prefer to create a `HistoryValueNotifier` directly, you can do this instead:

```dart
class CounterNotifier extends HistoryValueNotifier<int> {
  // ... Same as above
}
```

#### Use It!

You can now use the full functionality of the `HistoryValueNotifier`!

```dart
// Obtain a reference however you wish (Provider, GetIt, etc.)
final CounterNotifier notifier = context.read(counterNotifier);

notifier.increment(); // 1
notifier.undo(); // 0
notifier.redo(); // 1

notifier.decrement(); // 0
notifier.undo(); // 1
notifier.canRedo // true
notifier.increment // 2
notifier.canRedo // false

// ...
```

## SelectValueNotifier

* 🎯 Select a subset of the state of a `ValueNotifier`
* 🧩 Only listen to the parts of the state that you care about
* 🏃 Micromanage rebuilds for maximum performance

### Usage

Using `SelectValueNotifier` is super easy:

#### Use the convenient `select` extension method
This allows you to select a subset of the state of a `ValueNotifier` by providing a selector function anywhere you need.

```dart
final notifier = ValueNotifier({'a': 1, 'b': 2});

return ValueListenableBuilder<int>(
  valueListenable: notifier.select((value) => value['a']),
  builder: (context, value, child) {
    return Text(value.toString());
  },
);
```
Your `selectNotifier` will now only notify listeners when the value of `'a'` changes.

## WhereValueNotifier

* 🔎 Provide a custom predicate to determine whether a state change should be propagated to listeners
* 🧩 Only listen to the state changes that you care about

### Usage
There are two main ways to use `WhereValueNotifier`:


#### Use the `where` extension method
This allows you to dynamically filter the state changes that you care about from another notifier.

```dart
final notifier = ValueNotifier(0);

return ValueListenableBuilder<int>(
  valueListenable: notifier.where((oldState, newState) => newState > oldState),
  builder: (context, value, child) {
    return Text(value.toString());
  },
);
```

Now, your widget will only rebuild when the new state is greater than the old state.

#### Extend it for your own custom classes
You can also extend it and provide your own `updateShouldNotify` function.

```dart
class IncreasingValueNotifier<int> extends WhereValueNotifier<int> {
  IncreasingValueNotifier(super.value);

  @override
  bool updateShouldNotify(T oldState, T newState) {
    return oldState < newState;
  }
}
```
