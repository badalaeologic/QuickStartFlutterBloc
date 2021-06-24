import 'package:flutter/material.dart';
import 'package:quick_start_flutter_bloc/ui/styles/app_colors.dart';
import 'package:quick_start_flutter_bloc/ui/styles/ui_helper.dart';

class LoadingWidget extends StatelessWidget {
  final Color backgroundColor;
  final String title;
  final String message;

  const LoadingWidget(
      {Key key, this.backgroundColor = Colors.white, this.title, this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        alignment: Alignment.center,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(accent)),
              verticalSpace(24.0),
              Text(
                title,
                style: TextStyle(
                    color: primary,
                    fontWeight: FontWeight.w700,
                    fontSize: 16.0),
              ),
              verticalSpace(8.0),
              Text(
                message,
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                    fontSize: 12.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
