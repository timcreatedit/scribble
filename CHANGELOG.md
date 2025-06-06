## 0.10.1

 - **REFACTOR**: changed `SketchSimplifier` methods to better match data structure.
 - **FIX**: eraser doesn't affect undo history if it didn't actually erase anything (#80).
 - **FIX**: disable setting pressure to default value on web (#72).
 - **FIX**: remove emoji from pubspec.
 - **FIX**: updated meta dependency constraints.
 - **FEAT**(example): added pressure simulation toggle.
 - **FEAT**: added parameter for pressure simulation to widgets.
 - **FEAT**(example): made UI a little bit prettier.
 - **FEAT**: simplify sketches in `setSketch` if the `simplificationTolerance` is not 0.
 - **FEAT**: simplify sketch on load if simplificationTolerance is not 0.
 - **FEAT**: added ability to simplify entire sketches.
 - **FEAT**: implemented simplification.
 - **FEAT**: added simpli package (#50).
 - **DOCS**: simplification comment mentions how pressure simulation is affected.
 - **DOCS**: fix readme.
 - **DOCS**: updated recommended starting point.

## 0.10.0+1

 - **DOCS**: fixed demo image.

## 0.10.0

> Note: This release has breaking changes.

 - **REFACTOR**: cleaned up project structure.
 - **REFACTOR**: added CI and documentation.
 - **FIX**(value_notifier_tools): fixed type parameters in select extension.
 - **FIX**(value_notifier_tools): Added all classes to package exports.
 - **FIX**: fixed point.freezed.dart.
 - **FIX**(example): fixed dialog title.
 - **FEAT**(example): updated example to use `SelectValueNotifier`.
 - **FEAT**: use `HistoryValueNotifier` from new package.
 - **FEAT**(value_notifier_tools): added `HistoryValueNotifier`.
 - **FEAT**(value_notifier_tools): added where_value_notifier.
 - **FEAT**(value_notifier_tools): added select value notifier.
 - **FEAT**(example): show JSON.
 - **FEAT**(example): updated example visuals.
 - **FEAT**(example): updated example for new `ScribbleNotifier`.
 - **DOCS**: added back demo gif.
 - **DOCS**: updated README.
 - **DOCS**(value_notifier_tools): added README.
 - **DOCS**: documented all public members.
 - **BREAKING** **REFACTOR**: made `GestureCatcherRecognizer` private.
 - **BREAKING** **REFACTOR**: `ScribbleNotifier` is now a `ValueNotifier`.

## 0.9.1
- removed erroneous `simulatePressure`
## 0.9.0
- Use `perfect_freehand` for much smoother lines (thanks to @mattrussell-sonocent)
- BREAKING: Removed line customization parameters from widgets

## 0.4.0
- Upgraded dependencies (thanks to @wxxedu)
- ``ScribbleNotifier.clear()`` clears the drawing without resetting anything else (color, width e.t.c)

## 0.3.0
- Upgraded dependencies
- Added ``ScribbleSketch`` widget for just displaying a sketch without input functionality, no notifier needed!
## 0.2.2
- Upgraded dependencies

## 0.2.1
- Updated README to include the newest features
- Downgraded json_serializable due to a bug with freezed

## 0.2.0
#### BREAKING:
- Custom ScribbleNotifiers now need to provide a GlobalKey which is used in the renderImage() method to access Scribble's
  RepaintBoundary
- Updated example to demonstrate image export.

#### Image Export:
- You can now export the Scribble to an Image ```ByteData``` using the ScribbleNotifiers ``renderImage()`` method!

#### Other Changes:
- The pressure on web is overridden so the cursor matches the selected pen width!
- ``ScribbleNotifier`` now extends ``ScribbleNotifierBase`` instead of implementing it as an interface.
- Updated dependencies

## 0.1.3
#### Filter for Pointers:
You can now switch between different ``ScribblePointerMode``s, even at runtime.

This is very helpful for example, if Scribble lives inside a Scrollable and you want users to be able to navigate with their finger while drawing with their pen.

Check the updated example to try it out!

#### Other Changes:
* ``ScribbleNotifier`` now has the option to set the sketch from outside after it has been constructed using the ``setSketch()`` method. You can even choose whether you want it to be committed to the undo history.
* Added documentation to ``ScribbleState``
* Updated example
* Updated dependencies

## 0.1.2

* Removed the speed calculation using time due to precision issues

## 0.1.1
* Added scaleFactor to support zoomable canvases. This allows you to for example wrap the Scribble Widget in an
InteractiveViewer, so that users can draw finer details.

## 0.1.0

* Points now remember their time to calculate speed more accurately
* Multiple fixes for drawing with real pens or touch
* ``ScribbleState`` can now be serialized to JSON

### Breaking:

* speedFactor's value should now be higher for the same effect, the default value has changed to 0.4
* ``color`` property in state is now an int to allow for easy JSON
## 0.0.13

* Draw better line ends
* Removed marker-like blend mode for now due to performance and buggy rendering in some cases

## 0.0.12

* Eraser keeps pen width and the other way around

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