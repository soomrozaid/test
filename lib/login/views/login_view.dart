import 'package:authentication_repository/authentication_repository.dart';
import 'package:fitbuds/auth/auth.dart';
import 'package:fitbuds/auth/bloc/auth_bloc.dart';
import 'package:fitbuds/login/login.dart';
import 'package:fitbuds/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatefulWidget {
  final String? errorMessage;
  const LoginView({Key? key, this.errorMessage}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _usernameController = TextEditingController();

  final FocusNode _usernameFocusNode = FocusNode();

  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _passwordFocusNode = FocusNode();

  final TextEditingController _nameController = TextEditingController();

  final FocusNode _nameFocusNode = FocusNode();

  final TextEditingController _emailController = TextEditingController();

  final FocusNode _emailFocusNode = FocusNode();

  final AuthenticationRepository _repo = AuthenticationRepository();

  bool isNewUser = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: _scaffoldState,
      body: Builder(builder: (context) {
        return SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const FitText('I am new here.'),
                    CupertinoSwitch(
                      value: isNewUser,
                      onChanged: (value) => setState(() => isNewUser = value),
                    ),
                  ],
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      _usernameFocusNode.unfocus();
                      _passwordFocusNode.unfocus();
                      _emailFocusNode.unfocus();
                      _nameFocusNode.unfocus();
                    },
                  ),
                ),
                ..._newUserWidgets() ?? [],
                FitTextField(
                  controller: _usernameController,
                  focusNode: _usernameFocusNode,
                  onChanged: (String value) =>
                      BlocProvider.of<LoginBloc>(context)
                          .add(ChangeLogin(username: _usernameController.text)),
                  hintText: 'Username',
                ),
                FitTextField(
                  controller: _passwordController,
                  focusNode: _passwordFocusNode,
                  onChanged: (String value) =>
                      BlocProvider.of<LoginBloc>(context)
                          .add(ChangeLogin(passowrd: _passwordController.text)),
                  hintText: 'Password',
                ),
                FitButton(
                  text: isNewUser ? 'Signup' : 'Login',
                  onPressed: () => isNewUser
                      ? BlocProvider.of<AuthBloc>(context).add(
                          Authenticate(
                            username: _usernameController.text,
                            password: _passwordController.text,
                            name: _nameController.text,
                            email: _emailController.text,
                            isNewUser: true,
                          ),
                        )
                      : BlocProvider.of<AuthBloc>(context).add(
                          Authenticate(
                            email: _usernameController.text,
                            password: _passwordController.text,
                          ),
                        ),
                ),
                FitButton(
                  text: 'Preset Login',
                  onPressed: () => context.read<AuthBloc>().add(
                        Authenticate(
                          password: 'Soomro.1',
                          email: 'soomrozaid@gmail.com',
                        ),
                      ),
                ),
                // FitButton(
                //   text: 'Signin',
                //   onPressed: () => _repo.signInWithEmailAndPassword(
                //       email: 'username', password: 'password'),
                // ),
                // FitButton(
                //   text: 'Add Users',
                //   onPressed: () => _repo.createUserWithEmailAndPassword(
                //       email: 'email', password: 'password'),
                // ),
                FitButton(
                  text: 'Clear',
                  onPressed: () => context.read<AuthBloc>().add(ClearUsers()),
                )
              ],
            ),
          ),
        );
      }),
    );
  }

  List<Widget>? _newUserWidgets() => isNewUser
      ? <Widget>[
          FitTextField(
            controller: _nameController,
            focusNode: _nameFocusNode,
            onChanged: (String value) => BlocProvider.of<LoginBloc>(context)
                .add(ChangeLogin(username: _usernameController.text)),
            hintText: 'Name',
          ),
          FitTextField(
            controller: _emailController,
            focusNode: _emailFocusNode,
            onChanged: (String value) => BlocProvider.of<LoginBloc>(context)
                .add(ChangeLogin(username: _usernameController.text)),
            hintText: 'Email',
          )
        ]
      : null;
}
