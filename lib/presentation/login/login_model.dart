class LoginModel {
  Data? data;
  String? message;
  String? token;
  bool? success;

  LoginModel({this.data, this.message, this.token, this.success});

  LoginModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
    token = json['token'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    data['token'] = token;
    data['success'] = success;
    return data;
  }
}

class Data {
  String? name;
  String? email;
  String? role;

  Data({this.name, this.email, this.role});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['role'] = role;
    return data;
  }
}
