import 'package:itgrow_flutter_test_project/data/data_source/login_data_source.dart';
import 'package:itgrow_flutter_test_project/data/network/base_api_service.dart';
import 'package:itgrow_flutter_test_project/res/app_urls.dart';

class LoginDataSourceImpl extends LoginDataSource{
  final BaseApiService _apiService;
  LoginDataSourceImpl(this._apiService);

  //User authentication
  @override
  Future authenticateUser(dynamic data) async{
    const url = AppUrls.authTokenEndpoint;
    try{
      dynamic response = await _apiService.getPostApiTokenResponse(url, data);
      return response;
    }catch(e){
      rethrow;
    }
  }
}