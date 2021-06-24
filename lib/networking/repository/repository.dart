import 'package:quick_start_flutter_bloc/networking/models/auth_response_model.dart';
import 'package:quick_start_flutter_bloc/networking/models/user_model.dart';

abstract class Repository {
  Future<AuthResponseModel> userLogin(Map body);

  Future<AuthResponseModel> signup(Map body);

  Future<void> saveUserData(UserModel userModel);

  UserModel fetchUserData();

  Future<void> deleteUser();

  Future<void> saveAuthToken(String token);

  Future<bool> hasToken();

  String fetchAuthToken();
}
