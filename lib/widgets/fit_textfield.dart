import 'package:flutter/material.dart';

class FitTextField extends StatelessWidget {
  final double padding;
  final double verticalPadding;
  final double horizontalPadding;
  final EdgeInsets? paddingEdgeInsets;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final String hintText;
  final String? errorText;
  final FocusNode? focusNode;
  const FitTextField({
    Key? key,
    this.padding = 8,
    this.verticalPadding = 8,
    this.horizontalPadding = 24,
    this.paddingEdgeInsets,
    this.controller,
    this.onChanged,
    this.hintText = 'Hint Text',
    this.errorText,
    this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: verticalPadding, horizontal: horizontalPadding),
      // ?? EdgeInsets.all(padding),
      child: TextField(
        focusNode: focusNode,
        controller: controller,
        onChanged: onChanged,
        obscureText: hintText.toLowerCase() == 'password',
        autocorrect: hintText.toLowerCase() == 'password' ||
            hintText.toLowerCase() == 'username',
        decoration: InputDecoration(
            // enabledBorder: const OutlineInputBorder(),
            focusedBorder: const OutlineInputBorder(),
            hintText: hintText,
            hintStyle:
                const TextStyle(fontSize: 18, fontWeight: FontWeight.w200),
            contentPadding: const EdgeInsets.all(12),
            errorText: errorText),
      ),
    );
  }
}
