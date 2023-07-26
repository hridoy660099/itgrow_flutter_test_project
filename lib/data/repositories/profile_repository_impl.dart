import 'package:itgrow_flutter_test_project/data/data_source/profile_data_source.dart';
import 'package:itgrow_flutter_test_project/domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl extends ProfileRepository{
  final ProfileDataSource _profileDataSource;
  ProfileRepositoryImpl(this._profileDataSource);

  // get account info
  @override
  Future getAccountInfo(data) {
    return _profileDataSource.getAccountInfo(data);
  }

  // get last four digits of phone no.
  @override
  Future getLastFourNumbersPhone(data) async{
    return _profileDataSource.getLastFourNumbersPhone(data);
  }
}