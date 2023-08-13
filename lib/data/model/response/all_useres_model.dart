class MainModel {

  late List<Data> data = [];

  MainModel.fromJson(Map<String, dynamic> json) {
    json['data'].forEach((element)
    {
      data.add(Data.fromJson(element));
      // response!.add(element);
    });
  }

}

// class Data {
//   String? firstName;
//   String? lastName;
//   late List<RefreshTokens> refreshTokens = [];
//   String? donationRequests;
//   String? needRequests;
//   String? messageSent;
//   String? messageRecived;
//   String? id;
//   String? userName;
//   String? normalizedUserName;
//   String? email;
//   String? normalizedEmail;
//   bool? emailConfirmed;
//   String? passwordHash;
//   String? securityStamp;
//   String? concurrencyStamp;
//   String? phoneNumber;
//   bool? phoneNumberConfirmed;
//   bool? twoFactorEnabled;
//   Null? lockoutEnd;
//   bool? lockoutEnabled;
//   int? accessFailedCount;
//
//
//   Data.fromJson(Map<String, dynamic> json) {
//     firstName = json['firstName'];
//     lastName = json['lastName'];
//     json['refreshTokens'].forEach((element)
//     {
//       refreshTokens.add(RefreshTokens.fromJson(element));
//       // response!.add(element);
//     });
//     donationRequests = json['donationRequests'];
//     needRequests = json['needRequests'];
//     messageSent = json['messageSent'];
//     messageRecived = json['messageRecived'];
//     id = json['id'];
//     userName = json['userName'];
//     normalizedUserName = json['normalizedUserName'];
//     email = json['email'];
//     normalizedEmail = json['normalizedEmail'];
//     emailConfirmed = json['emailConfirmed'];
//     passwordHash = json['passwordHash'];
//     securityStamp = json['securityStamp'];
//     concurrencyStamp = json['concurrencyStamp'];
//     phoneNumber = json['phoneNumber'];
//     phoneNumberConfirmed = json['phoneNumberConfirmed'];
//     twoFactorEnabled = json['twoFactorEnabled'];
//     lockoutEnd = json['lockoutEnd'];
//     lockoutEnabled = json['lockoutEnabled'];
//     accessFailedCount = json['accessFailedCount'];
//   }
//
// }
//
// class RefreshTokens {
//   String? token;
//   String? expiresOn;
//   bool? isExpired;
//   String? createdOn;
//   Null? revokedOn;
//   bool? isActive;
//
//   RefreshTokens(
//       {this.token,
//         this.expiresOn,
//         this.isExpired,
//         this.createdOn,
//         this.revokedOn,
//         this.isActive});
//
//   RefreshTokens.fromJson(Map<String, dynamic> json) {
//     token = json['token'];
//     expiresOn = json['expiresOn'];
//     isExpired = json['isExpired'];
//     createdOn = json['createdOn'];
//     revokedOn = json['revokedOn'];
//     isActive = json['isActive'];
//   }
//
// }

class Data {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? userName;
  Null? photo;



  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    userName = json['userName'];
    photo = json['photo'];
  }

}
// class Data {
//   String? id;
//   String? firstName;
//   String? lastName;
//   String? email;
//   String? userName;
//   Null? photo;
//
//
//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     firstName = json['firstName'];
//     lastName = json['lastName'];
//     email = json['email'];
//     userName = json['userName'];
//     photo = json['photo'];
//   }
//
// }