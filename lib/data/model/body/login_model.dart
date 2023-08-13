// ignore_for_file: prefer_collection_literals, unnecessary_this
import 'package:dio/dio.dart';
class LoginModel {
  String? email;
  String? password;

  LoginModel({
    this.email,
    this.password,
  });

  LoginModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() =>{
    "email": email,
    "password": password,
  };

  FormData toJsonApi() {
    return FormData.fromMap({
      "email": this.email,
      "password": this.password,
    });
  }
}