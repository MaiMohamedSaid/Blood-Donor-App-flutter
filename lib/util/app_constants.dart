// ignore_for_file: constant_identifier_names
import '../data/model/response/language_model.dart';

class AppConstants {
  static const String APP_NAME = 'BloodDonor'; //NAME APP

  // ALL URL
  static const String BASE_URL =
      'http://ranamohsen-001-site1.itempurl.com/'; //BASE URL

  static const LOGIN_Url = "${BASE_URL}api/Auth/Login";
  static const REGISTER_Url = '${BASE_URL}api/Auth/Register';
  static const DONORREQUEST_Url = '${BASE_URL}api/DonationRequest/Get';
  static const NEEDREQUEST_Url = '${BASE_URL}api/NeedRequest/Get';
  static const NEEDPOST_Url = '${BASE_URL}api/NeedRequest/Post';
  static const NEEDREQUESTBYID_Url = '${BASE_URL}api/NeedRequest/GetBySection/';
  static const SECTIONDATA_Url = '${BASE_URL}api/Section/Get';
  static const DONORPOST_Url = '${BASE_URL}api/DonationRequest/Post';
  static const DONORREQUESTBYID_Url = '${BASE_URL}api/DonationRequest/GetBySection/';
  static const CHANGEPASSWORD_Url = '${BASE_URL}api/Auth/ChangePassword';
  static const FORGETEPASSWORD_Url = '${BASE_URL}api/Auth/ForgetPass';
  static const GETUSER_URL = '${BASE_URL}User/GetUser/';
  static const EDITUSER_URL = '${BASE_URL}User/EditUser?Id=';
  static const GETAllUSERS_URL = '${BASE_URL}User/AllUsersWithoutCurrentUser';
  static const GETAllFRIENDS_URL = '${BASE_URL}User/GetAllFriends';
  static const GETCONVERSATIO_URL = '${BASE_URL}Chat/GetConversation/';
  static const SENDMESSAGE_URL = '${BASE_URL}Chat/SendMessage';


  static const Map_URL = 'https://nearest-donor-hayah12.onrender.com/prediction?l1=';


  // sharePreference
  static const String COUNTRY_CODE = 'country_code';
  static const String LANGUAGE_CODE = 'language_code';
  static const String REMEMBER = 'remember';
  static const String USER = 'user';
  static const String START = 'start';
  static const String INTRO = 'intro';
  static const String SAVE_CUSTOMER = 'SAVE_CUSTOMER';
  static const String THEME = 'theme';
  static const String SEARCH_ADDRESS = 'search_address';
  static const String CART_LIST = 'cart_list';
  static const String ADDRESSES_LIST = 'addresses_list';
  static const String SECTION_ID = 'sectionId';
  static const String APPUSER_ID = 'appUserId';
  static const String Receiver_ID = 'reciverId';

  // ALL LANGUAGE
  static List<LanguageModel>? languages = [
    LanguageModel(
        imageUrl: '',
        languageName: 'English',
        countryCode: 'US',
        languageCode: 'en'),
    LanguageModel(
        imageUrl: '',
        languageName: 'Arabic',
        countryCode: 'SA',
        languageCode: 'ar'),
  ];
}
