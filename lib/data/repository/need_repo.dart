// ignore_for_file: use_rethrow_when_possible, unnecessary_null_in_if_null_operators, await_only_futures, avoid_function_literals_in_foreach_calls
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../util/app_constants.dart';
import '../dataSource/remote/dio/dio_client.dart';
import '../dataSource/remote/exception/api_error_handler.dart';
import '../model/body/needy_model.dart';
import '../model/response/base/api_response.dart';
import '../model/response/needy_list_model.dart';

class NeedRepo {
  final DioClient dioClient;
  final SharedPreferences sharedPreferences;
  NeedRepo({required this.dioClient, required this.sharedPreferences});

  ///get Sections
  Future<ApiResponse> getNeedsList(String? sectionId) async {
    try {
      Response response = await dioClient.get(
          AppConstants.NEEDREQUESTBYID_Url + sectionId!
      );
      return ApiResponse.withSuccess(response);
    } on DioException catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
  ///get Needy
  Future<ApiResponse> getNeedy() async {
    try {
      Response response = await dioClient.get(
          AppConstants.NEEDREQUEST_Url
      );
      return ApiResponse.withSuccess(response);
    } on DioException catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  ///Needy
  Future<ApiResponse>Needy(NeedyModel needy) async {
    // dioClient.updateHeaderDon();
    try {
      Response response = await dioClient.post(
        AppConstants.NEEDPOST_Url,
        data: needy.toJson(),
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
}
