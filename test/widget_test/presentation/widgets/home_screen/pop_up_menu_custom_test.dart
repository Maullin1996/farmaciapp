import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:state_management_exercise/presentation/widgets/home_screen/pop_up_menu_custom.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  final mockUser = MockUser(
    isAnonymous: false,
    uid: 'someuid',
    email: 'test@example.com',
  );

  Widget createWidgetUnderTest({User? user}) {
    final auth = MockFirebaseAuth(mockUser: mockUser);
    return MaterialApp(
      home: Scaffold(
        body: StreamBuilder<User?>(
          stream: auth.authStateChanges(),
          builder: (context, snapshot) {
            return PopUpMenuCustom();
          },
        ),
      ),
    );
  }

  testWidgets('displays sign-in and sign-up options when user is not signed in', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest());

    expect(find.text('Sign In'), findsNothing);
    expect(find.text('Sign Up'), findsNothing);

    await tester.tap(find.byIcon(Icons.more_vert_rounded));
    await tester.pumpAndSettle();

    expect(find.text('Sign In'), findsOneWidget);
    expect(find.text('Sign Up'), findsOneWidget);
  });

  testWidgets('displays sign-out option when user is signed in', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest(user: mockUser));

    expect(find.text('Sign Out'), findsOneWidget);
    expect(find.byIcon(Icons.exit_to_app), findsOneWidget);
  });
}