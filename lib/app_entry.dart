import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:quick_start_flutter_bloc/ui/screen/home/home.dart';
import 'package:quick_start_flutter_bloc/ui/screen/login/login_page.dart';
import 'package:quick_start_flutter_bloc/ui/screen/sign_up/sign_up_page.dart';
import 'package:quick_start_flutter_bloc/ui/screen/splash/splash_page.dart';
import 'package:quick_start_flutter_bloc/ui/widgets/loading/loading_widget.dart';

import 'bloc/authentication/authentication.dart';
import 'networking/repository/repository.dart';

class AppEntry extends StatefulWidget {
  @override
  _AppEntryState createState() => _AppEntryState();
}

class _AppEntryState extends State<AppEntry> {
  AuthenticationBloc authBloc;

  @override
  void initState() {
    authBloc = AuthenticationBloc(repository: GetIt.instance<Repository>());
    GetIt.instance.registerSingleton<AuthenticationBloc>(authBloc);
//    authBloc.add(AppStarted());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationBloc>(
      create: (context) => authBloc,
      child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
        if (state is AuthenticationAuthenticated) {
          return Home(
            userModel: state.userModel,
          );
        }

        if (state is AuthenticationUnauthenticated) {
          return LoginPage();
        }

        if (state is AuthenticationRegisterState) {
          return SignUpPage();
        }

        if (state is AuthenticationLoading) {
          return LoadingWidget(
            title: "Authenticating",
            message: "Please wait...",
          );
        }
        return SplashPage();
      }),
    );
  }
}
