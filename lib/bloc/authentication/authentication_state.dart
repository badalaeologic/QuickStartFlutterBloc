import 'package:quick_start_flutter_bloc/networking/models/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AuthenticationState extends Equatable {
  const AuthenticationState();
}

class InitialAuthState extends AuthenticationState {
  @override
  List<Object> get props => [];
}

class OptionViewState extends AuthenticationState {
  final int viewType;

  OptionViewState({this.viewType});

  @override
  List<Object> get props => [viewType];

  @override
  String toString() => "OptionViewState";
}

class AuthenticationUninitialized extends AuthenticationState {
  @override
  String toString() => 'AuthenticationUninitialized';

  @override
  List<Object> get props => [];
}

class AuthenticationAuthenticated extends AuthenticationState {

  final UserModel userModel;

  AuthenticationAuthenticated({this.userModel});


  @override
  List<Object> get props => [];

  @override
  String toString() => 'AuthenticationAuthenticated';
}

class AuthenticationPassword extends AuthenticationState {
  @override
  String toString() => 'AuthenticationUnCompleted';

  @override
  List<Object> get props => [];
}




class AuthenticationResetPassword extends AuthenticationState {
  @override
  String toString() => "AuthenticationResetPassword";

  @override
  List<Object> get props => [];
}


class AuthenticationUnauthenticated extends AuthenticationState {
  @override
  String toString() => 'AuthenticationUnauthenticated';

  @override
  List<Object> get props => [];
}

class AuthenticationRegisterState extends AuthenticationState {
  @override
  String toString() => "AuthenticationRegisterState";

  @override
  List<Object> get props => [];
}

class AuthenticationLoading extends AuthenticationState {
  @override
  String toString() => 'AuthenticationLoading';

  @override
  List<Object> get props => [];
}
