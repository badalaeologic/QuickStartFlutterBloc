import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:quick_start_flutter_bloc/bloc/authentication/authentication.dart';
import 'package:quick_start_flutter_bloc/bloc/validators.dart';
import 'package:quick_start_flutter_bloc/main.dart';
import 'package:quick_start_flutter_bloc/networking/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

import 'login.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {



  LoginBloc() : super(InitialLoginState());




  final Repository repository = GetIt.instance<Repository>();

  final _emailController = BehaviorSubject<dynamic>();
  final _passwordController = BehaviorSubject<dynamic>();

  Stream<dynamic> get email =>
      _emailController.stream.transform(Validators.validateEmail);

  Stream<dynamic> get password =>
      _passwordController.stream.transform(Validators.validPassword);

  Stream<bool> get validateLoginButton =>
      CombineLatestStream([email, password], (data) => true);

  Function(dynamic) get changeEmail => _emailController.sink.add;

  Function(dynamic) get changePassword => _passwordController.sink.add;






  @override
  void onTransition(Transition<LoginEvent, LoginState> transition) {
    logger.i(transition.event.toString(), "$transition");
    super.onTransition(transition);
  }

  void onSignUp() {
    GetIt.instance<AuthenticationBloc>().add(AuthenticationRegisterEvent());
  }

  onLoginSubmit() {
    final email = _emailController.value;
    final validPassword = _passwordController.value;

    if (email == null || email == '') {
      add(ErrorEvent(error: 'please enter email'));
    } else if (validPassword == null || validPassword == '') {
      add(ErrorEvent(error: 'please enter password'));
    } else {
      add(LoginButtonPressed(email: email, password: validPassword));
    }
  }

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {


    if (event is LoginButtonPressed) {



      yield LoginLoading(title: "Logging in", message: "Please wait...");



      Map map = new Map();
      map = {
        "email": event.email != null ? event.email.toString().trim() : "",
        "password":
            event.password != null ? event.password.toString().trim() : "",
        "device_id": "",
        "pushToken": "xyz"
      };

      try {
        final response = await repository.userLogin(map);
        GetIt.instance<AuthenticationBloc>().add(
          LoggedIn(token: response.data.slId, user: response.data),
        );
      } catch (e) {
        print(e);
        //add(ErrorEvent());
        yield LoginFailure(error: e.message);
        yield InitialLoginState();
      }
    }




    if (event is ErrorEvent) {
      yield LoginFailure(error: event.error);
      yield InitialLoginState();
    }
  }

  @override
  Future<void> close() {
    _emailController.close();
    _passwordController.close();
    return super.close();
  }
}
