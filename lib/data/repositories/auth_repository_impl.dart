import 'package:itgrow_flutter_test_project/data/data_source/auth_data_source.dart';
import 'package:itgrow_flutter_test_project/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository{
  final AuthDataSource _authDataSource;
  AuthRepositoryImpl(this._authDataSource);

  // Authenticate user
  @override
  Future authenticateUser(dynamic data) {
    return _authDataSource.authenticateUser(data);
  }
}