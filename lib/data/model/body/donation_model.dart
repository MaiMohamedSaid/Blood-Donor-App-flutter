import 'package:dio/dio.dart';

class DonationModel {
  String? ssn;
  String? firstName;
  String? lastName;
  String? age;
  String? bloodType;
  String? gender;
  String? phone;
  String? location;
  String? chronicDiseases;
  String? startDate;
  String? endDate;
  double? longitude;
  double? latitude;
  String? applicationUserId;

  DonationModel({this.ssn,this.firstName,this.lastName,
    this.age,this.bloodType,this.gender,this.phone,this.location,
    this.chronicDiseases,this.startDate,this.endDate,
    this.applicationUserId,this.longitude,this.latitude});

  DonationModel.fromJson(Map<String, dynamic> json) {
    ssn = json['ssn'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    age = json['age'];
    bloodType = json['bloodType'];
    gender = json['gender'];
    phone = json['phone'];
    location = json['location'];
    chronicDiseases = json['chronicDiseases'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    longitude = json['longitude'];
    latitude = json['latitude'];
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
    'location': location,
    'chronicDiseases': chronicDiseases,
    'startDate': startDate,
    'endDate': endDate,
    'latitude': latitude,
    'longitude': longitude,
    'applicationUserId': applicationUserId,
  };

  FormData toJsonApi() {
    return FormData.fromMap({
      'ssn': ssn,
      'firstName': firstName,
      'lastName': lastName,
      'age': age,
      'bloodType': bloodType,
      'gender': gender,
      'phone': phone,
      'location': location,
      'chronicDiseases': chronicDiseases,
      'startDate': startDate,
      'endDate': endDate,
      'longitude': longitude,
      'latitude': latitude,
      'applicationUserId': applicationUserId,
    });
  }
}