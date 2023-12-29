/*
Practice Question 1: Dynamic Shape Renderer with CustomPaint

Task Description:
Create a Flutter application that features a dynamic shape renderer using CustomPaint. The application should allow users to switch between different shapes (e.g., circle, square, triangle) and dynamically adjust their size using a slider. Implement a custom painter for each shape.
 */

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:masteringlayoutwidtree53custompaint_mdynshaperender/dynamic_shape.dart';

// This is the main function where the execution of the Flutter app starts.
void main() {
  // runApp is a built-in Flutter function that inflates the given widget and attaches it to the screen.
  // MyApp is the root widget of your application.
  runApp(const MyApp());
}

// MyApp is a StatelessWidget, which describes part of the user interface which can't change over time.
class MyApp extends StatelessWidget {
  // The constructor for this class. 'super.key' is used to pass the key to the parent class.
  const MyApp({super.key});

  // This is where the widget's UI is built. Every StatelessWidget must override this method.
  @override
  Widget build(BuildContext context) {
    // MaterialApp is a pre-defined class in Flutter which provides many features like navigation, themes, etc.
    // It's usually the root widget of the application that uses Material Design.
    return const MaterialApp(
      // 'home' is a property that defines the main UI for the MaterialApp.
      // HomePage is another widget that will be displayed as the main page.
      home: HomePage(),
    );
  }
}

// HomePage is a StatefulWidget, which can change over time (mutable).
// It can be used to change the data inside after the widget is built.
class HomePage extends StatefulWidget {
  // The constructor for this class. 'super.key' is used to pass the key to the parent class.
  const HomePage({super.key});

  // This method creates the mutable state for this widget at a given location in the tree.
  @override
  State<HomePage> createState() => _HomePageState();
}

// _HomePageState is the logic and internal state for a StatefulWidget.
class _HomePageState extends State<HomePage> {
  // These are the variables that hold the state for this widget.
  // _currentSliderValue holds the current value of the slider.
  double _currentSliderValue = 0;
  // baseSliderValue is the initial value for the slider. Used as a base on which 2 to the power of the slider will be multiplied
  //this baseSliderValue will not change; it is a constant used to calculate the shapeDimensions
  double baseSliderValue = 18;
  // shapeDimensions is the size of the shape.
  double shapeDimensions = 18;

  // shapeToPick and colorToPick are used to determine the current shape and color.
  int shapeToPick = 0;
  int colorToPick = 0;

  // This is where the widget's UI is built. Every StatefulWidget must override this method.
  @override
  Widget build(BuildContext context) {
    // Scaffold is a widget from Material library that provides a default app bar,
    // title, and a body property that holds the main widget tree.
    return Scaffold(
      // SafeArea is a widget that insets its child by sufficient padding to avoid intrusions by the operating system.
      body: SafeArea(
        // Column is a widget that displays its children in a vertical array.
        child: Column(
          // mainAxisAlignment determines how the children are aligned along the main axis.
          mainAxisAlignment: MainAxisAlignment.start,
          // children is a list of widgets that this widget will display.
          children: [
            // titleText() is a method that returns a widget to display the title text.
            titleText(),
            // tileAndShapePadder() is a method that returns a widget to display the tile and shape.
            tileAndShapePadder(),
            // Spacer creates an adjustable, empty spacer that can be used to tune the spacing between widgets.
            // Without any parameters, Spacer will push all widgets below it as far to the bottom of the screen as it can
            // It will take up as much space as it can; it is greedy
            const Spacer(),
            // sizeSlider() is a method that returns a widget to display the size slider.
            sizeSlider(),
            // Row is a widget that displays its children in a horizontal array.
            Row(
              // mainAxisAlignment determines how the children are aligned along the main axis.
              mainAxisAlignment: MainAxisAlignment.center,
              // children is a list of widgets that this widget will display.
              // generating 2 widgets here, a shape button and a color button
              children: [changeShapeButton(), changeColorButton()],
            ),
          ],
        ),
      ),
    );
  }

  // This method returns a Padding widget, which is a widget that insets its child by the given padding.
  Padding tileAndShapePadder() {
    // Padding takes two main arguments: padding and child.
    // EdgeInsets.all(20) applies a uniform padding of 20 logical pixels on all sides (left, top, right, bottom).
    // shapeSize() is a method that returns a SizedBox widget, which is used as the child of this Padding widget.
    return Padding(
      padding: const EdgeInsets.all(20),
      child: shapeSize(),
    );
  }

