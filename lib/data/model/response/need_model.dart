class NeedData {
  String? code;
  String? status;
  String? message;

  NeedData({
    this.message,
    this.code,
    this.status,
  }
      );

  factory NeedData.fromJson(Map<String, dynamic> json) =>NeedData(
    message: json['message'],
    code: json['code'],
    status: json['status'],

  );

  Map<String, dynamic> toJson() =>{
    "message": message,
    "code": code,
    "status": status,

  };

}