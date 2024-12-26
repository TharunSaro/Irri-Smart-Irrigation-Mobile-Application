import 'package:flutter_test/flutter_test.dart';
import 'package:smart_irrigation/main.dart';

void main() {
  testWidgets('HomePage has a button with text "Time Based"', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the "Time Based" button is present in the widget tree.
    expect(find.text('Time Based'), findsOneWidget);
  });
}
