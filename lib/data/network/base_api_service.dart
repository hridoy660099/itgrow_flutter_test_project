abstract class BaseApiService{
  // POST
  Future<dynamic> getPostApiTokenResponse(String url, dynamic data);
  Future<dynamic> getPostApiTokenTextResponse(String url, dynamic data);
  Future<dynamic> getPostApiResponse(String url, dynamic data);
}