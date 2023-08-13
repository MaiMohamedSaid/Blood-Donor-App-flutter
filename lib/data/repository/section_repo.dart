// ignore_for_file: use_rethrow_when_possible, unnecessary_null_in_if_null_operators, await_only_futures, avoid_function_literals_in_foreach_calls
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../util/app_constants.dart';
import '../dataSource/remote/dio/dio_client.dart';
import '../dataSource/remote/exception/api_error_handler.dart';
import '../model/response/base/api_response.dart';

class SectionRepo {
  final DioClient dioClient;
  final SharedPreferences sharedPreferences;
  SectionRepo({required this.dioClient, required this.sharedPreferences});

  ///get Sections
  Future<ApiResponse> getSections(String? token) async {
    dioClient.updateHeader(token);
    try {
      Response response = await dioClient.get(
          AppConstants.SECTIONDATA_Url
      );
      return ApiResponse.withSuccess(response);
    } on DioException catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  void saveSectionId(int id){
    sharedPreferences.setInt(AppConstants.SECTION_ID, id);
  }

  int? getSectionId(){
    return sharedPreferences.getInt(AppConstants.SECTION_ID);
  }

}
