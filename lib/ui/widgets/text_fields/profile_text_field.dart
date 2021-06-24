import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileTextField extends StatelessWidget {
  ProfileTextField(
      {this.hint,
      this.inputAction,
      this.inputType = TextInputType.text,
      this.error,
      this.labelText,
      this.onChanged,
      this.obscureText = false,
      this.enabled = true,
      this.prefixIcon,
      this.suffixIcon,
      this.editingController});

  final Function(String) onChanged;
  final String hint;
  final TextInputAction inputAction;
  final TextInputType inputType;
  final String error;
  final String labelText;
  final bool obscureText;
  final bool enabled;
  final IconData prefixIcon;
  final IconData suffixIcon;
  final TextEditingController editingController;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: TextField(
        enabled: enabled,
        controller: editingController,
        textInputAction: inputAction,
        style: GoogleFonts.lato(
          color: Colors.black87,
          fontWeight: FontWeight.w600,
          fontSize: 16.0,
        ),
        onChanged: onChanged,
        obscureText: obscureText,
        keyboardType: inputType,
        decoration: InputDecoration(
          prefixIcon: prefixIcon != null
              ? Icon(
                  prefixIcon,
                  size: 18.0,
                  color: Colors.grey,
                )
              : null,
          suffixIcon: suffixIcon != null
              ? Icon(
                  suffixIcon,
                  size: 18.0,
                  color: Colors.grey,
                )
              : null,
          contentPadding: const EdgeInsets.only(top: 0.0, bottom: 0.0),
          errorText: error ?? null,
          errorStyle: GoogleFonts.lato(
            color: Colors.red,
            fontWeight: FontWeight.w300,
            fontSize: 12.0,
          ),
          hintStyle: GoogleFonts.lato(
            color: Colors.grey,
            fontWeight: FontWeight.w400,
            fontSize: 14.0,
          ),
          filled: true,
          hintText: hint,
          fillColor: Color(0xFFFFFFFF),
          labelText: labelText,
        ),
      ),
    );
  }
}
