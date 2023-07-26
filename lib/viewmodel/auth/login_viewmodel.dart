import 'package:flutter/material.dart';
import 'package:itgrow_flutter_test_project/domain/usecases/login_usecase.dart';
import 'package:itgrow_flutter_test_project/model/user.dart';
import 'package:itgrow_flutter_test_project/res/app_constants.dart';
import 'package:itgrow_flutter_test_project/res/app_strings.dart';
import 'package:itgrow_flutter_test_project/utils/routes/routes.dart';
import 'package:itgrow_flutter_test_project/utils/utils.dart';
import 'package:itgrow_flutter_test_project/viewmodel/auth/auth_viewmodel.dart';


class LoginViewmodel extends AuthViewmodel{
  final LoginUseCase _loginUseCase;

  LoginViewmodel(this._loginUseCase, super.authUseCase);

  // Remember User
  bool _rememberUser = false;
  bool get rememberUser => _rememberUser;
  setRememberUser(bool value){
    _rememberUser = value;

    notifyListeners();
  }

  // Login
  Future<void> login(BuildContext context, User user, bool willRemember,) async{
    dynamic respData;
    if (user.userId!.isEmpty) {
      Utils.showErrorFlushbar(
        context,
        AppStrings.login + AppStrings.blankSpace + AppStrings.error,
        AppStrings.pleaseEnter +
            AppStrings.blankSpace +
            AppStrings.userId,
      );
    } else if (user.password!.isEmpty) {
      Utils.showErrorFlushbar(
        context,
        AppStrings.login + AppStrings.blankSpace + AppStrings.error,
        AppStrings.pleaseEnter +
            AppStrings.blankSpace +
            AppStrings.password,
      );
    } else if (user.password!.length < 3) {
      Utils.showErrorFlushbar(context, AppStrings.login + AppStrings.blankSpace + AppStrings.error,
        AppStrings.passwordLengthWarning,);
    }
    else {
      debugPrint("api hit");

      setLoading(true);

      await _loginUseCase.authenticateUser(user).then((value) async{
        setLoading(false);
        respData = value;
        // debugPrint("vm will remember: "+ willRemember.toString());

        // save the fetched token
        await saveToSharedPref(AppConstants.tokenKey, value["token"]);
        await saveToSharedPref(AppConstants.loginKey, user.userId);
        await saveToSharedPref(AppConstants.rememberUserKey, true);

        // debugPrint("vm login: " + value["result"].toString());
        debugPrint("vm login: success: " + value["result"].toString());

        if(context.mounted) Navigator.pushNamed(context, Routes.mainScreen);
        if(context.mounted) Utils.showSuccessSnackbar(context, "Success");
      }).onError((error, stackTrace){
        setLoading(false);
        debugPrint("vm login error: $error");

        Utils.showErrorSnackbar(context, "Failed");
      });

      // debugPrint("vm login resp: " + respData["token"].toString());
    }

    return respData;
  }
}