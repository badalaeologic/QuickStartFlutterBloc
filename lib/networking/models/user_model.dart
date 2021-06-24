class UserModel {
  String slId;
  String name;
  String email;
  String mobile;

  UserModel({
    this.slId,
    this.name,
    this.email,
    this.mobile,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    slId = json['sl_id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sl_id'] = this.slId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    return data;
  }
}
