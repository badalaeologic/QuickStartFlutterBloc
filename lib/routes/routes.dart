import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quick_start_flutter_bloc/constants/routes_name.dart';
import 'package:quick_start_flutter_bloc/ui/screen/splash/splash_page.dart';
import 'package:quick_start_flutter_bloc/ui/widgets/error_widget_view.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashRoutePage:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: SplashPage(),
      );

    default:
      return CupertinoPageRoute(
        builder: (_) => ErrorWidgetView(
          icon: "assets/images/error.png",
          title: '',
          message: '',
          showButton: false,
        ),
      );
  }
}

PageRoute _getPageRoute({String routeName, Widget viewToShow}) {
  return CupertinoPageRoute(
      settings: RouteSettings(
        name: routeName,
      ),
      builder: (_) => viewToShow);
}
