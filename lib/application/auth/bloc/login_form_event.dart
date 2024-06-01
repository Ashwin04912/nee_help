part of 'login_form_bloc.dart';

@freezed
class LoginFormEvent with _$LoginFormEvent {
    const factory LoginFormEvent.emailChanged(String emailStr) = EmailChanged;
  const factory LoginFormEvent.passwordChanged(String passwordStr) =
      PasswordChanged;
  const factory LoginFormEvent.registerWithEmailAndPasswordPressed() =
      RegisterWithEmailAndPasswordPressed;
  const factory LoginFormEvent.signInWithEmailAndPasswordPressed({
   required String emailStr,
   required String passwordStr,
  }) =
      SignInWithEmailAndPasswordPressed;

}