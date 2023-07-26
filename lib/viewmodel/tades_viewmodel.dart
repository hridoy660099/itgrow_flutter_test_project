import 'package:flutter/material.dart';
import 'package:itgrow_flutter_test_project/domain/usecases/trades_usecase.dart';
import 'package:itgrow_flutter_test_project/model/trade.dart';
import 'package:itgrow_flutter_test_project/res/app_constants.dart';
import 'package:itgrow_flutter_test_project/viewmodel/auth/auth_viewmodel.dart';
import 'package:itgrow_flutter_test_project/viewmodel/base/main_viewmodel.dart';
import 'package:provider/provider.dart';

class TradesViewmodel extends MainViewmodel{
  final TradesUseCase _tradesUseCase;
  TradesViewmodel(this._tradesUseCase);

  // All Trades
  List<dynamic> _trades = [];
  List<dynamic> get trades => _trades;

  // Total profit of trades
  double _totalProfit = 0.0;
  double get totalProfit => _totalProfit;

  // get trades
  Future getTrades(BuildContext context) async{
    dynamic respData;
    setLoading(true);

    // await getFromSharedPref(AppConstants.rememberUserKey);

    final authViewmodel = Provider.of<AuthViewmodel>(context, listen: false);
    final token = await authViewmodel.getToken();

    final loginId = await getFromSharedPref(AppConstants.loginKey);
    // debugPrint("vm profile login id: " + user.userId.toString());
    await _tradesUseCase.getTrades(loginId, token).then((value){
      setLoading(false);

      respData = value;

      _trades = value.map((e) => Trade.fromJson(e)).toList();
      // debugPrint("vm trades: $value");
      // debugPrint("vm trades item current price: ${trades.elementAt(0).currentPrice}");

      // return value;
    }).onError((error, stackTrace){
      setLoading(false);
      debugPrint("vm trades error: " + error.toString());
    });

    // debugPrint("vm profile name: ${accountInfo?.name}");

    notifyListeners();
  }

  // calculation of profits
  void calculateProfit(){
    _totalProfit = 0;

    for(int i = 0; i < trades.length; i++){
      _totalProfit += trades.elementAt(i).profit;
    }

    notifyListeners();
  }
}