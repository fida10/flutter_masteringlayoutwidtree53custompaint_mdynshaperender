/*
Practice Question 1: Dynamic Shape Renderer with CustomPaint

Task Description:
Create a Flutter application that features a dynamic shape renderer using CustomPaint. The application should allow users to switch between different shapes (e.g., circle, square, triangle) and dynamically adjust their size using a slider. Implement a custom painter for each shape.
 */

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:masteringlayoutwidtree53custompaint_mdynshaperender/dynamic_shape.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _currentSliderValue = 0;
  double baseSliderValue = 18;
  double shapeDimensions = 18;

  int shapeToPick = 0;
  int colorToPick = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          titleText(),
          Padding(
            padding: const EdgeInsets.all(20),
            child: shapeSize(),
          ),
          const Spacer(),
          sizeSlider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [changeShapeButton(), changeColorButton()],
          ),
        ],
      )),
    );
  }

  Text titleText() {
    return const Text(
      'Change shape and size of shape!',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }

  SizedBox shapeSize() {
    return SizedBox(
            width: shapeDimensions,
            height: shapeDimensions,
            child: CustomPaint(
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
              shapeDimensions =
                  (baseSliderValue * pow(2, _currentSliderValue));
            });
          },
        );
  }

  Padding changeColorButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          onPressed: () {
            setState(() {
              if (colorToPick > availableColors.length - 2) {
                colorToPick = 0;
              } else {
                colorToPick++;
              }
            });
          },
          child: const Text('Change Color!')),
    );
  }

  Padding changeShapeButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            if (shapeToPick > availableShapes - 2) {
              shapeToPick = 0;
            } else {
              shapeToPick++;
            }
          });
        },
        child: const Text('Change Shape!'),
      ),
    );
  }
}
