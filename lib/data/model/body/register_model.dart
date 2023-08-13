import 'package:dio/dio.dart';

class RegisterModel {
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? username;

  RegisterModel({this.firstName,this.lastName,this.email,
    this.password,this.username});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    username = json['username'];
    password = json['password'];
  }


  Map<String, dynamic> toJson() =>{
    'firstName': firstName,
    'lastName': lastName,
    'email': email,
    'username': username,
    'password': password,
  };

  FormData toJsonApi() {
    return FormData.fromMap({
      'firstName': this.firstName,
      'lastName': this.lastName,
      'email': this.email,
      'username': this.username,
      'password': this.password,
    });
  }
}