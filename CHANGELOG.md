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
