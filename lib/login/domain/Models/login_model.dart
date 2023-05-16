// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  final bool status;
  final Data data;
  final String message;

  LoginModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    status: json["status"],
    data: Data.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
    "message": message,
  };
}

class Data {
  final String name;
  final String email;
  final String profile;
  final String id;
  final String userId;
  final String mobile;
  final String accessToken;
  final bool isDealer;

  Data({
    required this.name,
    required this.email,
    required this.profile,
    required this.id,
    required this.userId,
    required this.mobile,
    required this.accessToken,
    required this.isDealer,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    name: json["name"],
    email: json["email"],
    profile: json["profile"],
    id: json["id"],
    userId: json["user_id"],
    mobile: json["mobile"],
    accessToken: json["access_token"],
    isDealer: json["isDealer"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "profile": profile,
    "id": id,
    "user_id": userId,
    "mobile": mobile,
    "access_token": accessToken,
    "isDealer": isDealer,
  };
}
