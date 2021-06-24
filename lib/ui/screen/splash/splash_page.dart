import 'dart:async';

import 'package:quick_start_flutter_bloc/bloc/authentication/authentication.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashState();
  }
}

class SplashState extends State<SplashPage> {
  @override
  void initState() {
    startTimeout();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16.0),
          color: Colors.blue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("Flutter BLOC Quick Start",
                  style: TextStyle(
                    letterSpacing: 3.0,
                    fontWeight: FontWeight.w900,
                    fontSize: 40.0,
                    color: Colors.white,
                  )),
              SizedBox(
                height: 16.0,
              ),
              SizedBox(
                height: 5.0,
                width: 80.0,
                child: Container(
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void handleTimeout() {
    BlocProvider.of<AuthenticationBloc>(context).add(AppStarted());
  }

  startTimeout() async {
    var duration = const Duration(seconds: 2);
    return Timer(duration, handleTimeout);
  }
}
