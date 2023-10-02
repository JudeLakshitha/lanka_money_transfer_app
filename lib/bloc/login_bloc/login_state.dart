part of 'login_bloc.dart';

@immutable
class LoginState {
  final String username;
  final String password;
  final FormSubmissionStatus formStatus;

  bool get isValidUsername => username.contains('@');

  bool get isValidPassword => password.length > 1;

  const LoginState({
    this.username = '',
    this.password = '',
    this.formStatus = const InitialFormStatus(),
  });

  LoginState copyWith({
    required String username,
    required String password,
    required FormSubmissionStatus formStatus,
  }) {
    return LoginState(
        username: username, password: password, formStatus: formStatus);
  }
}
