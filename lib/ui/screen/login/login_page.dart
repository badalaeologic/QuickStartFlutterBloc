import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_start_flutter_bloc/bloc/login/login.dart';
import 'package:quick_start_flutter_bloc/ui/screen/login/login_form.dart';
import 'package:quick_start_flutter_bloc/ui/widgets/loading/loading_widget.dart';
import 'package:quick_start_flutter_bloc/utils/helper.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<LoginBloc>(
        child: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginFailure) {
              onWidgetDidBuild(
                () {
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "${state.error}",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400),
                      ),
                      backgroundColor: Colors.red,
                    ),
                  );
                },
              );
            }

            if (state is LoginSuccess) {
              SnackBar(
                content: Text(
                  'Logged In Successfully',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400),
                ),
                backgroundColor: Colors.red,
              );
            }
          },
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              if (state is LoginLoading) {
                return LoadingWidget(
                  title: state.title,
                  message: state.message,
                );
              }

              if (state is InitialLoginState) {
                return LoginForm();
              }

              return Container();
            },
          ),
        ),
        create: (context) => LoginBloc(),
      ),
    );
  }
}
