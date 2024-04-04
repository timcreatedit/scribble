# Scribble

[![Powered by Mason](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge)](https://github.com/felangel/mason)
[![melos](https://img.shields.io/badge/maintained%20with-melos-f700ff.svg?style=flat-square)](https://github.com/invertase/melos)


Scribble is a lightweight library for freehand drawing in Flutter supporting pressure, variable line width and more!

## Installation 💻

**❗ In order to start using Scribble you must have the [Dart SDK][dart_install_link] installed on your machine.**

Install via `dart pub add`:

```sh
dart pub add scribble
```

---

## Features

* Variable line width
* Image Export
* Pen and touch pressure support
* Choose which pointers can draw (touch, pen, mouse, etc.)
* Lines get slimmer when the pen is moved more quickly
* Line eraser support
* Full undo/redo support using [history_value_notifier](https://pub.dev/packages/history_value_notifier)
* Sketches are fully serializable to JSON

## Pipeline

* [X] Load sketches
* [X] PNG export

## Usage

> You can find a full working example in the [example](./example) directory

You can create a drawing surface by adding the ``Scribble`` widget to your widget tree and passing in
a ``ScribbleNotifier``.

```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scribble(
        notifier: notifier,
      ),
    );
  }
}
```

Use the public methods on ``ScribbleNotifier`` to control the behavior (for example from a button in the UI:

```dart
// Set color
notifier.setColor(Colors.black);

// Clear
notifier.clear();

// Undo
notifier.undo();

// Export to Image
notifier.renderImage(pixelRatio: 2.0);

// And more ... 
```

## Additional information

As mentioned above, the package is still under development, but we already use it in the app we are currently
developing.

Feel free to contribute, or open issues in our [GitHub repo](https://github.com/timcreatedit/scribble).


[dart_install_link]: https://dart.dev/get-dart
[github_actions_link]: https://docs.github.com/en/actions/learn-github-actions
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[mason_link]: https://github.com/felangel/mason
[very_good_ventures_link]: https://verygood.ventures
