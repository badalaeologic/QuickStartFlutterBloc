import 'package:quick_start_flutter_bloc/networking/models/user_model.dart';

class AuthResponseModel {
  String status;
  String message;
  UserModel data;

  AuthResponseModel({this.status, this.message, this.data});

  AuthResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['staus'];
    message = json['message'];
    data = json['data'] != null ?  UserModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['staus'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}
