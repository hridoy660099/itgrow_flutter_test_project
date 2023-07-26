import 'package:itgrow_flutter_test_project/data/data_source/trades_data_source.dart';
import 'package:itgrow_flutter_test_project/data/network/base_api_service.dart';
import 'package:itgrow_flutter_test_project/res/app_urls.dart';

class TradesDataSourceImpl extends TradesDataSource{
  final BaseApiService _apiService;
  TradesDataSourceImpl(this._apiService);

  // Get All Trades
  @override
  Future getTrades(data) async{
    const url = AppUrls.tradesEndpoint;
    try{
      dynamic response = await _apiService.getPostApiTokenResponse(url, data);
      return response;
    }catch(e){
      rethrow;
    }
  }
}