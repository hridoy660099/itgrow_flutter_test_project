import 'package:itgrow_flutter_test_project/model/account_info.dart';

abstract class ProfileDataSource{
  //Get Account info
  Future getAccountInfo(dynamic data);

  //Get last four digits of phone no.
  Future getLastFourNumbersPhone(dynamic data);
}