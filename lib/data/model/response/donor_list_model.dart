class GetDonorListModel {
  String? code;
  String? status;
  String? message;
  List<DonoModel>? donors = [];

  GetDonorListModel({this.code, this.status, this.message, this.donors});

  factory GetDonorListModel.fromJson(Map<String, dynamic> json) => GetDonorListModel(
    code: json['code'],
    status: json['status'],
    message: json['message'],
      donors: List<DonoModel>.from(json['response'].map((x) => DonoModel.fromJson(x)),
  )
    );
}

class DonoModel {
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
  int? sectionId;
  String? applicationUserId;

  DonoModel({
    this.id,this.sectionId,this.applicationUserId,this.firstName,
    this.lastName,this.phone,this.age,this.bloodType,this.gender,
    this.location,this.chronicDiseases,this.endDate,this.ssn,this.startDate
  });

  DonoModel.fromJson(Map<String, dynamic> json) {
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
    sectionId = json['sectionId'];
    applicationUserId = json['applicationUserId'];
  }
}

