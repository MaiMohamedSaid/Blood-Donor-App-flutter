// ignore_for_file: use_rethrow_when_possible, unnecessary_null_in_if_null_operators, await_only_futures, avoid_function_literals_in_foreach_calls
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../util/app_constants.dart';
import '../dataSource/remote/dio/dio_client.dart';
import '../dataSource/remote/exception/api_error_handler.dart';
import '../model/body/map_model.dart';
import '../model/response/base/api_response.dart';
import '../model/body/donation_model.dart';

class DonarRepo {
  final DioClient dioClient;
  final SharedPreferences sharedPreferences;
  DonarRepo({required this.dioClient, required this.sharedPreferences});

  ///get Donation
  Future<ApiResponse> getDonation() async {
    try {
      Response response = await dioClient.get(
          AppConstants.DONORREQUEST_Url
      );
      return ApiResponse.withSuccess(response);
    } on DioException catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  ///Donation
  Future<ApiResponse> donation(DonationModel donor) async {
    // dioClient.updateHeaderDon();
    try {
      Response response = await dioClient.post(
        AppConstants.DONORPOST_Url,
        data: donor.toJson(),
      );
      return ApiResponse.withSuccess(response);
    }
    on DioException catch (e) {
      print("ero0000000r================>>>>>> ${e.error}");
      print("ero0000000r================>>>>>> ${e.message}");
      print("ero0000000r================>>>>>> ${e.response}");
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
  ///LatLan
  Future<ApiResponse> latLon(MapModel usermap) async {
    try {
      Response response = await dioClient.post(
        "${AppConstants.Map_URL}${usermap.l1}&l2=${usermap.l2}&curr=${usermap.curr}&BT=${usermap.BT}&DT=${usermap.DT}",
      );
      return ApiResponse.withSuccess(response);
    }
    on DioException catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
