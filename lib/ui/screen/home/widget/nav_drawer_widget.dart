import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_start_flutter_bloc/bloc/home/home.dart';
import 'package:quick_start_flutter_bloc/networking/models/user_model.dart';
import 'package:quick_start_flutter_bloc/ui/screen/home/widget/nav_drawer_row_widget.dart';
import 'package:quick_start_flutter_bloc/utils/url_provider.dart';

class NavDrawer extends StatelessWidget {
  final UserModel userModel;

  NavDrawer({this.userModel});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              accountName: Text(
                '${userModel.name}',
              ),
              accountEmail: Text(userModel.email),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  '${userModel.name[0]}',
                  style: TextStyle(fontSize: 30.0),
                ),
              ),
            ),
            NavDrawerRowWidget(
              text: 'Profile',
              icon: Icon(
                Icons.person,
                color: Colors.grey,
                size: 24.0,
              ),
              onClick: () {},
            ),
            NavDrawerRowWidget(
              text: 'Bookmarks',
              icon: Icon(
                Icons.bookmark,
                color: Colors.grey,
                size: 24.0,
              ),
              onClick: () {},
            ),
            NavDrawerRowWidget(
              text: 'Settings',
              icon: Icon(
                Icons.settings,
                color: Colors.grey,
                size: 24.0,
              ),
              onClick: () {},
            ),
            NavDrawerRowWidget(
              text: 'Rate Us',
              icon: Icon(
                Icons.rate_review,
                color: Colors.grey,
                size: 24.0,
              ),
              onClick: launchURL,
            ),
            NavDrawerRowWidget(
              text: 'Logout',
              icon: Icon(
                Icons.exit_to_app,
                color: Colors.grey,
                size: 24.0,
              ),
              onClick: () {
                Navigator.pop(context);
                BlocProvider.of<HomeCubit>(context).logout();
              },
            ),
          ],
        ),
      ),
    );
  }

  launchURL() async {
    String url = Platform.isIOS ? APP_STORE_URL : PLAY_STORE_URL;
  }
}
