import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_start_flutter_bloc/ui/styles/app_colors.dart';
import 'package:quick_start_flutter_bloc/ui/styles/ui_helper.dart';
import 'package:quick_start_flutter_bloc/ui/widgets/busy_button.dart';
import 'package:quick_start_flutter_bloc/ui/widgets/option_row_widget.dart';

class AccountsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              verticalSpace(16.0),
              Container(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: Container(
                  height: 120.0,
                  width: 120.0,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    image: DecorationImage(
                      image: AssetImage('assets/images/person.png'),
                      fit: BoxFit.fill,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              verticalSpace(16.0),
              Text(
                "Badal Kumar",
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 18.0),
                overflow: TextOverflow.ellipsis,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.mail_outline,
                    color: buttonColor,
                    size: 16.0,
                  ),
                  horizontalSpaceTiny,
                  Text(
                    "KBadal001@gmail.com",
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 14.0),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              verticalSpace(24.0),
              OptionRowWidget(
                title: 'Profile',
                onClick: () {},
              ),
              OptionRowWidget(
                title: 'Notification',
                onClick: () {},
              ),
              OptionRowWidget(
                title: 'Wallet',
                onClick: () {},
              ),
              OptionRowWidget(
                title: 'About',
                onClick: () {},
              ),
              OptionRowWidget(
                title: 'Share',
                onClick: () {},
              ),
              OptionRowWidget(
                title: 'Refund Policy',
                onClick: () {},
              ),
              OptionRowWidget(
                title: 'Privacy Policy',
                onClick: () {},
              ),
              OptionRowWidget(
                title: 'Frequently Asked Questions',
                onClick: () {},
              ),
              OptionRowWidget(
                title: 'Terms And Conditions',
                onClick: () {},
              ),
              OptionRowWidget(
                title: 'Help Desk',
                onClick: () {},
              ),
              verticalSpace(24.0),
              BusyButton(title: 'Logout', onPressed: () {}),
              verticalSpace(24.0),
            ],
          ),
        ),
      ),
    );
  }
}
