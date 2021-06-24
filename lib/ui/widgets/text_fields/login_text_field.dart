import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quick_start_flutter_bloc/ui/styles/app_colors.dart';
import 'package:quick_start_flutter_bloc/ui/styles/themes.dart';
import 'package:quick_start_flutter_bloc/ui/styles/ui_helper.dart';

class LoginTextField extends StatelessWidget {
  LoginTextField(
      {this.hint,
      this.inputAction,
      this.inputType = TextInputType.number,
      this.error,
      this.onChanged,
      this.obscureText = false,
      this.prefixIcon,
      this.suffixIcon,
      this.textAlign,
      this.controller});

  final Function(String) onChanged;
  final String hint;
  final TextInputAction inputAction;
  final TextInputType inputType;
  final String error;
  final bool obscureText;
  final IconData prefixIcon;
  final IconData suffixIcon;
  final TextAlign textAlign;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: controller,
        keyboardType: inputType,
        textAlign: textAlign == null ? TextAlign.center : textAlign,
        textInputAction: inputAction,
        style: TextStyle(
            color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.w400),
        onChanged: onChanged,
        obscureText: obscureText,
        decoration: InputDecoration(
          prefixIcon: prefixIcon != null
              ? Icon(
                  prefixIcon,
                  size: 18.0,
                  color: Colors.black,
                )
              : null,
          contentPadding: const EdgeInsets.all(12.0),
          border: BorderStyles.auctionTextFieldBorderStyle,
          enabledBorder: BorderStyles.auctionTextFieldBorderStyle,
          disabledBorder: BorderStyles.auctionTextFieldBorderStyle,
          focusedBorder: BorderStyles.auctionTextFieldBorderStyle,
          errorText: error ?? null,
          errorMaxLines: 3,
          errorBorder: BorderStyles.errorBorder,
          errorStyle: TextStyles.errorStyle,
          hintStyle: TextStyles.hintStyle,
          filled: true,
          hintText: hint,
          fillColor: Colors.white24,
        ),
      ),
    );
  }
}
