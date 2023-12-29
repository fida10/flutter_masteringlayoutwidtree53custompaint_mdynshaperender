import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:masteringlayoutwidtree53custompaint_mdynshaperender/main.dart';

// This is the main function where the execution of the program starts.
void main() {
  // This is a function that runs widget tests.
  // It takes two parameters: a description of the test and a callback function that performs the test.
  testWidgets('Dynamic Shape Renderer Test', (WidgetTester tester) async {
    // This line pumps the MyApp widget into the widget tree, making it the root widget.
    await tester.pumpWidget(const MyApp());

    // This line verifies that there is a CustomPaint widget present in the widget tree.
    // It uses a widget predicate to find a SizedBox widget that has a CustomPaint widget as a child.
    // It then checks that exactly one such widget is found.
    expect(
        find.byWidgetPredicate((Widget widget) =>
            widget is SizedBox && widget.child is CustomPaint),
        findsOneWidget);

    // This line simulates a tap on the 'Change Shape!' button.
    await tester.tap(find.text('Change Shape!'));
    // This line triggers a frame after the tap.
    await tester.pump();
    // Add verification for shape change

    // This line simulates a tap on the 'Change Color!' button.
    await tester.tap(find.text('Change Color!'));
    // This line triggers a frame after the tap.
    await tester.pump();
    // Add verification for color change

    // This line gets the SizedBox widget before the size adjustment.
    // It uses a widget predicate to find a SizedBox widget that has a CustomPaint widget as a child.
    // need to be specific about what we are looking for since some built in widgets (like Scaffold) also use CustomPaint, and we don't want to accidently use that eh
    final sizedBoxBefore = tester.widget<SizedBox>(find.byWidgetPredicate(
        (Widget widget) => widget is SizedBox && widget.child is CustomPaint));
    // These lines get the width and height of the SizedBox widget before the size adjustment.
    final double? widthBefore = sizedBoxBefore.width;
    final double? heightBefore = sizedBoxBefore.height;

    // This line simulates a drag on the Slider widget.
    await tester.drag(find.byType(Slider), Offset(50, 0));
    // This line triggers a frame after the drag.
    await tester.pump();

    // This line gets the SizedBox widget after the size adjustment.
    // It uses a widget predicate to find a SizedBox widget that has a CustomPaint widget as a child.
    final sizedBoxAfter = tester.widget<SizedBox>(find.byWidgetPredicate(
        (Widget widget) => widget is SizedBox && widget.child is CustomPaint));
    // These lines get the width and height of the SizedBox widget after the size adjustment.
    final double? widthAfter = sizedBoxAfter.width;
    final double? heightAfter = sizedBoxAfter.height;

    // These lines verify that the width and height of the SizedBox widget have changed after the size adjustment.
    expect(widthAfter, isNot(equals(widthBefore)));
    expect(heightAfter, isNot(equals(heightBefore)));
  });
}
