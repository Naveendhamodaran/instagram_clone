import 'package:flutter/material.dart';



class TextFieldInput extends StatelessWidget {
  const TextFieldInput(
      {super.key, required this.hintText, required this.keyboardType, this.obscure=false, required this.controller});

  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final bool obscure;


  @override
  Widget build(BuildContext context) {
    final inputBorder= OutlineInputBorder(borderSide: Divider.createBorderSide(context));
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        focusedBorder: inputBorder,
        border: inputBorder,
        enabledBorder: inputBorder,
        filled: true,
        contentPadding: const EdgeInsets.all(8),
        ),
      keyboardType: keyboardType,
      obscureText: obscure,
      );
  }
}
