// class DonationModel {
//   String? ssn;
//   String? firstName;
//   String? lastName;
//   int? age;
//   String? bloodType;
//   String? gender;
//   String? phone;
//   String? location;
//   String? chronicDiseases;
//   String? startDate;
//   String? endDate;
//   int? sectionId;
//   String? applicationUserId;
//
//   DonationModel({this.ssn,this.firstName,this.lastName,
//     this.age,this.bloodType,this.gender,this.phone,this.location,
//     this.chronicDiseases,this.startDate,this.endDate,
//     this.applicationUserId,this.sectionId});
//
//   DonationModel.fromJson(Map<String, dynamic> json) {
//     ssn = json['ssn'];
//     firstName = json['firstName'];
//     lastName = json['lastName'];
//     age = json['age'];
//     bloodType = json['bloodType'];
//     gender = json['gender'];
//     phone = json['phone'];
//     location = json['location'];
//     chronicDiseases = json['chronicDiseases'];
//     startDate = json['startDate'];
//     endDate = json['endDate'];
//     sectionId = json['sectionId'];
//     applicationUserId = json['applicationUserId'];
//   }
//
//
//   Map<String, dynamic> toJson() =>{
//     'ssn': ssn,
//     'firstName': firstName,
//     'lastName': lastName,
//     'age': age,
//     'bloodType': bloodType,
//     'gender': gender,
//     'phone': phone,
//     'chronicDiseases': chronicDiseases,
//     'startDate': startDate,
//     'endDate': endDate,
//     'sectionId': sectionId,
//     'applicationUserId': applicationUserId,
//   };
//
//   FormData toJsonApi() {
//     return FormData.fromMap({
//       'ssn': this.ssn,
//       'firstName': this.firstName,
//       'lastName': this.lastName,
//       'age': this.age,
//       'phone': this.phone,
//       'chronicDiseases': this.chronicDiseases,
//       'startDate': this.startDate,
//       'endDate': this.endDate,
//       'sectionId': this.sectionId,
//       'applicationUserId': this.applicationUserId,
//     });
//   }
// }
import 'package:dio/dio.dart';

class changePassModel {
  String? email;
  String? currentPassword;
  String? newPassword;
  String? confirmPassword;

  changePassModel({this.email, this.currentPassword, this.newPassword,
    this.confirmPassword});

  changePassModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    currentPassword = json['currentPassword'];
    newPassword = json['newPassword'];
    confirmPassword = json['confirmPassword'];
  }

  Map<String, dynamic> toJson() =>
      {
        'email': email,
        'currentPassword': currentPassword,
        'newPassword': newPassword,
        'confirmPassword': confirmPassword,
      };


  FormData toJsonApi() {
    return FormData.fromMap({
      'email': email,
      'currentPassword': currentPassword,
      'newPassword': newPassword,
      'confirmPassword': confirmPassword,
    });
  }
}
