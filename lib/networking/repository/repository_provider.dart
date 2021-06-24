import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:quick_start_flutter_bloc/networking/models/auth_response_model.dart';
import 'package:quick_start_flutter_bloc/networking/models/user_model.dart';
import 'package:quick_start_flutter_bloc/networking/repository/repository.dart';
import 'package:quick_start_flutter_bloc/utils/key_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RepositoryProvider extends Repository {
  RepositoryProvider({this.prefs, this.dio});

  final Dio dio;
  final SharedPreferences prefs;

  @override
  Future<AuthResponseModel> userLogin(Map body) async {
    await Future.delayed(const Duration(milliseconds: 3000));

    UserModel user = UserModel(
        slId: '1',
        name: 'Badal Kumar',
        email: "kbadal001@gmail.com",
        mobile: '7059335546');

    return AuthResponseModel(
        status: 'true', message: 'Login Success', data: user);

    // final response = await dio.post(login, data: jsonEncode(body));
    // logger.i("Login", response.toString());
    // if (response.statusCode == 200) {
    //   final result = AuthResponseModel.fromJson(jsonDecode(response.data));
    //   if (result.status == 'true') {
    //     await saveUserData(result.data);
    //     return result;
    //   }
    //   throw Exception(result.message);
    // }
    // throw Exception(response.statusMessage);
  }

  @override
  Future<AuthResponseModel> signup(Map body) async {
    await Future.delayed(const Duration(milliseconds: 3000));

    UserModel user = UserModel(
        slId: '1',
        name: 'Badal Kumar',
        email: "kbadal001@gmail.com",
        mobile: '7059335546');

    return AuthResponseModel(
        status: 'true', message: 'Sign Up Success', data: user);

    // final response = await dio.post(sign_up, data: jsonEncode(body));
    // logger.i("Signup", response.toString());
    // if (response.statusCode == 200) {
    //   final result = AuthResponseModel.fromJson(jsonDecode(response.data));
    //   if (result.status == 'true') {
    //     await saveUserData(result.data);
    //     return result;
    //   }
    //   throw Exception(result.message);
    // }
    // throw Exception(response.statusMessage);
  }

  @override
  Future<void> saveUserData(userModel) async {
    await prefs.setString(USER_DATA, jsonEncode(userModel));
    return null;
  }

  @override
  Future<void> deleteUser() async {
    await prefs.clear();
    return;
  }

  @override
  UserModel fetchUserData() {
    String userDataString = prefs.getString(USER_DATA);
    Map<String, dynamic> userDataMap = jsonDecode(userDataString);
    return UserModel.fromJson(userDataMap);
  }

  @override
  Future<void> saveAuthToken(String token) async {
    await prefs.setString(AUTH_TOKEN, token);
    return;
  }

  @override
  String fetchAuthToken() {
    return prefs.getString(AUTH_TOKEN);
  }

  @override
  Future<bool> hasToken() async {
    String token = prefs.getString(AUTH_TOKEN);
    return token != null && token != AUTH_TOKEN;
  }
}
