import 'package:itgrow_flutter_test_project/data/data_source/profile_data_source.dart';
import 'package:itgrow_flutter_test_project/data/network/base_api_service.dart';
import 'package:itgrow_flutter_test_project/res/app_urls.dart';

class ProfileDataSourceImpl extends ProfileDataSource{
  final BaseApiService _apiService;
  ProfileDataSourceImpl(this._apiService);

  //Get Account info
  @override
  Future getAccountInfo(data) async{
      const url = AppUrls.accountInformationEndpoint;
      try{
        dynamic response = await _apiService.getPostApiTokenResponse(url, data);

        return response;
      }catch(e){
        rethrow;
      }
  }

  //Get last four digits of phone no.
  @override
  Future getLastFourNumbersPhone(data) async{
    const url = AppUrls.phoneNoEndpoint;
    try{
      dynamic response = await _apiService.getPostApiTokenTextResponse(url, data);

      return response;
    }catch(e){
      rethrow;
    }
  }

  // @override
  // Future getAccountInfo(dynamic data) async{
  //   const url = AppUrls.accountInformationEndpoint;
  //   try{
  //     dynamic response = await _apiService.getPostApiTokenResponse(url, data);
  //     return response;
  //   }catch(e){
  //     rethrow;
  //   }
  // }
}