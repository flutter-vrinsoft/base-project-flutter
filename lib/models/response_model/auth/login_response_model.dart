import 'package:base_project_flutter/export.dart';

class LoginResponseModel extends Serializable {
  LoginResponseModel({
    this.userId,
    this.userType,
    this.accessToken,
    this.tokenType,
  });

  LoginResponseModel.fromJson(dynamic json) {
    userId = json['user_id'];
    userType = json['user_type'];
    accessToken = json['access_token'];
    tokenType = json['token_type'];
  }

  String? userId;
  String? userType;
  String? accessToken;
  String? tokenType;

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = userId;
    map['user_type'] = userType;
    map['access_token'] = accessToken;
    map['token_type'] = tokenType;
    return map;
  }
}
