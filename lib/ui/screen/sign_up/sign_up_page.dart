import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:quick_start_flutter_bloc/bloc/sign_up/sign_up.dart';
import 'package:quick_start_flutter_bloc/networking/repository/repository.dart';
import 'package:quick_start_flutter_bloc/ui/screen/sign_up/sign_up_form.dart';
import 'package:quick_start_flutter_bloc/ui/widgets/loading/loading_widget.dart';
import 'package:quick_start_flutter_bloc/utils/helper.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignUpBloc>(
      create: (context) => SignUpBloc(repository: GetIt.instance<Repository>()),
      child: Scaffold(
        body: BlocListener<SignUpBloc, SignUpState>(
          listener: (context, state) {
            if (state is SignUpFailureState) {
              onWidgetDidBuild(
                () {
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "${state.error}",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400),
                      ),
                      backgroundColor: Colors.red,
                    ),
                  );
                },
              );
            }
          },
          child: BlocBuilder<SignUpBloc, SignUpState>(
            builder: (context, state) {
              if (state is LoadingState) {
                return LoadingWidget(
                  title: state.title,
                  message: state.message,
                );
              }

              if (state is InitialSignUpState) {
                return SignUpForm();
              }

              return Container();
            },
          ),
        ),
      ),
    );
  }
}
