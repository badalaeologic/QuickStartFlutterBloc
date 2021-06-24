import 'package:quick_start_flutter_bloc/networking/models/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
}

class AppStarted extends AuthenticationEvent {
  @override
  String toString() => 'AppStarted';

  @override
  List<Object> get props => [];
}

class LoggedIn extends AuthenticationEvent {
  final String token;
  final UserModel user;

  LoggedIn({@required this.token, this.user});

  @override
  String toString() =>
      'LoggedIn { token: $token , user ${user.toJson().toString()}';

  @override
  List<Object> get props => [token, user];
}

class LoggedOut extends AuthenticationEvent {
  @override
  String toString() => 'LoggedOut';

  @override
  List<Object> get props => [];
}

class ResetPassword extends AuthenticationEvent {
  @override
  String toString() => 'ResetPassword';

  @override
  List<Object> get props => [];
}

class SignupCompleted extends AuthenticationEvent {
  final String token;
  final UserModel user;

  SignupCompleted({this.token, this.user});

  @override
  String toString() =>
      "SignupCompleted : { token: $token , user ${user.toJson().toString()}";

  @override
  List<Object> get props => [token, user];
}

class AuthenticationRegisterEvent extends AuthenticationEvent {
  @override
  String toString() => "AuthenticationRegisterEvent";

  @override
  List<Object> get props => [];
}

class LogInEvent extends AuthenticationEvent {
  @override
  String toString() => "LogInEvent";

  @override
  List<Object> get props => [];
}
