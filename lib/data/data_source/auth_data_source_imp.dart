import 'package:itgrow_flutter_test_project/data/data_source/auth_data_source.dart';
import 'package:itgrow_flutter_test_project/data/network/base_api_service.dart';
import 'package:itgrow_flutter_test_project/res/app_urls.dart';

class AuthDataSourceImpl extends AuthDataSource{
  final BaseApiService _apiService;
  AuthDataSourceImpl(this._apiService);

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