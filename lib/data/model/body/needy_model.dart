import 'package:dio/dio.dart';

class NeedyModel {
  String? ssn;
  String? firstName;
  String? lastName;
  String? age;
  String? bloodType;
  String? gender;
  String? phone;
  String? location;
  String? hospitalReport;
  String? quantity;
  String? date;
  double? longitude;
  double? latitude;
  int? sectionId;
  String? applicationUserId;

  NeedyModel({this.ssn,this.firstName,this.lastName,
    this.age,this.bloodType,this.gender,this.phone,this.location,
    this.hospitalReport,this.date,this.quantity,
    this.applicationUserId,this.sectionId,this.latitude,this.longitude});

  NeedyModel.fromJson(Map<String, dynamic> json) {
    ssn = json['ssn'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    age = json['age'];
    bloodType = json['bloodType'];
    gender = json['gender'];
    phone = json['phone'];
    location = json['location'];
    hospitalReport = json['hospitalReport'];
    date = json['date'];
    quantity = json['quantity'];
    sectionId = json['sectionId'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    applicationUserId = json['applicationUserId'];
  }


  Map<String, dynamic> toJson() =>{
    'ssn': ssn,
    'firstName': firstName,
    'lastName': lastName,
    'age': age,
    'bloodType': bloodType,
    'gender': gender,
    'phone': phone,
    'hospitalReport': hospitalReport,
    'date': date,
    'quantity': quantity,
    'location': location,
    'longitude': longitude,
    'latitude': latitude,
    'sectionId': sectionId,
    'applicationUserId': applicationUserId,
  };

  FormData toJsonApi() {
    return FormData.fromMap({
      'ssn': ssn,
      'firstName': firstName,
      'lastName': lastName,
      'age': age,
      'gender': gender,
      'bloodType': bloodType,
      'phone': phone,
      'hospitalReport': hospitalReport,
      'date': date,
      'location': location,
      'latitude': latitude,
      'longitude': longitude,
      'quantity': quantity,
      'sectionId': sectionId,
      'applicationUserId': applicationUserId,
    });
  }
}