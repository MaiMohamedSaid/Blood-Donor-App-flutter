class SectionData {
  String? code;
  String? status;
  String? message;
  List<SectionModel>? sections = [];

  SectionData.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    json['response'].forEach((element) {
      sections!.add(SectionModel.fromJson(element));
      //response!.add(element);
    });
  }
}

class SectionModel {
  int? id;
  String? name;
  String? photo;
  int? order;
  String? donationRequests;
  String? needRequests;

  SectionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    photo = json['photo'];
    order = json['order'];
    donationRequests = json['donationRequests'];
    needRequests = json['needRequests'];
  }
}
