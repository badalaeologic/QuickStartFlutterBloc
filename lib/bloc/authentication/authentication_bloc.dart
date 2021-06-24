import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:quick_start_flutter_bloc/main.dart';
import 'package:quick_start_flutter_bloc/networking/repository/repository.dart';

import 'authentication.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({this.repository}) : super(AuthenticationUninitialized());

  final Repository repository;

  @override
  void onTransition(
      Transition<AuthenticationEvent, AuthenticationState> transition) {
    logger.v(transition.event.toString(), "$transition");
    super.onTransition(transition);
  }

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is AppStarted) {
      final bool hasToken = await repository.hasToken();

      if (hasToken) {
        final user = repository.fetchUserData();
        yield AuthenticationAuthenticated(userModel: user);
      } else {
        yield AuthenticationUnauthenticated();
      }
    }

    if (event is LogInEvent) {
      yield AuthenticationUnauthenticated();
    }

    if (event is ResetPassword) {
      yield AuthenticationResetPassword();
    }

    if (event is LoggedIn) {
      yield AuthenticationLoading();
      await repository.saveAuthToken(event.token);
      await repository.saveUserData(event.user);
      yield AuthenticationAuthenticated(userModel: event.user);
    }

    if (event is LoggedOut) {
      yield AuthenticationLoading();
      await repository.deleteUser();
      yield AuthenticationUnauthenticated();
    }

    if (event is AuthenticationRegisterEvent) {
      yield AuthenticationRegisterState();
    }
  }
}
