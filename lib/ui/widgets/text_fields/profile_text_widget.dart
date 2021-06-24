import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_start_flutter_bloc/ui/widgets/text_fields/profile_text_field.dart';

class ProfileFieldWidget extends StatelessWidget {
  ProfileFieldWidget(
      {this.hint,
      this.title,
      this.inputAction,
      this.inputType,
      this.error,
      this.labelText,
      this.obscureText = false,
      this.enabled = true,
      this.prefixIcon,
      this.suffixIcon,
      this.onChanged,
      this.editingController,
      this.type = "field"});

  final String hint;
  final String title;
  final TextInputAction inputAction;
  final TextInputType inputType;
  final String error;
  final String labelText;
  final bool obscureText;
  final bool enabled;
  final IconData prefixIcon, suffixIcon;
  final String type;
  final Function onChanged;
  final TextEditingController editingController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.lato(
            color: Colors.grey,
            fontWeight: FontWeight.w800,
            fontSize: 14.0,
          ),
        ),
        ProfileTextField(
          hint: hint,
          editingController: editingController,
          onChanged: onChanged,
          inputAction: inputAction,
          inputType: inputType,
          error: error,
          enabled: enabled,
          labelText: labelText,
          obscureText: obscureText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
        )
      ],
    );
  }
}
