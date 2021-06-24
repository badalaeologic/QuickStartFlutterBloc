import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class LoginEvent extends Equatable {
  const LoginEvent();
}




class LoginButtonPressed extends LoginEvent {
  final dynamic email;
  final dynamic password;

  LoginButtonPressed({this.email, this.password});

  @override
  String toString() => "LoginButtonPressed";

  @override
  List<Object> get props => [email, password];
}



class SignUpButtonPressed extends LoginEvent {
  @override
  String toString() => "SignUpButtonPressed";

  @override
  List<Object> get props => [];
}




class ErrorEvent extends LoginEvent {
  final String error;

  ErrorEvent({this.error});

  @override
  String toString() => "ErrorEvent { error : $error}";

  @override
  List<Object> get props => [error];
}
