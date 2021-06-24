import 'package:flutter/material.dart';
import 'package:quick_start_flutter_bloc/extension/string_extension.dart';
import 'package:quick_start_flutter_bloc/ui/styles/shared_styles.dart';
import 'package:quick_start_flutter_bloc/ui/styles/ui_helper.dart';
import 'package:quick_start_flutter_bloc/ui/widgets/busy_button.dart';

class ErrorWidgetView extends StatelessWidget {
  final String title;
  final String message;
  final String buttonLabel;
  final String icon;
  final VoidCallback onButtonClick;
  final Color backgroundColor;
  final bool showButton;

  const ErrorWidgetView(
      {Key key,
      this.title,
      this.message,
      this.buttonLabel,
      this.icon = "assets/images/no_connection.png",
      this.onButtonClick,
      this.backgroundColor = Colors.transparent,
      this.showButton = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        width: screenWidth(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 100.0,
              child: Image.asset(icon),
            ),
            Text(
              "${title}",
              textAlign: TextAlign.center,
              style: errorTitleStyle,
            ),
            if (message.isNotNullOrEmpty) verticalSpace(8.0),
            if (message.isNotNullOrEmpty)
              Container(
                width: 200.0,
                child: Text(
                  "${message}",
                  textAlign: TextAlign.center,
                  style: errorMessageStyle,
                ),
              ),
            verticalSpace(16.0),
            if (showButton)
              BusyButton(
                title: buttonLabel,
                onPressed: onButtonClick,
                busy: false,
              ),
          ],
        ),
      ),
    );
  }
}
