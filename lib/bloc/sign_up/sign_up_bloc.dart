import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:quick_start_flutter_bloc/bloc/authentication/authentication.dart';
import 'package:quick_start_flutter_bloc/bloc/validators.dart';
import 'package:quick_start_flutter_bloc/networking/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

import 'sign_up.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc({this.repository, this.showPasswordForm})
      : super(InitialSignUpState());

  final Repository repository;
  final bool showPasswordForm;

  final _mobileController = BehaviorSubject<dynamic>();
  final _nameController = BehaviorSubject<dynamic>();
  final _emailController = BehaviorSubject<dynamic>();
  final _passwordController = BehaviorSubject<dynamic>();

  Stream<dynamic> get mobile => _mobileController.stream;

  Stream<dynamic> get name => _nameController.stream;

  Stream<dynamic> get email =>
      _emailController.stream.transform(Validators.validateEmail);

  Stream<dynamic> get validPassword =>
      _passwordController.stream.transform(Validators.validSignPassword);

  Function(dynamic) get changeMobile => _mobileController.sink.add;

  Function(dynamic) get changeName => _nameController.sink.add;

  Function(dynamic) get changeEmail => _emailController.sink.add;

  Function(dynamic) get changePassword => _passwordController.sink.add;

  @override
  void onTransition(Transition<SignUpEvent, SignUpState> transition) {
    print(transition);
    super.onTransition(transition);
  }

  void onLoginPage() {
    GetIt.instance<AuthenticationBloc>().add(LogInEvent());
  }

  @override
  SignUpState get initialState {
    return InitialSignUpState();
  }

  onSignUpSubmit() {
    final name = _nameController.value;
    final email = _emailController.value;
    final mobile = _mobileController.value;
    final password = _passwordController.value;

    if (name == null || name.isEmpty) {
      add(SignUpErrorEvent(error: "Please enter valid name"));
      return;
    }

    if (email == null || email.isEmpty) {
      add(SignUpErrorEvent(error: "Please enter valid email"));
      return;
    }

    if (mobile == null || mobile.isEmpty) {
      add(SignUpErrorEvent(error: "Please enter valid mobile number"));
      return;
    }

    if (password == null && password.isEmpty) {
      add(SignUpErrorEvent(error: "Please enter valid password"));
      return;
    }

    add(SignUpButtonPressedEvent(
      name: "$name",
      email: "$email",
      mobile: "$mobile",
      password: "$password",
    ));
  }

  @override
  Stream<SignUpState> mapEventToState(SignUpEvent event) async* {
    if (event is SignUpButtonPressedEvent) {
      final String message = "";
      yield LoadingState(title: "Please wait...", message: message);

      try {
        final map = {
          "name": event.name != null ? event.name.toString().trim() : "",
          "email": event.email != null ? event.email.toString().trim() : "",
          "mobile": event.mobile != null ? event.mobile.toString().trim() : "",
          "password":
              event.password != null ? event.password.toString().trim() : "",
          "device_id": "",
          "pushToken": "token"
        };
        final response = await repository.signup(map);
        GetIt.instance<AuthenticationBloc>().add(
          LoggedIn(token: response.data.slId, user: response.data),
        );
      } catch (e) {
        yield SignUpFailureState(error: e.message);
        yield InitialSignUpState();
      }
    }

    if (event is SignUpErrorEvent) {
      yield SignUpFailureState(error: event.error);
      yield InitialSignUpState();
    }
  }

  @override
  Future<void> close() {
    _nameController.close();
    _mobileController.close();
    _emailController.close();
    _passwordController.close();
    return super.close();
  }
}
