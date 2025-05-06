import 'package:queezy/common/common.dart'; // Ensure baseUrl is defined here

class AuthModel {
  int? success;
  String? token;
  String? refreshToken;
  Data? data;

  AuthModel({this.success, this.token, this.refreshToken, this.data});

  AuthModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    token = json['token'];
    refreshToken = json['refresh_token'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['success'] = success;
    data['token'] = token;
    data['refresh_token'] = refreshToken;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? email;
  String? avatar;
  String? createdAt;

  Data({this.id, this.name, this.email, this.avatar, this.createdAt});

  static String? _localPathFromJson(String? image) {
    if (image == null) return null;

    if (image.startsWith("http")) return image;
    
    return "${baseUrl.replaceAll(RegExp(r'/+$'), '')}/$image";
  }

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    avatar = _localPathFromJson(json['avatar']); 
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['avatar'] = avatar;
    data['createdAt'] = createdAt;
    return data;
  }
}
