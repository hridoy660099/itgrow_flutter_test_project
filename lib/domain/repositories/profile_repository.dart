abstract class ProfileRepository{
  //Get Account info
  Future getAccountInfo(dynamic data);

  //Get last four digits of phone no.
  Future getLastFourNumbersPhone(dynamic data);
}