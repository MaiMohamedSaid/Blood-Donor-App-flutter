class DonaData {
  String? code;
  String? status;
  String? message;

  DonaData({this.message,
    this.code,
    this.status,
  }
    );

  factory DonaData.fromJson(Map<String, dynamic> json) =>DonaData(
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