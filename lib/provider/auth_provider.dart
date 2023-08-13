import 'package:flutter/material.dart';
import 'package:untitledtest11/data/model/response/forgeeet_password_model.dart';
import '../data/model/body/login_model.dart';
import '../data/model/body/register_model.dart';
import '../data/model/body/send_message_model.dart';
import '../data/model/body/updateuser_model.dart';
import '../data/model/response/update_user_model.dart';
import '../data/model/response/user_model.dart';
import '../data/model/response/Auth_model.dart';
import '../data/model/response/all_useres_model.dart';
import '../data/model/response/base/api_response.dart';
import '../data/model/body/change_password_model.dart';
import '../data/model/response/forgeeet_password_model.dart';
import '../data/model/response/forgeeet_password_model.dart';
import '../data/model/body/forget_model.dart';
import '../data/model/response/get_conversation_model.dart';
import '../data/model/response/map_response_model.dart';
import '../data/repository/auth_repo.dart';
import '../data/model/response/all_friends_model.dart';

class AuthProvider with ChangeNotifier {
  final AuthRepo authRepo;
  AuthProvider({required this.authRepo});

  bool _isLoading = false;
  bool _isRemember = false;
  int _selectedIndex = 0;
  String? _token;
  String? _userId;
  int? _receiverId;

  String ? _appUserId ;
  AuthModel? _userData;
  UserDataModel? _user;
  AllData? _usersFreinds;
  MainModel? _allusers;

  UserDataModel? get user => _user;
  AllData? get usersFreinds => _usersFreinds;
  MainModel? get allusers => _allusers;
  AuthModel? get userData => _userData;
  int get selectedIndex => _selectedIndex;
  bool get isLoading => _isLoading;
  bool get isRemember => _isRemember;
  String? get token => _token;
  String? get userId => _userId;
  String? get appUserId => _appUserId;
  int? get receiverId => _receiverId;
  List <ConversationData>? get conversationData => _conversationData;


  List <ConversationData>? _conversationData = [];
  List<dynamic> listDataC =[];


  /// registration
  Future registration(RegisterModel register, Function callback) async {
    _isLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await authRepo.registration(register);
    _isLoading = false;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      AuthModel authModel;
      authModel = AuthModel.fromJson(apiResponse.response!.data);
      callback(authModel.isAuthenticated, register.email, register.password, authModel.token,
          authModel.message.toString());
    }
    else {
      callback(false, "", "", "Please Confirm Email");
    }
    notifyListeners();
  }

  /// login with email && password  **
  Future login(LoginModel loginBody, Function callback) async {
    _isLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await authRepo.login(loginBody);
    _isLoading = false;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      AuthModel authModel;
      authModel = AuthModel.fromJson(apiResponse.response!.data);
      if (authModel.isAuthenticated!) {
        _userData = authModel;
        authRepo.saveUser(_userData!);
      }
      callback(authModel.isAuthenticated, authModel.message.toString());
    } else {
      callback(false, "يوجد مشكله يمكنك المحاوله في وقت لاحق");
    }
    notifyListeners();
  }

  /// ChangePassword
  Future<void> changePassword(changePassModel change, Function callback) async {
    _isLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await authRepo.changePassword(change);
    _isLoading = false;
    if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
      ForgetData forgetData;
      forgetData = ForgetData.fromJson(apiResponse.response!.data);
      callback(forgetData.status == "Success" ? true : false,forgetData.message.toString());
    }
    else {
      callback(false,"يوجد مشكله يمكنك المحاوله في وقت لاحق");
    }
    notifyListeners();
  }

  /// ForgetPassword
  Future<void> forgetPassword(ForgetPassModel forget, Function callback) async {
    _isLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await authRepo.forgetPassword(forget);
    _isLoading = false;
    if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
      ForgetData forgetData;
      forgetData = ForgetData.fromJson(apiResponse.response!.data);
      callback(forgetData.message.toString());
    }
    else {
      callback("يوجد مشكله يمكنك المحاوله في وقت لاحق");
    }
    notifyListeners();
  }

  /// get User Data
  Future<void> getUserData(String id) async {
    ApiResponse apiResponse = await authRepo.getUserData(id);
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      _user = UserDataModel.fromJson(apiResponse.response!.data);
    }
    else {}
    notifyListeners();
  }


  /// edit User Data
  Future<void> editUserData(EditUser edit, Function callback) async {
    _isLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await authRepo.editUserData(edit);
    _isLoading = false;
    if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
      UpdateUserDataModel updateUserDataModel;
      updateUserDataModel = UpdateUserDataModel.fromJson(apiResponse.response!.data);
      callback(true,updateUserDataModel.message.toString());
    }
    else {
      callback(false,"يوجد مشكله يمكنك المحاوله في وقت لاحق");
    }
    notifyListeners();
  }


  ///get user
  Future<void> getUser() async {
    _userData = await authRepo.getUser();
    notifyListeners();
  }

  /// get AllUsers Data
  Future<void> getAllUsersData() async {
    ApiResponse apiResponse = await authRepo.getAllUsersData();
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      _allusers = MainModel.fromJson(apiResponse.response!.data);
    }
    else {}
    notifyListeners();
  }

  /// get AllFreinds Data
  Future<void> getAllFreindsrData() async {
    ApiResponse apiResponse = await authRepo.getAllFreindsData();
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      _usersFreinds = null;
      _usersFreinds = AllData.fromJson(apiResponse.response!.data);
    }
    else {}
    notifyListeners();
  }

  /// get Conversation
  Future getConversation(String? reciverId) async {
    ApiResponse apiResponse = await authRepo.getConversation(reciverId!);
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      _conversationData!.clear();
      ConversationData conversationData;
      apiResponse.response!.data.forEach((con){
        _conversationData!.add(ConversationData.fromJson(con));
      });
      print("list000 ======>>>>> ${_conversationData!.length}");
      notifyListeners();
    }
  }


  /// SendMessage
  Future<void> sendMessage(MessageModel send, Function callback) async {
    _isLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await authRepo.sendMessage(send);
    _isLoading = false;
    if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
      callback(true,"",send.reciverId);
    }
    else {
      callback(false,"يوجد مشكله يمكنك المحاوله في وقت لاحق",null);
    }
    notifyListeners();
  }


  Future<void> saveUser(AuthModel use) async {
    _userData = use;
    authRepo.saveUser(_userData!);
    notifyListeners();
  }

  void saveReceiverId(int id){
    _receiverId = id;
    authRepo.saveReceiverId(id);
  }

  void getReceiverId(int id){
    _receiverId = authRepo.getReceiverId();
  }

  updateSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  void updateRemember(bool? value) {
    _isRemember = value!;
    notifyListeners();
  }

  bool isLoggedIn() {
    return authRepo.isLoggedIn();
  }

  Future<bool> clearUser() async {
    return await authRepo.clearUser();
  }
}
