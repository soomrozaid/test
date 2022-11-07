part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class Authenticate extends AuthEvent {
  final bool isNewUser;
  final String? name;
  final String email;
  final String? username;
  final String password;

  Authenticate(
      {this.username, required this.password, this.name, required this.email, this.isNewUser = false});
}

class Unauthenticate extends AuthEvent {}

class ClearUsers extends AuthEvent {}

class ListUsers extends AuthEvent {}
