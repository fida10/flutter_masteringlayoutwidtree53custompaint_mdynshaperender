import 'package:flutter/material.dart';

const availableColors = <Color>[
  Colors.red,
  Colors.orange,
  Colors.yellow,
  Colors.green,
  Colors.purple,
  Colors.blue
];
const availableShapes = 3;
int colorToPick = 0;

CustomPainter returnColoredShape(int shapeIndex, int colorIndex) {
  switch (shapeIndex) {
    case 0:
      return CirclePainter(availableColors[colorIndex]);
    case 1: 
      return TrianglePainter(availableColors[colorIndex]);
    case 2: 
      return SquarePainter(availableColors[colorIndex]);
    default:
      return CirclePainter(availableColors[colorIndex]); //default
  }
}

class TrianglePainter extends CustomPainter {
  TrianglePainter(this.color);

  Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 3
      ..style =
          PaintingStyle.fill; //fill the drawn shape, rather than outlining it

    var path = Path();

// Move the path to the starting point of the triangle
    path.moveTo(size.width / 2, 0);

// Draw line to the second point of the triangle
    path.lineTo(size.width, size.height);

// Draw line to the third point of the triangle
    path.lineTo(0, size.height);

// Close the path to form a triangle
    path.close();

// Draw the path on the canvas
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class SquarePainter extends CustomPainter {
  SquarePainter(this.color);

  Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 3
      ..style = PaintingStyle.fill;

    var rect = Rect.fromLTWH(0, 0, size.width, size.height);

    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class CirclePainter extends CustomPainter {
  CirclePainter(this.color);

  Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 3
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
        Offset(size.width / 2, size.height / 2), size.width / 2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
