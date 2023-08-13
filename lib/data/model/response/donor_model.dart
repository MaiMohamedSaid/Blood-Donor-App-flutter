class DonorData {
  String? code;
  String? status;
  String? message;
  late List<DonorModel> donors = [];

  DonorData.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    json['response'].forEach((element) {
      donors.add(DonorModel.fromJson(element));
      // response!.add(element);
    });
  }
}

class DonorModel {
  int? id;
  String? ssn;
  String? firstName;
  String? lastName;
  int? age;
  String? bloodType;
  String? gender;
  String? phone;
  String? location;
  String? chronicDiseases;
  String? startDate;
  String? endDate;
  int? longitude;
  int? latitude;
  String? applicationUserId;

  DonorModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
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
}

// class CategoriesModel
// {
//   late bool status;
//   late CategoriesDataModel data;
//
//   CategoriesModel.fromJson(Map <String , dynamic> json)
//   {
//     status = json['status'];
//     data = CategoriesDataModel.fromJson(json['data']);
//   }
// }
//
// class CategoriesDataModel
// {
//   late int current_page;
//   late List <DataModel> data =[];
//
//   CategoriesDataModel.fromJson(Map <String , dynamic> json)
//   {
//     current_page = json['current_page'];
//     json['data'].forEach((element)
//     {
//       data.add(DataModel.fromJson(element));
//     });
//   }
// }
//
// class DataModel
// {
//   late int id;
//   late String name;
//   late String image;
//
//   DataModel.fromJson(Map <String , dynamic> json)
//   {
//     id = json['id'];
//     name = json['name'];
//     image = json['image'];
//   }
// }
