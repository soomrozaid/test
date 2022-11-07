import 'package:bloc/bloc.dart';
import 'package:fitbuds/login/login.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState.initial('', '')) {
    on<ChangeLogin>((event, emit) {
      // TODO: implement event handler
      emit(LoginState.copyWith(
        username: event.username,
        password: event.passowrd,
      ));
    });
  }
}
