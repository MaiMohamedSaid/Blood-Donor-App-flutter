class GetDonorsListModel {
  String? code;
  String? status;
  String? message;
  List<DonorssModel>? needs = [];

  GetDonorsListModel({this.code, this.status, this.message, this.needs});

  factory GetDonorsListModel.fromJson(Map<String, dynamic> json) => GetDonorsListModel(
    code: json['code'],
    status: json['status'],
    message: json['message'],
      needs: List<DonorssModel>.from(json['response'].map((x) => DonorssModel.fromJson(x)),
  )
    );
}
class DonorssModel {
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
  double? longitude;
  double? latitude;
  String? applicationUserId;

  DonorssModel({
    this.id,this.latitude,this.longitude,this.applicationUserId,this.firstName,
    this.lastName,this.phone,this.age,this.bloodType,this.startDate,this.gender,
    this.endDate,this.location,this.chronicDiseases,this.ssn
  });

  factory DonorssModel.fromJson(Map<String, dynamic> json) => DonorssModel (
    id : json['id'],
    ssn : json['ssn'],
    firstName : json['firstName'],
    lastName : json['lastName'],
    age : json['age'],
    bloodType : json['bloodType'],
    gender : json['gender'],
    phone : json['phone'],
    location : json['location'],
    chronicDiseases : json['chronicDiseases'],
    startDate : json['startDate'],
    endDate : json['endDate'],
    longitude : json['longitude'],
    latitude : json['latitude'],
    applicationUserId : json['applicationUserId']
  );
}
