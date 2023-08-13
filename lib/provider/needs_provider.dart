// ignore_for_file: prefer_final_fields
import 'package:flutter/material.dart';
import 'package:untitledtest11/data/model/body/needy_model.dart';
import 'package:untitledtest11/data/model/response/needy_list_model.dart';
import '../data/model/response/base/api_response.dart';
import '../data/model/response/base/needoneers_model.dart';
import '../data/model/response/need_model.dart';
import '../data/repository/need_repo.dart';

class NeedsProvider with ChangeNotifier {
  final NeedRepo needRepo;
  NeedsProvider({required this.needRepo});
  double? _lat;
  double? _lng;
  bool _isLoading = false;
  List<NeedsModel>? _needyList;


  double? get lat => _lat;
  double? get lng => _lng;
  bool get isLoading => _isLoading;
  List<NeedsModel>? get needyList => _needyList;


  /// get Needy List
  Future getNeedyList(String? sectionId) async {
    ApiResponse apiResponse = await needRepo.getNeedsList(sectionId!);
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      GetNeedyListModel getNeedyListModel;
      getNeedyListModel = GetNeedyListModel.fromJson(apiResponse.response!.data);
      _needyList = getNeedyListModel.needs;
      print("list000 ======>>>>> ${_needyList!.length}");
      notifyListeners();
    }
  }

  /// Needy Post
  Future Needy(NeedyModel needy, Function callback) async {
    print("lat ====================>>>>>>>>${needy.latitude}");
    _isLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await needRepo.Needy(needy);
    _isLoading = false;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      NeedoneedsData needoneedsData;
      needoneedsData = NeedoneedsData.fromJson(apiResponse.response!.data);
      callback(true,needoneedsData.message.toString());
    }
    else {
      callback(false,"يوجد مشكله يمكنك المحاوله في وقت لاحق");
    }
    notifyListeners();
  }

  void setLatLng(double lat,double lng){
    _lat = lat;
    _lng = lng;
    notifyListeners();
  }

}