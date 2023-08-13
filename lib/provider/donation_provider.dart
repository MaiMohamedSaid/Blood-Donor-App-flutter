// ignore_for_file: prefer_final_fields
import 'package:flutter/material.dart';
import '../data/model/body/map_model.dart';
import '../data/model/response/base/api_response.dart';
import '../data/model/body/donation_model.dart';
import '../data/model/response/donationres_model.dart';
import '../data/model/response/doonors_list_model.dart';
import '../data/model/response/map_response_model.dart';
import '../data/repository/donar_repo.dart';

class DonationProvider with ChangeNotifier {
  final DonarRepo donarRepo;
  DonationProvider({required this.donarRepo});

  bool _isLoading = false;
  double? _lat;
  double? _lng;
  int _countVal = 0;
  // List<DonorModel>? _donationList = [];
  MapUserModel? _usermap;
  List<DonorssModel>? _donorsList;


  MapUserModel? get usermap => _usermap;
  bool get isLoading => _isLoading;
  double? get lat => _lat;
  double? get lng => _lng;
  int? get countVal => _countVal;
  List<DonorssModel>? get donorsList => _donorsList;

  /// get Donors List
  Future getDonorsList() async {
    ApiResponse apiResponse = await donarRepo.getDonation();
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      GetDonorsListModel getDonorsListModel;
      getDonorsListModel = GetDonorsListModel.fromJson(apiResponse.response!.data);
      _donorsList = getDonorsListModel.needs;
      print("list000 ======>>>>> ${_donorsList!.length}");
      notifyListeners();
    }
  }

  // /// get Donation
  // Future getDonation() async {
  //   ApiResponse apiResponse = await donarRepo.getDonation();
  //   if (apiResponse.response != null &&
  //       apiResponse.response!.statusCode == 200) {
  //     DonorData donorData;
  //     donorData = DonorData.fromJson(apiResponse.response!.data);
  //     _donationList = donorData.donors;
  //     // print("list000 ======>>>>> ${_donationList!.length}");
  //     notifyListeners();
  //   }
  // }

  /// Donation
  Future donation(DonationModel donor, Function callback) async {
    print("lat ====================>>>>>>>>${donor.latitude}");
    _isLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await donarRepo.donation(donor);
    _isLoading = false;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      DonaData donaData;
      donaData = DonaData.fromJson(apiResponse.response!.data);
      callback(true,donaData.message.toString());
    }
    else {
      callback(false,"You cannot add a donar request while you have a need request.!");
    }
    notifyListeners();
  }

  /// Map
  Future LatLon(MapModel usermap) async {
    print("lat1111111111 ====================>>>>>>>>${usermap.l1}");
    print("lon1111111111 ====================>>>>>>>>${usermap.l2}");
    print("curr1111111111 ====================>>>>>>>>${usermap.curr}");
    _isLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await donarRepo.latLon(usermap);
    _isLoading = false;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      _usermap = MapUserModel.fromJson(apiResponse.response!.data);
    }
    else {

    }
    notifyListeners();
  }


  void setLatLng(double lat,double lng){
    _lat = lat;
    _lng = lng;
    notifyListeners();
  }

  Future<void> incrementCounter()async {
    _countVal++;
    notifyListeners();

  }
}
