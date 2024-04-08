# Simpli

[![Powered by Mason](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge)](https://github.com/felangel/mason)
[![melos](https://img.shields.io/badge/maintained%20with-melos-f700ff.svg)](https://github.com/invertase/melos)
![coverage](./coverage.svg)


Line simplification algorithms, made simple! Sporting Ramer-Douglas-Peucker and Visvalingam

## Installation 💻

**❗ In order to start using Simpli you must have the [Dart SDK][dart_install_link] installed on your machine.**

Install via `dart pub add`:

```sh
dart pub add simpli
```


## Usage 🚀

```dart
import 'package:simpli/simpli.dart';

void main() {
  final points = [
    Point(0, 0),
    Point(1, 1),
    Point(2, 0),
    Point(3, 3),
    Point(4, 0),
  ];

  final rdpSimplified = Simpli.ramerDouglasPeucker(points, pixelTolerance: 50.0);
  final visvalingamSimplified = Simpli.visvalingam(points, pixelTolerance: 50.0);

  print(simplifiedPoints);
  print(visvalingamSimplified);
}
```

---


[dart_install_link]: https://dart.dev/get-dart
[github_actions_link]: https://docs.github.com/en/actions/learn-github-actions
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[mason_link]: https://github.com/felangel/mason
[very_good_ventures_link]: https://verygood.ventures
