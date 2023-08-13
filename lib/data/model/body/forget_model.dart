import 'package:dio/dio.dart';

class ForgetPassModel {
  String? email;

  ForgetPassModel({this.email,});

  ForgetPassModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
  }


  Map<String, dynamic> toJson() =>{
    'email': email,
  };

  FormData toJsonApi() {
    return FormData.fromMap({
      'email': email,
    });
  }
}