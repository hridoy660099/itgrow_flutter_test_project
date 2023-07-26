import 'package:itgrow_flutter_test_project/domain/repositories/auth_repository.dart';
import 'package:itgrow_flutter_test_project/domain/usecases/auth_usecase.dart';

class AuthUseCaseImpl extends AuthUseCase{
  final AuthRepository _authRepository;
  AuthUseCaseImpl(this._authRepository);

  // user authentication
  @override
  Future authenticateUser(dynamic data) {
    return _authRepository.authenticateUser(data);
  }
}