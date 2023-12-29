import 'package:flutter/material.dart';

// This is a constant list of Color objects, which represents ARGB colors.
// It includes six predefined colors: red, orange, yellow, green, purple, and blue.
const availableColors = <Color>[
  Colors.red,
  Colors.orange,
  Colors.yellow,
  Colors.green,
  Colors.purple,
  Colors.blue
];

// This is a constant integer that represents the number of available shapes.
const availableShapes = 3;

// This is an integer that represents the index of the color to pick from the availableColors list.
// It is initially set to 0, which corresponds to the first color in the list (red).
int colorToPick = 0;

// This is a function that returns a CustomPainter object based on the given shape and color indices.
// CustomPainter is an abstract class that, when implemented, can paint on a canvas in a custom way.
CustomPainter returnColoredShape(int shapeIndex, int colorIndex) {
  // This is a switch statement that chooses the shape to paint based on the shapeIndex.
  switch (shapeIndex) {
    // If shapeIndex is 0, a CirclePainter is returned with the color at the given colorIndex.
    case 0:
      return CirclePainter(availableColors[colorIndex]);
    // If shapeIndex is 1, a TrianglePainter is returned with the color at the given colorIndex.
    case 1:
      return TrianglePainter(availableColors[colorIndex]);
    // If shapeIndex is 2, a SquarePainter is returned with the color at the given colorIndex.
    case 2:
      return SquarePainter(availableColors[colorIndex]);
    // If shapeIndex is anything else, a CirclePainter is returned with the color at the given colorIndex as a default.
    default:
      return CirclePainter(availableColors[colorIndex]); //default
  }
}

// This is a class that extends CustomPainter, which is an abstract class that, when implemented, can paint on a canvas in a custom way.
// This class is used to paint a triangle.
class TrianglePainter extends CustomPainter {
  // This is a constructor for the TrianglePainter class.
  // It takes a Color object as a parameter, which is the color that the triangle will be painted.
  TrianglePainter(this.color);

  // This is a Color object that represents the color of the triangle.
  Color color;

  // This is a method that is called whenever the object needs to paint.
  // It takes two parameters: a Canvas object on which to paint, and a Size object that represents the size of the painting area.
  @override
  void paint(Canvas canvas, Size size) {
    // This is a Paint object, which holds the style and color information about how to paint.
    // The color is set to the color passed to the TrianglePainter constructor, the stroke width is set to 3, and the style is set to PaintingStyle.fill, which means the shape will be filled.
    final paint = Paint()
      ..color = color
      ..strokeWidth = 3
      ..style =
          PaintingStyle.fill; //fill the drawn shape, rather than outlining it

    // This is a Path object, which is a sequence of lines and curves that can be drawn on a Canvas.
    var path = Path();

    // This moves the path to the starting point of the triangle, which is the middle of the top edge of the painting area.
    path.moveTo(size.width / 2, 0);

    // This draws a line from the current point in the path to the second point of the triangle, which is the bottom right corner of the painting area.
    path.lineTo(size.width, size.height);

    // This draws a line from the current point in the path to the third point of the triangle, which is the bottom left corner of the painting area.
    path.lineTo(0, size.height);

    // This closes the path, which means it draws a line from the current point back to the starting point.
    path.close();

    // This draws the path on the canvas using the paint defined earlier.
    canvas.drawPath(path, paint);
  }

  // This is a method that is called when the custom painter is rebuilt.
  // It should return true if the new settings are different from the old ones and the painting should be redone.
  // Here, it always returns false, which means the painting is never redone.
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// This is a class that extends CustomPainter, which is an abstract class that, when implemented, can paint on a canvas in a custom way.
// This class is used to paint a square.
class SquarePainter extends CustomPainter {
  // This is a constructor for the SquarePainter class.
  // It takes a Color object as a parameter, which is the color that the square will be painted.
  SquarePainter(this.color);

  // This is a Color object that represents the color of the square.
  Color color;

  // This is a method that is called whenever the object needs to paint.
  // It takes two parameters: a Canvas object on which to paint, and a Size object that represents the size of the painting area.
  @override
  void paint(Canvas canvas, Size size) {
    // This is a Paint object, which holds the style and color information about how to paint.
    // The color is set to the color passed to the SquarePainter constructor, the stroke width is set to 3, and the style is set to PaintingStyle.fill, which means the shape will be filled.
    final paint = Paint()
      ..color = color
      ..strokeWidth = 3
      ..style = PaintingStyle.fill;

    // This is a Rect object, which represents a rectangle.
    // It is created from the left, top, width, and height values.
    // Here, it is a square that covers the entire painting area.
    var rect = Rect.fromLTWH(0, 0, size.width, size.height);

    // This draws the rectangle on the canvas using the paint defined earlier.
    canvas.drawRect(rect, paint);
  }

  // This is a method that is called when the custom painter is rebuilt.
  // It should return true if the new settings are different from the old ones and the painting should be redone.
  // Here, it always returns false, which means the painting is never redone.
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// This is a class that extends CustomPainter, which is an abstract class that, when implemented, can paint on a canvas in a custom way.
// This class is used to paint a circle.
class CirclePainter extends CustomPainter {
  // This is a constructor for the CirclePainter class.
  // It takes a Color object as a parameter, which is the color that the circle will be painted.
  CirclePainter(this.color);

  // This is a Color object that represents the color of the circle.
  Color color;

  // This is a method that is called whenever the object needs to paint.
  // It takes two parameters: a Canvas object on which to paint, and a Size object that represents the size of the painting area.
  @override
  void paint(Canvas canvas, Size size) {
    // This is a Paint object, which holds the style and color information about how to paint.
    // The color is set to the color passed to the CirclePainter constructor, the stroke width is set to 3, and the style is set to PaintingStyle.fill, which means the shape will be filled.
    final paint = Paint()
      ..color = color
      ..strokeWidth = 3
      ..style = PaintingStyle.fill;

    // This draws a circle on the canvas using the paint defined earlier.
    // The circle is centered at the middle of the painting area (size.width / 2, size.height / 2) and has a radius of half the width of the painting area (size.width / 2).
    canvas.drawCircle(
        Offset(size.width / 2, size.height / 2), size.width / 2, paint);
  }

  // This is a method that is called when the custom painter is rebuilt.
  // It should return true if the new settings are different from the old ones and the painting should be redone.
  // Here, it always returns false, which means the painting is never redone.
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
