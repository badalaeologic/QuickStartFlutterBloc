import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_start_flutter_bloc/ui/styles/app_colors.dart';

class TextStyles {
  TextStyles();

  static const TextStyle appBar = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 18.0,
    color: Colors.black,
  );

  static TextStyle redHeadTextStyle = GoogleFonts.poppins(
    color: buttonColor,
    fontWeight: FontWeight.bold,
    fontSize: 20.0,
  );

  static const TextStyle errorStyle =
      TextStyle(fontWeight: FontWeight.w300, fontSize: 12.0, color: Colors.red);

  static const TextStyle hintStyle = TextStyle(
      color: Colors.grey, fontSize: 14.0, fontWeight: FontWeight.w400);
}

class BoxDecorations {
  BoxDecorations();

  static const ContainerBoxDecoration = BoxDecoration(
    borderRadius: const BorderRadius.all(
      const Radius.circular(0.0),
    ),
    color: Color(0xFFf7f7f7),
  );
}

class BorderStyles {
  BorderStyles();

  static const OutlineInputBorder textFieldBorderStyle =
      const OutlineInputBorder(
    borderRadius: const BorderRadius.all(
      const Radius.circular(25.0),
    ),
    borderSide: const BorderSide(
      color: Colors.grey,
      width: 0.0,
    ),
  );

  static const OutlineInputBorder auctionTextFieldBorderStyle =
      const OutlineInputBorder(
    borderRadius: const BorderRadius.all(
      const Radius.circular(10.0),
    ),
    borderSide: const BorderSide(
      color: Colors.grey,
      width: 0.0,
    ),
  );

  static const OutlineInputBorder errorBorder = const OutlineInputBorder(
    borderRadius: const BorderRadius.all(
      const Radius.circular(10.0),
    ),
    borderSide: const BorderSide(
      color: Colors.red,
      width: 0.5,
    ),
  );
}
