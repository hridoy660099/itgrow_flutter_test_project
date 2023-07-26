import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:itgrow_flutter_test_project/domain/usecases/profile_usecase.dart';
import 'package:itgrow_flutter_test_project/model/account_info.dart';
import 'package:itgrow_flutter_test_project/model/user.dart';
import 'package:itgrow_flutter_test_project/viewmodel/auth/auth_viewmodel.dart';
import 'package:itgrow_flutter_test_project/viewmodel/user_viewmodel.dart';


class ProfileViewmodel extends AuthViewmodel{
  final ProfileUseCase _profileUseCase;
  final UserViewmodel _userViewmodel;

  ProfileViewmodel(this._profileUseCase, this._userViewmodel, super.authRepository);

  // account information
  AccountInfo? _accountInfo;
  AccountInfo? get accountInfo => _accountInfo;

  // get account information
  Future getAccountInfo(BuildContext context) async{
    dynamic respData;
    setLoading(true);

    final token = await getToken();

    User user = await _userViewmodel.getUser();
    // debugPrint("vm profile login id: " + user.userId.toString());
    await _profileUseCase.getAccountInfo(user.userId, token).then((value){
      setLoading(false);
      respData = value;

      _accountInfo = AccountInfo.fromJson(value);

      // debugPrint("vm profile: $value");
      // debugPrint("vm profile name: ${accountInfo?.name}");
    }).onError((error, stackTrace){
      setLoading(false);
      debugPrint(error.toString());
    });

    await getLastFourNumbersPhone();

    // _accountInfo = AccountInfo.fromJson(respData);
    // debugPrint("vm profile name: ${accountInfo?.name}");

    notifyListeners();
  }


  // last four digits of phone no.
  String? _lastFourDigitsOfPhone;
  String? get lastFourDigitsOfPhone => _lastFourDigitsOfPhone;

  // get last four digits of phone no.
  Future getLastFourNumbersPhone() async{
    dynamic respData;
    setLoading(true);

    final token = await getToken();

    User user = await _userViewmodel.getUser();

    await _profileUseCase.getLastFourNumbersPhone(user.userId, token).then((value){
      setLoading(false);
      respData = value;

      _lastFourDigitsOfPhone = value;

      // debugPrint("vm profile phone: $value");
      // debugPrint("vm profile name: ${accountInfo?.name}");

      // return value;
    }).onError((error, stackTrace){
      setLoading(false);
      debugPrint("vm profile phone error: " + error.toString());
    });

    notifyListeners();
  }
}