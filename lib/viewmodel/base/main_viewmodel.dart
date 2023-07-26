import 'package:flutter/material.dart';
import 'package:itgrow_flutter_test_project/res/app_constants.dart';
import 'package:itgrow_flutter_test_project/res/app_strings.dart';
import 'package:itgrow_flutter_test_project/utils/routes/routes.dart';
import 'package:itgrow_flutter_test_project/viewmodel/base/base_viewmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';


class MainViewmodel extends BaseViewmodel{
  int _selectedBottomNavItemIndex = 0;
  int get selectedBottomNavItemIndex => _selectedBottomNavItemIndex;
  setBottomNavCurrentIndex(int value){
    _selectedBottomNavItemIndex = value;
    // double a = 0.0;
    // debugPrint("key type: "+ a.runtimeType.toString());
    notifyListeners();
  }

  // Logout
  Future<bool> logout(BuildContext context) async{
    // setLoading(true);
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove(AppConstants.tokenKey);
    sharedPreferences.remove(AppConstants.userIdKey);
    sharedPreferences.remove(AppConstants.userNameKey);
    sharedPreferences.remove(AppConstants.userPassKey);
    sharedPreferences.clear();

    if (context.mounted) Navigator.pushReplacementNamed(context, Routes.loginScreen);

    return true;
  }

  // Save value to shared preferences
  Future<bool> saveToSharedPref(String key, dynamic value) async{
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    // debugPrint("key type: "+ value.runtimeType.toString());

    switch(value.runtimeType.toString().toLowerCase()){
      case AppStrings.integerType:
        sharedPreferences.setInt(key, value);
        break;
      case AppStrings.stringType:
        sharedPreferences.setString(key, value);
        break;
      case AppStrings.booleanType:
        sharedPreferences.setBool(key, value);
        break;
      case AppStrings.doubleType:
        sharedPreferences.setDouble(key, value);
        break;
      default:
        sharedPreferences.setString(key, value);
        break;
    }

    notifyListeners();

    return true;
  }


  // Get saved value from shared preferences
  Future<dynamic> getFromSharedPref(String key) async{
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    dynamic value = sharedPreferences.get(key);

    // debugPrint("user from shared pref: " + sharedPreferences.get(key).toString());

    notifyListeners();

    return value;
  }
}