## 0.0.11

* Eraser doesn't autoselect anymore
* Undo doesn't undo color and stroke selection

## 0.0.10

* Fixed stupid bug with pointer exit

## 0.0.9

* Better behavior on pointer exit

## 0.0.8

* Reduced Dependencies
* Replaced kimchi package with the better suited [history_state_notifier](https://pub.dev/packages/history_state_notifier)
* Fixed a bug with redo queue clearing

## 0.0.7

* **BREAKING:** The ``drawPointer`` parameter is now called ``drawPen``
* You can now obtain the current sketch from the notifier.
  If you want to store it somewhere for example you can call ```toJson()``` on it.
* You can now pass a sketch to a ``ScribbleNotifier`` constructor to initialize it with an existing
  drawing.
* Added ``ScribbleNotifierBase`` interface so you can write your own notifier that works with the ``Scribble``widget
* Added pressure curve support to the notifier
* Allows more customization in the scribble widget for how the lines are rendered


## 0.0.6

* Upped minimum flutter version to 2.5

## 0.0.5

* Back to flutter 2.2.3

## 0.0.4

* Upped minimum flutter version to 2.3

## 0.0.3

* meta dependency to hopefully work with analysis

## 0.0.2

* Added documentation
* Fixed dependencies

## 0.0.1

* Initial release
