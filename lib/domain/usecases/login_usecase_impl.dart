import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:itgrow_flutter_test_project/domain/repositories/login_repository.dart';
import 'package:itgrow_flutter_test_project/domain/usecases/login_usecase.dart';
import 'package:itgrow_flutter_test_project/model/user.dart';

class LoginUseCaseImpl extends LoginUseCase{
  final LoginRepository _loginRepository;
  LoginUseCaseImpl(this._loginRepository);

  // User Authentication
  @override
  Future authenticateUser(User user) async{
    dynamic respData;
    final dummy = {
      "login": user.userId,
      "password": user.password,
    };
    final data = jsonEncode(dummy);

    await _loginRepository.authenticateUser(data).then((value){
      // debugPrint("uc login: $value");
      respData = value;
    }).onError((error, stackTrace){
      debugPrint("uc login error: $error");
    });

    return respData;
  }
}