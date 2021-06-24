import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SignUpEvent extends Equatable {
  const SignUpEvent();
}

class SignUpButtonPressedEvent extends SignUpEvent {
  final dynamic mobile;
  final dynamic email;
  final dynamic name;
  final dynamic password;

  SignUpButtonPressedEvent({this.name, this.password, this.mobile, this.email});

  @override
  List<Object> get props => [mobile, email];

  @override
  String toString() => "SignUpButtonPressed";
}

class SignUpErrorEvent extends SignUpEvent {
  SignUpErrorEvent({this.error});

  final String error;

  @override
  String toString() => "SignUpErrorEvent {error : $error}";

  @override
  List<Object> get props => [error];
}
