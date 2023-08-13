import 'package:dio/dio.dart';

class MessageModel {
  String? senderId;
  String? reciverId;
  String? content;

  MessageModel({this.reciverId, this.content, this.senderId,});

  MessageModel.fromJson(Map<String, dynamic> json){
  senderId = json['senderId'];
    reciverId = json['reciverId'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() =>
      {
        'senderId': senderId,
        'reciverId': reciverId,
        'content': content,
      };


  FormData toJsonApi() {
    return FormData.fromMap({
      'senderId': senderId,
      'reciverId': reciverId,
      'content': content,
    });
  }

}