# ASSIGNMENT 7
Flutter Basic Elements

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

# ASSIGNMENT 8
Flutter Form

## `Navigator.push`  vs `Navigator.pushReplacement`
`Navigator.push` pushes a new page to the stack without removing the previous page from the stack, while `Navigator.pushReplacement` pushes a new page to the stack whilst removing the previous page out of the stack.

## Widgets Used
1. Scaffold<br>
Implements the basic Material Design visual layout structure.<br>
2. AppBar<br>
A Material Design app bar. An app bar consists of a toolbar and potentially other widgets.<br>
3. Drawer<br>
A Material Design panel that slides in horizontally from the edge of a Scaffold to show navigation links in an application.<br>
4. Center<br>
A widget that centers its child within itself.<br>
5. Column<br>
Layout a list of child widgets in the vertical direction.<br>
6. Row<br>
Layout a list of child widgets in the horizontal direction.<br>
7. Text<br>
A run of text with a single style.<br>
8. RichText<br>
The RichText widget displays text that uses multiple different styles. The text to display is described using a tree of TextSpan objects, each of which has an associated style that is used for that subtree. The text might break across multiple lines or might all be displayed on the same line depending on the layout constraints.<br>
9. Container<br>
A convenience widget that combines common painting, positioning, and sizing widgets.<br>
10. Padding<br>
A widget that insets its child by the given padding.<br>
11. TextField<br>
A text field lets the user enter text, either with hardware keyboard or with an onscreen keyboard.<br>
12. DateTime<br>
Display a datepicker<br>
13. TextButton<br>
A Material Design text button. A simple flat button without a border outline<br>
14. ListView<br>
A scrollable, linear list of widgets<br>
15. Dialog<br>
Creates a dialog.<br>
16. SizedBox<br>
A box with a specified size. If given a child, this widget forces its child to have a specific width and/or height<br>

## Flutter events
1. `onPressed`
2. `onChanged`
3. `onSaved`
4. `onTap`

## How Navigator works
Navigator works by using stack. Stack have two operation, namely push and pop. When you open a new page, the Navigator will push the new page to the stack, and when, for example, you click the back button, then it will pop the stack, returning you to the page before.

## Implementation
### Add drawer
Create `drawer.dart` and code a drawer widget code there.

### Add Three Navigation Buttons on the Drawer
Using the Column widget, create 3 ListTile Widget which will navigate to the corresponding pages when pressed.

### Add a Form Page
Create a new file, `form.dart`. Used the TextFormField for both Title and Amount input, a Dropdown widget for the type input, and a TextFormField with Datepicker for the date input. User input are then saved to `model.dart`.

### Add a page of Budget Data
Create a new file, `data.dart`. Used Card and ListTile widget to show the datas from `model.dart`.
