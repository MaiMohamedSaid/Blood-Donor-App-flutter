class AllData {
  int? count;
  late List<DataF>? dataf;

  AllData({
    this.count,
    this.dataf,
  });

  factory AllData.fromJson(Map<String, dynamic> json) => AllData(
      count: json['count'],
      dataf: List<DataF>.from(
        json['data'].map((x) => DataF.fromJson(x)),
      ));
}

class DataF {
  String? firstName;
  String? lastName;
  List<RefreshTokens>? refreshTokens;
  String? donationRequests;
  String? needRequests;
  String? messageSent;
  List<MessageRecived>? messageRecived;
  String? id;
  String? userName;
  String? normalizedUserName;
  String? email;
  String? normalizedEmail;
  bool? emailConfirmed;
  String? passwordHash;
  String? securityStamp;
  String? concurrencyStamp;
  String? phoneNumber;
  bool? phoneNumberConfirmed;
  bool? twoFactorEnabled;
  String? lockoutEnd;
  bool? lockoutEnabled;
  int? accessFailedCount;

  DataF(
      {this.id,
      this.lastName,
      this.firstName,
      this.userName,
      this.email,
      this.accessFailedCount,
      this.concurrencyStamp,
      this.donationRequests,
      this.emailConfirmed,
      this.lockoutEnabled,
      this.lockoutEnd,
      this.needRequests,
      this.normalizedEmail,
      this.normalizedUserName,
      this.passwordHash,
      this.phoneNumber,
      this.phoneNumberConfirmed,
      this.securityStamp,
      this.twoFactorEnabled});

  DataF.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    if (json['refreshTokens'] != null) {
      refreshTokens = <RefreshTokens>[];
      json['refreshTokens'].forEach((v) {
        refreshTokens!.add(new RefreshTokens.fromJson(v));
      });
    }
    donationRequests = json['donationRequests'];
    needRequests = json['needRequests'];
    messageSent = json['messageSent'];
    if (json['messageRecived'] != null) {
      messageRecived = <MessageRecived>[];
      json['messageRecived'].forEach((v) {
        messageRecived!.add(new MessageRecived.fromJson(v));
      });
    }
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

class MessageRecived {
  int? id;
  String? content;
  String? senderId;
  Sender? sender;
  String? reciverId;

  MessageRecived.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
    senderId = json['senderId'];
    sender =
        json['sender'] != null ? new Sender.fromJson(json['sender']) : null;
    reciverId = json['reciverId'];
  }
}

class Sender {
  String? firstName;
  String? lastName;
  List<RefreshTokens>? refreshTokens;
  Null? donationRequests;
  Null? needRequests;
  List<MessageSent>? messageSent = [];
  List<MessageRecived>? messageRecived = [];
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

  Sender.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    if (json['refreshTokens'] != null) {
      refreshTokens = <RefreshTokens>[];
      json['refreshTokens'].forEach((v) {
        refreshTokens!.add(new RefreshTokens.fromJson(v));
      });
    }
    donationRequests = json['donationRequests'];
    needRequests = json['needRequests'];
    if (json['messageSent'] != null) {
      messageSent = <MessageSent>[];
      json['messageSent'].forEach((v) {
        messageSent!.add(new MessageSent.fromJson(v));
      });
    }
    if (json['messageRecived'] != null) {
      messageRecived = <MessageRecived>[];
      json['messageRecived'].forEach((v) {
        messageRecived!.add(new MessageRecived.fromJson(v));
      });
    }
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

class MessageSent {
  int? id;
  String? content;
  String? senderId;
  String? reciverId;

  MessageSent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
    senderId = json['senderId'];
    reciverId = json['reciverId'];
  }
}
