import 'package:flutter/material.dart';

class FitButton extends StatelessWidget {
  final double padding;
  final double fontSize;
  final FontWeight fontWeight;
  final String text;
  final void Function() onPressed;
  final Widget? child;
  const FitButton({
    Key? key,
    this.padding = 8,
    this.fontSize = 24,
    this.fontWeight = FontWeight.w200,
    this.text = 'fit button',
    required this.onPressed,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: child ??
          ElevatedButton(
            child: Text(text),
            onPressed: onPressed,
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: 36, vertical: 12)),
              textStyle: MaterialStateProperty.all(TextStyle(
                fontSize: fontSize,
                fontWeight: fontWeight,
              )),
              backgroundColor: MaterialStateProperty.all(
                  const Color.fromRGBO(255, 87, 87, 1.0)),
            ),
          ),
    );
  }
}
