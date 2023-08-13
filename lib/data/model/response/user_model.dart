class UserDataModel {
  String? code;
  String? status;
  String? message;
  PersonalData? personalData;

  UserDataModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    personalData = json['response'] != null
        ? PersonalData.fromJson(json['response'])
        : null;
  }

}

class PersonalData {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? userName;
  String? photo;


  PersonalData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    userName = json['userName'];
    photo = json['photo'];
  }


}