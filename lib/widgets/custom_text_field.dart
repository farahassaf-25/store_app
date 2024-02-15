import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      this.onChanged,
      this.hintText,
      this.obscureText = false,
      this.inputType});

  Function(String)? onChanged;
  String? hintText;
  bool obscureText;
  TextInputType? inputType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        obscureText: obscureText,
        onChanged: onChanged,
        keyboardType: inputType,
        decoration: InputDecoration(
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(),
            borderRadius: BorderRadius.circular(18),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(),
            borderRadius: BorderRadius.circular(18),
          ),
        ),
      ),
    );
  }
}
