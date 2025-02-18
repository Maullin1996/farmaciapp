import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:state_management_exercise/design/copys.dart';
import 'package:state_management_exercise/firebase_options.dart';
import 'package:state_management_exercise/presentation/ui/screens/auth/sign_in_screen.dart';

final testApp = ProviderScope(
  child: MaterialApp(
    home: SignInScreen(),
  ),
);

void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    print('Firebase initialized');
    await Future.delayed(const Duration(seconds: 5)); // Add a small delay
  });

  group('SignInScreen', () {
    testWidgets('should render SignInScreen', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(testApp);

      // Act
      await tester.pumpAndSettle();

      // Assert
      expect(find.byType(SignInScreen), findsOneWidget);
    });

    testWidgets(
      'find input email',
      (WidgetTester tester) async {
        // Arrange
        await tester.pumpWidget(testApp);
        const inputEmailKey = Key('emailField');

        // Act
        await tester.pumpAndSettle();

        // Assert
        expect(find.byKey(inputEmailKey), findsOneWidget);
      },
    );

    testWidgets(
      'find input password',
      (WidgetTester tester) async {
        // Arrange
        await tester.pumpWidget(testApp);
        const inputPasswordKey = Key('passwordField');

        // Act
        await tester.pumpAndSettle();

        // Assert
        expect(find.byKey(inputPasswordKey), findsOneWidget);
      },
    );

    testWidgets(
      'find sign in button',
      (WidgetTester tester) async {
        // Arrange
        await tester.pumpWidget(testApp);
        const signInButton = Key('singInButton');

        // Act
        await tester.pumpAndSettle();

        // Assert
        expect(find.byKey(signInButton), findsOneWidget);
      },
    );

    testWidgets(
      'find register button',
      (WidgetTester tester) async {
        // Arrange
        await tester.pumpWidget(testApp);
        const registerButton = Key('registerButton');

        // Act
        await tester.pumpAndSettle();

        // Assert
        expect(find.byKey(registerButton), findsOneWidget);
      },
    );

    testWidgets(
      'find title',
      (WidgetTester tester) async {
        // Arrange
        await tester.pumpWidget(testApp);
        const title = FarmaciAppCopys.nameApp;

        // Act
        await tester.pumpAndSettle();
        final findTitle = find.text(title);

        // Assert
        expect(findTitle, findsOneWidget);
      },
    );
  });

  group(
    'Interact with the widgets',
    () {
      testWidgets(
        'fill email',
        (WidgetTester tester) async {
          // Arrange
          const email = 'test@google.com';
          await tester.pumpWidget(testApp);
          const inputEmailKey = Key('emailField');
          await tester.pumpAndSettle();
          final findInputEmail = find.byKey(inputEmailKey);
          // Act
          await tester.enterText(findInputEmail, email);
          await tester.pumpAndSettle();
          // Assert
          final findEmail = find.text(email);
          expect(findEmail, findsOneWidget);
        },
      );

      testWidgets(
        'fill password',
        (WidgetTester tester) async {
          // Arrange
          const password = 'Test12345';
          await tester.pumpWidget(testApp);
          const inputPasswordKey = Key('passwordField');
          await tester.pumpAndSettle();
          final findInputEmail = find.byKey(inputPasswordKey);
          // Act
          await tester.enterText(findInputEmail, password);
          await tester.pumpAndSettle();
          // Assert
          final findPassword = find.text(password);
          expect(findPassword, findsOneWidget);
        },
      );
    },
  );

  group(
    'Testing user interaction with the widgets',
    () {
      testWidgets(
        'filled email input but empty password input',
        (WidgetTester tester) async {
          // Arrange
          await tester.pumpWidget(testApp);
          const email = 'test@google.com';
          const inputEmailKey = Key('emailField');
          const signInButton = Key('singInButton');
          await tester.pumpAndSettle();
          final findInputEmail = find.byKey(inputEmailKey);
          final findSignInButton = find.byKey(signInButton);
          // Act
          await tester.enterText(findInputEmail, email);
          await tester.pumpAndSettle();
          await tester.tap(findSignInButton);
          await tester.pumpAndSettle();
          // Assert
          final findError = find.text(FarmaciAppErrors.fieldEmpty);
          expect(findError, findsOneWidget);
        },
      );
    },
  );
}