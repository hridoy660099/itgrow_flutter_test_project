import 'package:shared_preferences/shared_preferences.dart';

const String PREFS_KEY_LANG = "PREFS_KEY_LANG";
const String PREFS_KEY_USER = "PREFS_KEY_USER";

class AppPreferences{
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  Future<String> getAppLanguage() async{
    String? language = _sharedPreferences.getString(PREFS_KEY_LANG);

    if(language != null &&  language.isNotEmpty){
      return language;
    }
    else{
      return "en";
    }
  }

  Future<String> getUser() async{
    String? user = _sharedPreferences.getString(PREFS_KEY_USER);

    if(user != null && user.isNotEmpty){
      return user;
    }
    else{
      return "not_user";
    }
  }
}