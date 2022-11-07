import 'package:flutter/material.dart';

class FitText extends StatelessWidget {
  final double padding;
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  const FitText(
    this.text, {
    Key? key,
    this.padding = 8,
    this.fontSize = 24,
    this.fontWeight = FontWeight.w200,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
