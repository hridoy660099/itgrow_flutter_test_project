import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:itgrow_flutter_test_project/domain/repositories/profile_repository.dart';
import 'package:itgrow_flutter_test_project/domain/usecases/profile_usecase.dart';

class ProfileUseCaseImpl extends ProfileUseCase{
  final ProfileRepository _profileRepository;
  ProfileUseCaseImpl(this._profileRepository);

  // get account information
  @override
  Future getAccountInfo(String? userId, String token) async{
    dynamic respData;
    final dummy = {
      "login": userId,
      "token": token,
    };
    // debugPrint("uc profile login: " + userId!);
    // debugPrint("uc profile token: " + token);
    final data = jsonEncode(dummy);

    await _profileRepository.getAccountInfo(data).then((value){
      respData = value;

      // debugPrint("uc profile: $value");
    }).onError((error, stackTrace){
      // debugPrint("uc profile error: $error");
    });

    // debugPrint("uc profile response data: $respData");

    return respData;
  }

  // get last four digits of phone no.
  @override
  Future getLastFourNumbersPhone(String? userId, String token) async{
    dynamic respData;
    final dummy = {
      "login": userId,
      "token": token,
    };
    // debugPrint("uc profile login: " + userId!);
    // debugPrint("uc profile token: " + token);
    final data = jsonEncode(dummy);

    await _profileRepository.getLastFourNumbersPhone(data).then((value){
      respData = value;

      // debugPrint("uc profile phone: $value");
    }).onError((error, stackTrace){
      debugPrint("uc profile phone error: $error");
    });

    // debugPrint("uc profile phone response data: $respData");
    return respData;
  }
}