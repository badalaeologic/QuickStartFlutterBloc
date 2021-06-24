import 'package:flutter/material.dart';

class NavDrawerRowWidget extends StatelessWidget {
  final String text;
  final Icon icon;
  final Function onClick;

  NavDrawerRowWidget({this.text, this.icon, this.onClick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        padding: EdgeInsets.only(left: 16.0, right: 16.0),
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  icon,
                  SizedBox(
                    width: 16.0,
                  ),
                  Text(
                    text,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(
                height: 2.0,
                color: Colors.grey,
              ),
            )
          ],
        ),
      ),
    );
  }
}
