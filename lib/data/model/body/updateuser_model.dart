import 'dart:core';
import 'package:dio/dio.dart';

class EditUser {
   String? firstName;
   String? lastName;
   String? email;
   String? userName;
   String? applicationUserId;


   EditUser({this.email,this.firstName,this.lastName,this.userName});

   EditUser.fromJson(Map<String, dynamic> json) {
     email = json['email'];
    firstName = json['firstName'];
    lastName = json['lastName'];
     userName = json['userName'];
     applicationUserId = json['applicationUserId'];
  }


  Map<String, dynamic> toJson() =>{
    'email': email,
    'firstName': firstName,
    'lastName': lastName,
    'userName': userName,
    'applicationUserId': applicationUserId,
  };

  FormData toJsonApi() {
    return FormData.fromMap({
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'userName': userName,
      'applicationUserId': applicationUserId,
    });
  }
}