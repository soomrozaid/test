part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class ChangeLogin extends LoginEvent {
  final String? username;
  final String? passowrd;

  ChangeLogin({this.username, this.passowrd});
}
