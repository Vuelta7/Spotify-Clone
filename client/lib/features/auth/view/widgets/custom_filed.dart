import 'package:flutter/material.dart';

class CustomFiled extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isObscure;
  const CustomFiled({
    super.key, 
    required this.hintText,
    required this.controller,
    this.isObscure = false,
    });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
      ),
      validator: (value) {
        if (value!.trim().isEmpty) {
          return 'Please enter $hintText';
        }
        return null;
      },
      controller: controller,
      obscureText: isObscure,
    );
  }
}