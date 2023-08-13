class UpdateUserDataModel {
  String? code;
  String? status;
  String? message;
  ResponseData? responseData;


  UpdateUserDataModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    responseData = json['response'] != null
        ? ResponseData.fromJson(json['response'])
        : null;
  }

}

class ResponseData {
  String? firstName;
  String? lastName;
  String? photo;
  List<RefreshTokens>? refreshTokens = [];
  Null? donationRequests;
  Null? needRequests;
  Null? messageSent;
  Null? messageRecived;
  String? id;
  String? userName;
  String? normalizedUserName;
  String? email;
  String? normalizedEmail;
  bool? emailConfirmed;
  String? passwordHash;
  String? securityStamp;
  String? concurrencyStamp;
  Null? phoneNumber;
  bool? phoneNumberConfirmed;
  bool? twoFactorEnabled;
  Null? lockoutEnd;
  bool? lockoutEnabled;
  int? accessFailedCount;

  ResponseData.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    photo = json['photo'];
    if (json['refreshTokens'] != null) {
      refreshTokens = <RefreshTokens>[];
      json['refreshTokens'].forEach((v) {
        refreshTokens!.add(RefreshTokens.fromJson(v));
      });
    }
    donationRequests = json['donationRequests'];
    needRequests = json['needRequests'];
    messageSent = json['messageSent'];
    messageRecived = json['messageRecived'];
    id = json['id'];
    userName = json['userName'];
    normalizedUserName = json['normalizedUserName'];
    email = json['email'];
    normalizedEmail = json['normalizedEmail'];
    emailConfirmed = json['emailConfirmed'];
    passwordHash = json['passwordHash'];
    securityStamp = json['securityStamp'];
    concurrencyStamp = json['concurrencyStamp'];
    phoneNumber = json['phoneNumber'];
    phoneNumberConfirmed = json['phoneNumberConfirmed'];
    twoFactorEnabled = json['twoFactorEnabled'];
    lockoutEnd = json['lockoutEnd'];
    lockoutEnabled = json['lockoutEnabled'];
    accessFailedCount = json['accessFailedCount'];
  }

}

class RefreshTokens {
  String? token;
  String? expiresOn;
  bool? isExpired;
  String? createdOn;
  Null? revokedOn;
  bool? isActive;

  RefreshTokens.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    expiresOn = json['expiresOn'];
    isExpired = json['isExpired'];
    createdOn = json['createdOn'];
    revokedOn = json['revokedOn'];
    isActive = json['isActive'];
  }

}