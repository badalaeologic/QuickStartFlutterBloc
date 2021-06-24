import 'package:flutter/material.dart';

import 'login_text_field.dart';

class LoginFieldWidget extends StatelessWidget {
  LoginFieldWidget(
      {this.hint,
      this.inputAction,
      this.inputType,
      this.error,
      this.obscureText = false,
      this.prefixIcon,
      this.suffixIcon,
      this.textAlign,
      this.onChanged,
      this.controller,
      this.type = "field"});

  final String hint;
  final TextInputAction inputAction;
  final TextInputType inputType;
  final String error;
  final bool obscureText;
  final IconData prefixIcon, suffixIcon;
  final String type;
  final TextAlign textAlign;
  final Function(String) onChanged;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return LoginTextField(
      controller: controller,
      hint: hint,
      onChanged: onChanged,
      inputAction: inputAction,
      inputType: inputType,
      error: error ?? null,
      obscureText: obscureText,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      textAlign: textAlign,
    );
  }
}
