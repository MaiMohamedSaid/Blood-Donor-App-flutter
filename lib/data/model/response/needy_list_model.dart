class GetNeedyListModel {
  String? code;
  String? status;
  String? message;
  List<NeedsModel>? needs = [];

  GetNeedyListModel({this.code, this.status, this.message, this.needs});

  factory GetNeedyListModel.fromJson(Map<String, dynamic> json) => GetNeedyListModel(
    code: json['code'],
    status: json['status'],
    message: json['message'],
      needs: List<NeedsModel>.from(json['response'].map((x) => NeedsModel.fromJson(x)),
  )
    );
}

class NeedsModel {
  int? id;
  String? ssn;
  String? firstName;
  String? lastName;
  int? age;
  String? bloodType;
  String? gender;
  String? phone;
  String? location;
  String? hospitalReport;
  int? quantity;
  String? date;
  double? longitude;
  double? latitude;
  int? sectionId;
  String? applicationUserId;

  NeedsModel({
    this.id,this.sectionId,this.applicationUserId,this.firstName,
    this.lastName,this.phone,this.age,this.bloodType,this.date,this.gender,
    this.hospitalReport,this.location,this.quantity,this.ssn,this.latitude,this.longitude
});

  factory NeedsModel.fromJson(Map<String, dynamic> json) => NeedsModel(
    id: json['id'],
    ssn: json['ssn'],
    firstName: json['firstName'],
    lastName: json['lastName'],
    age: json['age'],
    bloodType: json['bloodType'],
    gender: json['gender'],
    phone: json['phone'],
    location: json['location'],
    hospitalReport: json['hospitalReport'],
    latitude: json['latitude'],
    longitude: json['longitude'],
    quantity: json['quantity'],
    date: json['date'],
    sectionId: json['sectionId'],
    applicationUserId: json['applicationUserId'],
  );
}
