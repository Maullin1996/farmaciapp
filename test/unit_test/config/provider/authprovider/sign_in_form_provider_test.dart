import 'package:flutter_test/flutter_test.dart';
import 'package:state_management_exercise/config/provider/authProviders/sign_in_form_provider.dart';
import 'package:state_management_exercise/infraestructure/auth-Inputs/inputsSignIn/inputs_sign_in.dart';
// Import your actual file path
// import 'package:your_app/sign_in_form_notifier.dart';

void main() {
  late SignInFormNotifier signInFormNotifier;

  setUp(() {
    signInFormNotifier = SignInFormNotifier();
  });

  group('SignInFormNotifier Tests', () {
    test('Initial State should be correct', () {
      expect(signInFormNotifier.state.isPosting, false);
      expect(signInFormNotifier.state.isFormPosted, false);
      expect(signInFormNotifier.state.isValid, false);
      expect(signInFormNotifier.state.userEmail, const UserEmail.pure());
      expect(signInFormNotifier.state.userPassword, const UserPassword.pure());
    });

    group('Email Tests', () {
      test('Should update email and validate form', () {
        // Valid email
        signInFormNotifier.onEmailChange('test@example.com');
        
        expect(signInFormNotifier.state.userEmail.value, 'test@example.com');
        expect(signInFormNotifier.state.userEmail.isValid, true);
        // Form should still be invalid because password is empty
        expect(signInFormNotifier.state.isValid, false);
      });

      test('Should handle invalid email', () {
        signInFormNotifier.onEmailChange('invalid-email');
        
        expect(signInFormNotifier.state.userEmail.value, 'invalid-email');
        expect(signInFormNotifier.state.userEmail.isValid, false);
        expect(signInFormNotifier.state.isValid, false);
      });
    });

    group('Password Tests', () {
      test('Should update password and validate form', () {
        // Valid password
        signInFormNotifier.onPasswordChange('password123');
        
        expect(signInFormNotifier.state.userPassword.value, 'password123');
        expect(signInFormNotifier.state.userPassword.isValid, true);
        // Form should still be invalid because email is empty
        expect(signInFormNotifier.state.isValid, false);
      });

      test('Should handle invalid password', () {
        signInFormNotifier.onPasswordChange('123'); // Assuming too short
        
        expect(signInFormNotifier.state.userPassword.value, '123');
        expect(signInFormNotifier.state.userPassword.isValid, false);
        expect(signInFormNotifier.state.isValid, false);
      });
    });

    group('Form Submission Tests', () {
      test('Should validate all fields on submit', () async {
        await signInFormNotifier.onFormSubmit();
        
        expect(signInFormNotifier.state.isFormPosted, true);
        expect(signInFormNotifier.state.isValid, false);
      });

      test('Should handle valid form submission', () async {
        signInFormNotifier.onEmailChange('test@example.com');
        signInFormNotifier.onPasswordChange('password123');
        
        expect(signInFormNotifier.state.isValid, true);
        
        await signInFormNotifier.onFormSubmit();
        
        expect(signInFormNotifier.state.isFormPosted, true);
        expect(signInFormNotifier.state.isPosting, false);
      });
    });
  });
}