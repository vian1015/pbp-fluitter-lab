# counter_7

A new Flutter project.

## Statelss Widget vs Stateful Widget
A stateful widget is a widget that can change when a user interacts with it. While a stateless widget is a widget that never changes.

## Widgets Used
The widgets used in this projet are:
### Padding
To create a padding for a widget.
### Row
To define the row layout of a widget.
### Visibility
To show or hide a child of a widget.
## Stack
To stack widget.

## setState()
setState tells the Flutter framework that something has changed in this State, which causes it to rerun the build method below it, so that the display can reflect the updated values.

## Const vs Final
`const`'s value must be known on compile-time, while `final`'s value must be known on run-time.

## Explanation
Creating a new flutter program can be done with `flutter create counter_7`. Then I create the minus and plus button with the Stack widget, that stacks the Padding widget, Row widget and the Visibility widget. 
After that, I create the `_decrementCounter()` function to decrement `_counter` when the user clicks on the minus button. 