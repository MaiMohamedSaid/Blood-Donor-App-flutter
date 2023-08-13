// ignore_for_file: use_rethrow_when_possible, unnecessary_null_in_if_null_operators, await_only_futures, avoid_function_literals_in_foreach_calls
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitledtest11/data/model/response/section_model.dart';
import 'package:untitledtest11/data/model/response/user_model.dart';
import '../../util/app_constants.dart';
import '../dataSource/remote/dio/dio_client.dart';
import '../dataSource/remote/exception/api_error_handler.dart';
import '../model/body/login_model.dart';
import '../model/body/register_model.dart';
import '../model/body/send_message_model.dart';
import '../model/body/updateuser_model.dart';
import '../model/response/base/api_response.dart';
import '../model/response/Auth_model.dart';
import '../model/body/change_password_model.dart';
import '../model/response/forgeeet_password_model.dart';
import '../model/body/forget_model.dart';

class AuthRepo {
  final DioClient dioClient;
  final SharedPreferences sharedPreferences;
  AuthRepo({required this.dioClient, required this.sharedPreferences});


  ///login
  Future<ApiResponse> login(LoginModel loginBody) async {
    try {
      Response response = await dioClient.post(
        AppConstants.LOGIN_Url,
        data: loginBody.toJson(),
      );

      return ApiResponse.withSuccess(response);
    } on DioException catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }


  ///registration
  Future<ApiResponse> registration(RegisterModel register) async {
    try {
      Response response = await dioClient.post(
        AppConstants.REGISTER_Url,
        data: register.toJson(),
      );
      return ApiResponse.withSuccess(response);
    }
    on DioError catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  ///get User Data
  Future<ApiResponse> getUserData(String id) async {
    try {
      Response response = await dioClient.get(
        AppConstants.GETUSER_URL + id,
      );
      return ApiResponse.withSuccess(response);
    }
    on DioException catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  ///edit User Data
  Future<ApiResponse> editUserData(EditUser editUser) async {
    try {
      Response response = await dioClient.put(
        "${AppConstants.EDITUSER_URL}${editUser.applicationUserId}",
        data: editUser.toJson());
      return ApiResponse.withSuccess(response);
    }
    on DioException catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  ///Change Password
  Future<ApiResponse> changePassword(changePassModel change) async {
    try {
      var response = await dioClient.post(
        AppConstants.CHANGEPASSWORD_Url,
        data: change.toJson(),
      );
      return ApiResponse.withSuccess(response);
    }
    on DioException catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  ///Forget Password
  Future<ApiResponse> forgetPassword(ForgetPassModel forget) async {
    try {
      var response = await dioClient.post(
        AppConstants.FORGETEPASSWORD_Url,
        data: forget.toJson(),
      );
      return ApiResponse.withSuccess(response);
    }
    on DioException catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }


  ///get AllUsers Data
  Future<ApiResponse> getAllUsersData() async {
    try {
      Response response = await dioClient.get(
        AppConstants.GETAllUSERS_URL,
      );
      return ApiResponse.withSuccess(response);
    }
    on DioException catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  ///get AllFreinds Data
  Future<ApiResponse> getAllFreindsData() async {
    try {
      Response response = await dioClient.get(
        AppConstants.GETAllFRIENDS_URL,
      );
      return ApiResponse.withSuccess(response);
    }
    on DioException catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  ///getConversation Data
  Future<ApiResponse> getConversation(String? reciverId) async {
    try {
      Response response = await dioClient.get(
        AppConstants.GETCONVERSATIO_URL + reciverId!,
      );
      return ApiResponse.withSuccess(response);
    }
    on DioException catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  ///Send Message
  Future<ApiResponse> sendMessage(MessageModel send) async {
    try {
      var response = await dioClient.post(
        AppConstants.SENDMESSAGE_URL,
        data: send.toJson(),
      );
      return ApiResponse.withSuccess(response);
    }
    on DioException catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }


  bool isLoggedIn() {
    return sharedPreferences.containsKey(AppConstants.USER);
  }

  void saveReceiverId(int id){
    sharedPreferences.setInt(AppConstants.Receiver_ID, id);
  }

  int? getReceiverId(){
    return sharedPreferences.getInt(AppConstants.Receiver_ID);
  }

  Future<bool> clearUser() async {
    return await sharedPreferences.remove(AppConstants.USER);
  }

  Future<void> saveUser(AuthModel user) async {
    try {
      await sharedPreferences.setString(AppConstants.USER, jsonEncode(user));
    } catch (e) {
      throw e;
    }
  }

  Future<AuthModel?> getUser() async {
    String? user = await sharedPreferences.getString(AppConstants.USER) ?? null;
    return user == null ? null : AuthModel.fromJson(jsonDecode(user));
  }
}
