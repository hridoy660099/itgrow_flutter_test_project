import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:itgrow_flutter_test_project/domain/repositories/trades_repository.dart';
import 'package:itgrow_flutter_test_project/domain/usecases/trades_usecase.dart';

class TradesUseCaseImpl extends TradesUseCase{
  final TradesRepository _tradesRepository;
  TradesUseCaseImpl(this._tradesRepository);

  //get all trades
  @override
  Future getTrades(loginId, token) async{
    dynamic respData;
    final dummy = {
      "login": loginId,
      "token": token,
    };
    // debugPrint("uc profile login: " + userId!);
    // debugPrint("uc profile token: " + token);
    final data = jsonEncode(dummy);

    await _tradesRepository.getTrades(data).then((value){
      respData = value;

      // debugPrint("uc trades: $value");
    }).onError((error, stackTrace){
      debugPrint("uc trades error: $error");
    });

    // debugPrint("uc profile response data: $respData");

    return respData;
  }
}