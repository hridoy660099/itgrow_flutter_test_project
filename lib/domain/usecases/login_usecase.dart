import 'package:itgrow_flutter_test_project/model/user.dart';

abstract class LoginUseCase{
  //User authentication
  Future authenticateUser(User user);
}