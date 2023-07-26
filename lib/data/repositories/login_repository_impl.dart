import 'package:itgrow_flutter_test_project/data/data_source/login_data_source.dart';
import 'package:itgrow_flutter_test_project/domain/repositories/login_repository.dart';

class LoginRepositoryImpl extends LoginRepository{
  final LoginDataSource _loginDataSource;
  LoginRepositoryImpl(this._loginDataSource);

  // Authenticate user
  @override
  Future authenticateUser(dynamic data) {
    return _loginDataSource.authenticateUser(data);
  }
}