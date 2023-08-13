import 'package:dio/dio.dart';

class MapModel {
  double? l1;
  double? l2;
  int? curr;
  String? BT;
  int? DT;

  MapModel({this.l1,this.l2,this.curr,this.BT, this.DT});

  MapModel.fromJson(Map<String, dynamic> json) {
    l1 = json['l1'];
    l2 = json['l2'];
    curr = json['curr'];
    BT = json['BT'];
    DT = json['DT'];
  }


  Map<String, dynamic> toJson() =>{
    'l1': l1,
    'l2': l2,
    'curr': curr,
    'BT': BT,
    'DT': DT,
  };

  FormData toJsonApi() {
    return FormData.fromMap({
      'l1': l1,
      'l2': l2,
      'curr': curr,
      'BT': BT,
      'DT': DT,
    });
  }
}