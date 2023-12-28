import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:masteringlayoutwidtree53custompaint_mdynshaperender/main.dart';

void main() {
  testWidgets('Dynamic Shape Renderer Test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Verify CustomPaint widget is present
    expect(
        find.byWidgetPredicate((Widget widget) =>
            widget is SizedBox && widget.child is CustomPaint),
        findsOneWidget);

    // Test shape switching functionality
    await tester.tap(find.text('Change Shape!'));
    await tester.pump();
    // Add verification for shape change

    // Test color switching functionality
    await tester.tap(find.text('Change Color!'));
    await tester.pump();
    // Add verification for color change

    // Before size adjustment
    final sizedBoxBefore = tester.widget<SizedBox>(find.byWidgetPredicate(
        (Widget widget) => widget is SizedBox && widget.child is CustomPaint));
    final double? widthBefore = sizedBoxBefore.width;
    final double? heightBefore = sizedBoxBefore.height;

    // Test size adjustment functionality
    await tester.drag(find.byType(Slider), Offset(50, 0));
    await tester.pump();

    // After size adjustment
    final sizedBoxAfter = tester.widget<SizedBox>(find.byWidgetPredicate(
        (Widget widget) => widget is SizedBox && widget.child is CustomPaint));
    final double? widthAfter = sizedBoxAfter.width;
    final double? heightAfter = sizedBoxAfter.height;

    // Verify that the size has changed
    expect(widthAfter, isNot(equals(widthBefore)));
    expect(heightAfter, isNot(equals(heightBefore)));
  });
}
