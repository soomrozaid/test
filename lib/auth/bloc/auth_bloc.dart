import 'dart:convert';
import 'dart:developer';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:fitbuds/auth/auth.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthenticationRepository _authRepo;
  AuthBloc(this._authRepo) : super(AuthInitial()) {
    on<Authenticate>((event, emit) async {
      emit(LoadingState());
      AuthResponse _response;
      if (event.isNewUser) {
        _response = await _authRepo.createUserWithEmailAndPassword(
            email: event.email, password: event.password);
        _response.isAuthenticated
            ? emit(AuthenticatedState())
            : emit(UnauthenticatedState());
      } else {
        _response = await _authRepo.signInWithEmailAndPassword(
            email: event.email, password: event.password);
        _response.isAuthenticated
            ? emit(AuthenticatedState())
            : emit(UnauthenticatedState());
      }
      print(_response.logs);
    });

    on<Unauthenticate>(((event, emit) async {
      emit(LoadingState());
      await Future.delayed(const Duration(seconds: 5));
      emit(UnauthenticatedState());
    }));

    on<ClearUsers>(((event, emit) async {
      SharedPreferences _sharedPrefs = await SharedPreferences.getInstance();
      _sharedPrefs.clear();
      emit(UnauthenticatedState());
    }));
  }
}
