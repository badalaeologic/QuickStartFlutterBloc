import 'package:flutter/material.dart';
import 'package:quick_start_flutter_bloc/ui/styles/app_colors.dart' as colors;
import 'package:quick_start_flutter_bloc/ui/styles/shared_styles.dart';

class BusyButton extends StatefulWidget {
  final bool busy;
  final String title;
  final Function onPressed;
  final bool enabled;
  final Color buttonColor;
  final Color splashColor;
  final double width;
  final double height;

  const BusyButton({
    @required this.title,
    this.busy = false,
    @required this.onPressed,
    this.width = 150,
    this.height = 50,
    this.buttonColor = colors.buttonColor,
    this.splashColor = colors.accent,
    this.enabled = true,
  });

  @override
  _BusyButtonState createState() => _BusyButtonState();
}

class _BusyButtonState extends State<BusyButton> {
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: widget.height,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      minWidth: widget.width,
      disabledColor: Colors.grey[300],
      buttonColor: widget.buttonColor,
      splashColor: widget.splashColor,
      child: ElevatedButton(
        onPressed: widget.onPressed,
        child: widget.busy
            ? Container(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
                height: 30.0,
                width: 30.0,
              )
            : Text(
                "${(widget.title) ?? widget.title}",
                style: buttonWhiteTextStyle,
              ),
      ),
    );
  }
}
