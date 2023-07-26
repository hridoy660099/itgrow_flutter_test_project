import 'package:itgrow_flutter_test_project/domain/usecases/auth_usecase.dart';
import 'package:itgrow_flutter_test_project/res/app_constants.dart';
import 'package:itgrow_flutter_test_project/viewmodel/base/main_viewmodel.dart';


class AuthViewmodel extends MainViewmodel{
  final AuthUseCase authUseCase;
  AuthViewmodel(this.authUseCase);

  Future<dynamic> getToken(){
    return getFromSharedPref(AppConstants.tokenKey);
  }
}