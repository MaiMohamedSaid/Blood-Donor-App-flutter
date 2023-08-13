class NeedoneedsData {
  String? code;
  String? status;
  String? message;
  Response? response;

  NeedoneedsData({this.code, this.status, this.message, this.response});

  NeedoneedsData.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    response = json['response'] != null
        ?  Response.fromJson(json['response'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.response != null) {
      data['response'] = this.response!.toJson();
    }
    return data;
  }
}

class Response {
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

  Response(
      {this.id,
        this.ssn,
        this.firstName,
        this.lastName,
        this.age,
        this.bloodType,
        this.gender,
        this.phone,
        this.location,
        this.hospitalReport,
        this.quantity,
        this.date,
        this.longitude,
        this.latitude,
        this.sectionId,
        this.applicationUserId});

  Response.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ssn = json['ssn'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    age = json['age'];
    bloodType = json['bloodType'];
    gender = json['gender'];
    phone = json['phone'];
    location = json['location'];
    hospitalReport = json['hospitalReport'];
    quantity = json['quantity'];
    date = json['date'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    sectionId = json['sectionId'];
    applicationUserId = json['applicationUserId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['ssn'] = this.ssn;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['age'] = this.age;
    data['bloodType'] = this.bloodType;
    data['gender'] = this.gender;
    data['phone'] = this.phone;
    data['location'] = this.location;
    data['hospitalReport'] = this.hospitalReport;
    data['quantity'] = this.quantity;
    data['date'] = this.date;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['sectionId'] = this.sectionId;
    data['applicationUserId'] = this.applicationUserId;
    return data;
  }
}