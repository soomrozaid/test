part of 'login_bloc.dart';

class LoginState {
  final String? username;
  final String? password;

  const LoginState._({this.username = '', this.password = ''});

  LoginState.initial(this.username, this.password);

  static LoginState copyWith({String? username, String? password}) =>
      LoginState._(
        username: username,
        password: password,
      );
}
