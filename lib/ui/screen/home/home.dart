import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:quick_start_flutter_bloc/bloc/home/home.dart';
import 'package:quick_start_flutter_bloc/networking/models/user_model.dart';
import 'package:quick_start_flutter_bloc/networking/repository/repository.dart';
import 'package:quick_start_flutter_bloc/ui/screen/home/home_page.dart';

class Home extends StatelessWidget {
  final UserModel userModel;

  Home({this.userModel});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(repository: GetIt.instance<Repository>()),
      child: HomePage(
        userModel: userModel,
      ),
    );
  }
}
