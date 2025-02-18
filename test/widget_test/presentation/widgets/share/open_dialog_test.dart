import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:state_management_exercise/presentation/widgets/share/open_dialog.dart';
import 'package:state_management_exercise/domain/entities/pills.dart';

final pillItem = PillItems(
  id: '1',
  name: 'Test',
  description: 'Test Description',
  image: 'https://example.com/image.png',
  price: 10,
);

final testApp = MaterialApp(
  home: Builder(builder: (context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => openDialog(context, pillItem),
          child: const Text('Open Dialog'),
        ),
      ),
    );
  }),
);

void main() {
  group('Open Dialog', () {
    testWidgets('should show dialog with title and content',
        (WidgetTester tester) async {
          await tester.pumpWidget(testApp);
          await tester.tap(find.text('Open Dialog'));
          await tester.pumpAndSettle();
          expect(find.text('Test'), findsOneWidget);
          expect(find.text('Test Description'), findsOneWidget);
    });
  });
}