  // This method returns a Text widget, which displays a string of text with single style.
  Text titleText() {
    // The Text widget takes a string as a parameter, which is the text to display.
    // The style parameter is optional and is used to specify the style of the text like fontSize, fontWeight, color, etc.
    return const Text(
      'Change shape and size of shape!',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }

  // This method returns a SizedBox widget, which is a box with a specified size.
  // It can be used to specify the size of a widget.
  SizedBox shapeSize() {
    // The SizedBox takes width and height as parameters, which are the dimensions of the box.
    // The child of the SizedBox is a CustomPaint widget, which provides a canvas on which to draw during the paint phase.
    return SizedBox(
      width: shapeDimensions,
      height: shapeDimensions,
      child: CustomPaint(
        // The painter is a delegate that paints within a rectangle upon request.
        // Here, returnColoredShape(shapeToPick, colorToPick) is a method that returns a custom painter.
        painter: (returnColoredShape(shapeToPick, colorToPick)),
      ),
    );
  }

  Slider sizeSlider() {
    return Slider(
      value: _currentSliderValue,
      min: 0,
      max: 4,
      divisions: 4,
      label: shapeDimensions.toString(),
      onChanged: (double value) {
        setState(() {
          _currentSliderValue = value;
          shapeDimensions = (baseSliderValue * pow(2, _currentSliderValue));
        });
      },
    );
  }

  // This method returns a Padding widget, which is a widget that insets its child by the given padding.
  Padding changeColorButton() {
    // Padding takes two main arguments: padding and child.
    // EdgeInsets.all(8.0) applies a uniform padding of 8 logical pixels on all sides (left, top, right, bottom).
    // The child of this Padding widget is an ElevatedButton, which is a Material Design raised button.
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          // onPressed is the callback that is called when the button is tapped or otherwise activated.
          // If this is null, then the button will be disabled.
          onPressed: () {
            // setState is a method that tells the Flutter framework that the internal state of this object has changed.
            // This will trigger a call to the build method, and as a result, the user interface will be updated to reflect the new state.
            setState(() {
              // This is a conditional statement that checks if colorToPick is greater than the length of availableColors array minus 2.
              // If it is, then colorToPick is set to 0. Otherwise, colorToPick is incremented by 1.
              if (colorToPick > availableColors.length - 2) {
                colorToPick = 0;
                //this is here to reset the colorToPick counter back to zero once it exceeds the available colors 
              } else {
                colorToPick++;
              }
            });
          },
          // child is the primary content of the button.
          // Here, it is a Text widget that displays the string 'Change Color!'.
          child: const Text('Change Color!')),
    );
  }

  // This method returns a Padding widget, which is a widget that insets its child by the given padding.
  Padding changeShapeButton() {
    // Padding takes two main arguments: padding and child.
    // EdgeInsets.all(8.0) applies a uniform padding of 8 logical pixels on all sides (left, top, right, bottom).
    // The child of this Padding widget is an ElevatedButton, which is a Material Design raised button.
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        // onPressed is the callback that is called when the button is tapped or otherwise activated.
        // If this is null, then the button will be disabled.
        onPressed: () {
          // setState is a method that tells the Flutter framework that the internal state of this object has changed.
          // This will trigger a call to the build method, and as a result, the user interface will be updated to reflect the new state.
          setState(() {
            // This is a conditional statement that checks if shapeToPick is greater than the length of availableShapes array minus 2.
            // If it is, then shapeToPick is set to 0. Otherwise, shapeToPick is incremented by 1.
            if (shapeToPick > availableShapes - 2) {
              shapeToPick = 0;
              // does the same thing as the colorToPick counter in the previous widget, but for the available shapes
              
            } else {
              shapeToPick++;
            }
          });
        },
        // child is the primary content of the button.
        // Here, it is a Text widget that displays the string 'Change Shape!'.
        child: const Text('Change Shape!'),
      ),
    );
  }
}

/*
The reason that changeColorButton and changeShapeButton are not refactored into a single widget with dynamic values is because each button is linked to a different constant (availableShapes and availableColors)

Regretably it was not possible to pass this constant as a parameter
 */