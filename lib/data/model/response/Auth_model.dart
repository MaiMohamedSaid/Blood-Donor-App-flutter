class AuthModel {
  String? message;
  bool? isAuthenticated;
  String? username;
  String? email;
  String? password;
  String? userId;
  List<String>? roles;
  String? token;
  String? expiresOn;
  String? refreshTokenExpiration;

  AuthModel({this.message,
    this.isAuthenticated,
    this.username,
    this.email,
    this.password,
    this.userId,
    this.roles,
    this.token,
    this.expiresOn,
    this.refreshTokenExpiration});

  factory AuthModel.fromJson(Map<String, dynamic> json) =>AuthModel(
    message: json['message'],
    isAuthenticated: json['isAuthenticated'],
    username: json['username'],
    email: json['email'],
    password: json['password'],
    userId: json['userId'],
    roles: json['roles'].cast<String>(),
    token: json['token'],
    expiresOn: json['expiresOn'],
    refreshTokenExpiration: json['refreshTokenExpiration'],
  );

  Map<String, dynamic> toJson() =>{
    "message": message,
    "isAuthenticated": isAuthenticated,
    "username": username,
    "email": email,
    "password": password,
    "userId": userId,
    "roles": roles,
    "token": token,
    "expiresOn": expiresOn,
    "refreshTokenExpiration": refreshTokenExpiration,
  };

}