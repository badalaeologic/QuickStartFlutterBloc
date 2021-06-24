import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SignUpState extends Equatable {
  const SignUpState();
}

class InitialSignUpState extends SignUpState {
  @override
  String toString() => 'InitialSignUpState';

  @override
  List<Object> get props => [];
}

class LoadingState extends SignUpState {
  final String title;
  final String message;

  LoadingState({this.title, this.message});

  @override
  String toString() => 'LoadingState';

  @override
  List<Object> get props => [title, message];
}

class SignUpFailureState extends SignUpState {
  final String error;

  SignUpFailureState({@required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'SignUpFailure { error: $error }';
}
