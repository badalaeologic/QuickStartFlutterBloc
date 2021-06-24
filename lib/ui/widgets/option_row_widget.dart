import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_start_flutter_bloc/ui/styles/app_colors.dart';

class OptionRowWidget extends StatelessWidget {
  final String title;
  final Function onClick;

  OptionRowWidget({this.title, this.onClick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
//        decoration: BoxDecoration(
//            color: Colors.white,
//            border: Border(
//              bottom: BorderSide(color: offWhite),
//            )),
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                title,
                style: GoogleFonts.nunitoSans(
                  color: black,
                  fontWeight: FontWeight.w600,
                  fontSize: 14.0,
                ),
              ),
            ),
            Container(
              child: Center(
                  child: Icon(
                Icons.navigate_next,
                color: blueGrey,
                size: 24.0,
              )),
            )
          ],
        ),
      ),
    );
  }
}
