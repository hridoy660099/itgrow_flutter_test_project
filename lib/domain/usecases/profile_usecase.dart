abstract class ProfileUseCase{
  //Get Account information
  Future getAccountInfo(String? userId, String token);

  // Get last four digits of phone number
  Future getLastFourNumbersPhone(String? userId, String token);
}