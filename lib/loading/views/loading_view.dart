import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromRGBO(255, 87, 87, 1.0),
      body: Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.white,
          color: Color.fromRGBO(255, 87, 87, 1.0),
        ),
      ),
    );
  }
}
