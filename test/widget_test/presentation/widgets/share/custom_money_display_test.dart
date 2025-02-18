import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:state_management_exercise/presentation/widgets/widgets.dart';
int amount = 123456;
final testApp = MaterialApp(
  home: Builder(
    builder: (context) {
      return Scaffold(
        body: Center(child: CustomMoneyDisplay(amount: amount)),
      );
    },
  ),
);

void main() {
  group('Custom Money Display', () {
    testWidgets('should show formatted money', (WidgetTester tester) async {
      await tester.pumpWidget(testApp);
      await tester.pumpAndSettle();
      expect(find.text('\$123.456'), findsOneWidget);
    });
  });
}
