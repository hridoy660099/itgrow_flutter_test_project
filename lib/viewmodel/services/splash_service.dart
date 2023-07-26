import 'package:flutter/material.dart';
import 'package:itgrow_flutter_test_project/model/user.dart';
import 'package:itgrow_flutter_test_project/res/app_constants.dart';
import 'package:itgrow_flutter_test_project/res/app_strings.dart';
import 'package:itgrow_flutter_test_project/utils/routes/routes.dart';
import 'package:itgrow_flutter_test_project/viewmodel/user_viewmodel.dart';
import 'package:provider/provider.dart';

class SplashService{
  Future<User> getUserData() => UserViewmodel().getUser();

  void checkAuthentication(BuildContext context) async{

    getUserData().then((value) async{
      final userPref = Provider.of<UserViewmodel>(context, listen: false);
      // debugPrint("splash user: "+ value.userId.toString());

      if(value.userId == null || value.userId == AppStrings.empty || value.userId == AppConstants.noData){
        await Future.delayed(const Duration(seconds: 1));
        // Navigator.pushNamed(context, RouteName.loginScreen);
        if(context.mounted) Navigator.pushReplacementNamed(context, Routes.loginScreen);
      }
      else{
        if(await userPref.checkUserRemember()){
          await Future.delayed(const Duration(seconds: 1));
          if(context.mounted) Navigator.pushReplacementNamed(context, Routes.mainScreen);
        }
        else{
          await Future.delayed(const Duration(seconds: 1));
          if(context.mounted) Navigator.pushReplacementNamed(context, Routes.loginScreen);
        }
        // Navigator.pushNamed(context, RouteName.mainScreen);

      }
    }).onError((error, stackTrace){
      debugPrint("splashservice auth error: " + error.toString());
    });
  }



}