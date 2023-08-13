import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../util/app_constants.dart';

class LocalizationProvider extends ChangeNotifier {
  final SharedPreferences sharedPreferences;

  LocalizationProvider({required this.sharedPreferences}) {
    _loadCurrentLanguage();
  }

  Locale? _locale = Locale(AppConstants.languages![0].languageCode,
      AppConstants.languages![0].countryCode);

  bool _isLtr = true;
  int? _languageIndex;

  Locale? get locale => _locale;

  bool get isLtr => _isLtr;

  int? get languageIndex => _languageIndex;

  Future<void> setLanguage(Locale locale) async {
    _locale = locale;
    _isLtr = _locale!.languageCode != 'ar';
    for (int index = 0; index < AppConstants.languages!.length; index++) {
      if (AppConstants.languages![index].languageCode == locale.languageCode) {
        _languageIndex = index;
        break;
      }
    }
    _saveLanguage(_locale);
    notifyListeners();
  }

  _loadCurrentLanguage() async {
    _locale = Locale(
        sharedPreferences.getString(AppConstants.LANGUAGE_CODE) ??
            AppConstants.languages![1].languageCode,
        sharedPreferences.getString(AppConstants.COUNTRY_CODE) ??
            AppConstants.languages![1].countryCode);
    _isLtr = _locale!.languageCode != 'ar';
    for (int index = 0; index < AppConstants.languages!.length; index++) {
      if (AppConstants.languages![index].languageCode == locale!.languageCode) {
        _languageIndex = index;
        break;
      }
    }
    notifyListeners();
  }

  _saveLanguage(Locale? locale) async {
    sharedPreferences.setString(
        AppConstants.LANGUAGE_CODE, locale!.languageCode);
    sharedPreferences.setString(AppConstants.COUNTRY_CODE, locale.countryCode!);
  }
}