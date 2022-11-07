part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthenticatedState extends AuthState {}

class UnauthenticatedState extends AuthState {
  final String? error;

  UnauthenticatedState({this.error});
}

class LoadingState extends AuthState {}
