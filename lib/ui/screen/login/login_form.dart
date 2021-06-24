import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_start_flutter_bloc/bloc/login/login.dart';
import 'package:quick_start_flutter_bloc/ui/widgets/text_fields/login_field_widget.dart';

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.only(left: 32.0, right: 32.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Welcome Back!",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20.0,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              StreamBuilder<dynamic>(
                  stream: BlocProvider.of<LoginBloc>(context).email,
                  builder: (context, snapshot) {
                    return LoginFieldWidget(
                      hint: "Email",
                      textAlign: TextAlign.start,
                      prefixIcon: Icons.email,
                      inputAction: TextInputAction.next,
                      inputType: TextInputType.emailAddress,
                      error: snapshot.error,
                      obscureText: false,
                      onChanged:
                          BlocProvider.of<LoginBloc>(context).changeEmail,
                    );
                  }),
              SizedBox(
                height: 24.0,
              ),
              StreamBuilder<dynamic>(
                  stream: BlocProvider.of<LoginBloc>(context).password,
                  builder: (context, snapshot) {
                    return LoginFieldWidget(
                      textAlign: TextAlign.start,
                      hint: "Enter Your Password",
                      prefixIcon: Icons.lock,
                      inputAction: TextInputAction.done,
                      inputType: TextInputType.text,
                      error: snapshot.error,
                      obscureText: true,
                      onChanged:
                          BlocProvider.of<LoginBloc>(context).changePassword,
                    );
                  }),
              SizedBox(
                height: 24.0,
              ),
              StreamBuilder<bool>(
                  stream:
                      BlocProvider.of<LoginBloc>(context).validateLoginButton,
                  builder: (context, snapshot) {
                    return SizedBox(
                      height: 45.0,
                      width: double.infinity,
                      child: FlatButton(
                        padding: EdgeInsets.all(8.0),
                        color: Colors.blue,
                        onPressed: snapshot.hasData
                            ? BlocProvider.of<LoginBloc>(context).onLoginSubmit
                            : () {},
                        child: Text("Login",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0,
                              color: Colors.white,
                            )),
                      ),
                    );
                  }),
              SizedBox(
                height: 48.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Not a member?",
                  ),
//                  InkWell(
//                    child: Text("Reset Password?",
//                        style: TextStyles.defaultTextLite),
//                    onTap: () {
//                      GetIt.instance<AuthenticationBloc>().add(
//                        ResetPassword(),
//                      );
//                    },
//                  ),
                  FlatButton(
                    padding: EdgeInsets.all(8.0),
                    color: Colors.blue,
                    onPressed: BlocProvider.of<LoginBloc>(context).onSignUp,
                    child: Text("Sign Up",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14.0,
                          color: Colors.white,
                        )),
                  )
                ],
              ),
              SizedBox(
                height: 50.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
