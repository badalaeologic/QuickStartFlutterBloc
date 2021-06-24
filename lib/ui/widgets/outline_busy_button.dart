import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_start_flutter_bloc/ui/styles/app_colors.dart' as colors;
import 'package:quick_start_flutter_bloc/ui/styles/shared_styles.dart';

class OutlineBusyButton extends StatefulWidget {
  final bool busy;
  final String title;
  final Color borderColor;
  final Color splashColor;
  final Color buttonColor;
  final double width;
  final double height;
  final VoidCallback onPressed;

  const OutlineBusyButton({
    Key key,
    this.busy = false,
    @required this.title,
    this.borderColor = colors.buttonColor,
    this.splashColor = colors.secondary,
    this.buttonColor = Colors.white,
    this.width = 150.0,
    this.height = 40.0,
    @required this.onPressed,
  }) : super(key: key);

  @override
  _OutlineBusyButtonState createState() => _OutlineBusyButtonState();
}

class _OutlineBusyButtonState extends State<OutlineBusyButton> {
  bool _pressed = false;

  bool get pressed => _pressed;

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: widget.height,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      minWidth: widget.width,
      disabledColor: colors.offWhite,
      buttonColor: widget.buttonColor,
      splashColor: widget.splashColor,
      child: OutlineButton(
        highlightElevation: 2.0,
        splashColor: widget.splashColor,
        highlightColor: colors.primary,
        onPressed: widget.onPressed != null
            ? () {
                widget.onPressed();
              }
            : null,
        child: widget.busy
            ? Container(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(colors.blueGrey),
                ),
                height: 30.0,
                width: 30.0,
              )
            : Text(
                "${(widget.title) ?? widget.title}",
                style: pressed
                    ? buttonWhiteTextStyle
                    : GoogleFonts.poppins(
                        fontWeight: FontWeight.w700,
                        color: widget.borderColor,
                        fontSize: 15.0),
              ),
        borderSide: BorderSide(
          width: 2.0,
          color: widget.borderColor,
        ),
        disabledBorderColor: colors.offWhite,
        disabledTextColor: colors.blueGrey,
        color: Colors.white,
        textColor: colors.primary,
        focusColor: colors.primary,
        highlightedBorderColor: colors.primary,
      ),
    );
  }
}
