import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_start_flutter_bloc/bloc/sign_up/sign_up.dart';
import 'package:quick_start_flutter_bloc/ui/styles/themes.dart';
import 'package:quick_start_flutter_bloc/ui/widgets/text_fields/login_field_widget.dart';

class SignUpForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: Text("SIGN UP", style: TextStyles.appBar),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.navigate_before,
              color: Colors.black,
            ),
            onPressed: BlocProvider.of<SignUpBloc>(context).onLoginPage,
          )),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.only(left: 32.0, right: 32.0),
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 32.0,
                    ),
                    Text(
                      "Enter your details to start",
                    ),
                    SizedBox(
                      height: 24.0,
                    ),
                    StreamBuilder<dynamic>(
                      stream: BlocProvider.of<SignUpBloc>(context).name,
                      builder: (context, snapshot) {
                        return LoginFieldWidget(
                          hint: "Name",
                          textAlign: TextAlign.start,
                          prefixIcon: Icons.person,
                          inputAction: TextInputAction.next,
                          inputType: TextInputType.text,
                          error: snapshot.error,
                          onChanged:
                              BlocProvider.of<SignUpBloc>(context).changeName,
                          obscureText: false,
                        );
                      },
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    StreamBuilder<dynamic>(
                      stream: BlocProvider.of<SignUpBloc>(context).email,
                      builder: (context, snapshot) {
                        return LoginFieldWidget(
                          hint: "Email",
                          textAlign: TextAlign.start,
                          prefixIcon: Icons.email,
                          inputAction: TextInputAction.next,
                          inputType: TextInputType.emailAddress,
                          error: snapshot.error,
                          onChanged:
                              BlocProvider.of<SignUpBloc>(context).changeEmail,
                          obscureText: false,
                        );
                      },
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    StreamBuilder<dynamic>(
                      stream: BlocProvider.of<SignUpBloc>(context).mobile,
                      builder: (context, snapshot) {
                        return LoginFieldWidget(
                          hint: "Mobile number",
                          textAlign: TextAlign.start,
                          prefixIcon: Icons.phone,
                          inputAction: TextInputAction.next,
                          inputType: TextInputType.number,
                          error: snapshot.error,
                          onChanged:
                              BlocProvider.of<SignUpBloc>(context).changeMobile,
                          obscureText: false,
                        );
                      },
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    StreamBuilder<dynamic>(
                      stream:
                          BlocProvider.of<SignUpBloc>(context).validPassword,
                      builder: (context, snapshot) {
                        return LoginFieldWidget(
                          hint: "Password",
                          textAlign: TextAlign.start,
                          prefixIcon: Icons.lock,
                          inputAction: TextInputAction.done,
                          inputType: TextInputType.visiblePassword,
                          error: snapshot.error,
                          onChanged: BlocProvider.of<SignUpBloc>(context)
                              .changePassword,
                          obscureText: true,
                        );
                      },
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    SizedBox(
                      height: 45.0,
                      width: double.infinity,
                      child: FlatButton(
                        padding: EdgeInsets.all(8.0),
                        color: Colors.blue,
                        onPressed:
                            BlocProvider.of<SignUpBloc>(context).onSignUpSubmit,
                        child: Text("Register",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0,
                              color: Colors.white,
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 48.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Already have an account?",
                        ),
                        FlatButton(
                          padding: EdgeInsets.all(8.0),
                          color: Colors.blue,
                          onPressed:
                              BlocProvider.of<SignUpBloc>(context).onLoginPage,
                          child: Text("Login",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14.0,
                                color: Colors.white,
                              )),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
