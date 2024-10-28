import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gestures/main.dart';

void main() {
  testWidgets('Gesture Detector button test', (WidgetTester tester) async {
    // Build the ElevatedBtn widget and trigger a frame.
    await tester.pumpWidget(MaterialApp(home: ElevatedBtn()));

    // Check if the "Gesture Detector Button" text is present in the widget tree.
    expect(find.text('Gesture Detector Button'), findsOneWidget);

    // Tap on the Gesture Detector Button and ensure the Snackbar is shown.
    await tester.tap(find.text('Gesture Detector Button'));
    await tester.pump(); // Rebuild the widget to display the Snackbar.

    // Verify the Snackbar message appears.
    expect(find.text('Gesture Detector Button Pressed'), findsOneWidget);
  });
}
