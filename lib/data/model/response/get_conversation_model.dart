class ConversationData {
  int? id;
  String? content;
  String? senderId;
  Sender? sender;
  String? reciverId;
  Reciver? reciver;


  ConversationData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
    senderId = json['senderId'];
    sender =
    json['sender'] != null ? new Sender.fromJson(json['sender']) : null;
    reciverId = json['reciverId'];
    reciver =
    json['reciver'] != null ? new Reciver.fromJson(json['reciver']) : null;
  }
}

class Sender {
  String? firstName;
  String? lastName;
  List<RefreshTokens>? refreshTokens;
  dynamic donationRequests;
  dynamic needRequests;
  List<MessageSent>? messageSent;
  dynamic messageRecived;
  String? id;
  String? userName;
  String? normalizedUserName;
  String? email;
  String? normalizedEmail;
  bool? emailConfirmed;
  String? passwordHash;
  String? securityStamp;
  String? concurrencyStamp;
  dynamic phoneNumber;
  bool? phoneNumberConfirmed;
  bool? twoFactorEnabled;
  dynamic lockoutEnd;
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
  dynamic revokedOn;
  bool? isActive;

  RefreshTokens(
      {this.token,
        this.expiresOn,
        this.isExpired,
        this.createdOn,
        this.revokedOn,
        this.isActive});

  RefreshTokens.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    expiresOn = json['expiresOn'];
    isExpired = json['isExpired'];
    createdOn = json['createdOn'];
    revokedOn = json['revokedOn'];
    isActive = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['expiresOn'] = this.expiresOn;
    data['isExpired'] = this.isExpired;
    data['createdOn'] = this.createdOn;
    data['revokedOn'] = this.revokedOn;
    data['isActive'] = this.isActive;
    return data;
  }
}

class MessageSent {
  int? id;
  String? content;
  String? senderId;
  String? reciverId;
  Reciver? reciver;

  MessageSent(
      {this.id, this.content, this.senderId, this.reciverId, this.reciver});

  MessageSent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
    senderId = json['senderId'];
    reciverId = json['reciverId'];
    reciver =
    json['reciver'] != null ? new Reciver.fromJson(json['reciver']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['content'] = this.content;
    data['senderId'] = this.senderId;
    data['reciverId'] = this.reciverId;
    if (this.reciver != null) {
      data['reciver'] = this.reciver!.toJson();
    }
    return data;
  }
}

class Reciver {
  String? firstName;
  String? lastName;
  List<RefreshTokens>? refreshTokens;
  dynamic donationRequests;
  dynamic needRequests;
  dynamic messageSent;
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
  dynamic phoneNumber;
  bool? phoneNumberConfirmed;
  bool? twoFactorEnabled;
  dynamic lockoutEnd;
  bool? lockoutEnabled;
  int? accessFailedCount;

  Reciver(
      {this.firstName,
        this.lastName,
        this.refreshTokens,
        this.donationRequests,
        this.needRequests,
        this.messageSent,
        this.messageRecived,
        this.id,
        this.userName,
        this.normalizedUserName,
        this.email,
        this.normalizedEmail,
        this.emailConfirmed,
        this.passwordHash,
        this.securityStamp,
        this.concurrencyStamp,
        this.phoneNumber,
        this.phoneNumberConfirmed,
        this.twoFactorEnabled,
        this.lockoutEnd,
        this.lockoutEnabled,
        this.accessFailedCount});

  Reciver.fromJson(Map<String, dynamic> json) {
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    if (this.refreshTokens != null) {
      data['refreshTokens'] =
          this.refreshTokens!.map((v) => v.toJson()).toList();
    }
    data['donationRequests'] = this.donationRequests;
    data['needRequests'] = this.needRequests;
    data['messageSent'] = this.messageSent;
    if (this.messageRecived != null) {
      data['messageRecived'] =
          this.messageRecived!.map((v) => v.toJson()).toList();
    }
    data['id'] = this.id;
    data['userName'] = this.userName;
    data['normalizedUserName'] = this.normalizedUserName;
    data['email'] = this.email;
    data['normalizedEmail'] = this.normalizedEmail;
    data['emailConfirmed'] = this.emailConfirmed;
    data['passwordHash'] = this.passwordHash;
    data['securityStamp'] = this.securityStamp;
    data['concurrencyStamp'] = this.concurrencyStamp;
    data['phoneNumber'] = this.phoneNumber;
    data['phoneNumberConfirmed'] = this.phoneNumberConfirmed;
    data['twoFactorEnabled'] = this.twoFactorEnabled;
    data['lockoutEnd'] = this.lockoutEnd;
    data['lockoutEnabled'] = this.lockoutEnabled;
    data['accessFailedCount'] = this.accessFailedCount;
    return data;
  }
}

class MessageRecived {
  int? id;
  String? content;
  String? senderId;
  String? reciverId;

  MessageRecived({this.id, this.content, this.senderId, this.reciverId});

  MessageRecived.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
    senderId = json['senderId'];
    reciverId = json['reciverId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['content'] = this.content;
    data['senderId'] = this.senderId;
    data['reciverId'] = this.reciverId;
    return data;
  }
}