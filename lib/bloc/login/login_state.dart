import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class LoginState extends Equatable {
  const LoginState();
}










class InitialLoginState extends LoginState {
  @override
  String toString() => 'InitialLoginState';

  @override
  List<Object> get props => [];
}




class LoginLoading extends LoginState {

  final String title;
  final String message;

  LoginLoading({this.title, this.message});

  @override
  String toString() => 'LoginLoading {title : $title, message: $message}';

  @override
  List<Object> get props => [title, message];
}





class LoginSuccess extends LoginState {


  @override
  String toString() => 'LoginSuccess';

  @override
  List<Object> get props => [];
}

class LoginFailure extends LoginState {
  final String error;

  LoginFailure({@required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'LoginFailure { error: $error }';
}

