import 'package:itgrow_flutter_test_project/model/user.dart';
import 'package:itgrow_flutter_test_project/res/app_constants.dart';
import 'package:itgrow_flutter_test_project/viewmodel/base/base_viewmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewmodel extends BaseViewmodel{

  Future<bool> saveUser(User user, bool rememberUser) async{
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(AppConstants.userIdKey, user.userId.toString());

    sharedPreferences.setBool(AppConstants.rememberUserKey, rememberUser);

    notifyListeners();

    return true;
  }

  String? _currentUser;
  String? get currentUser => _currentUser;

  Future<User> getUser() async{
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
     String userId = sharedPreferences.getString(AppConstants.loginKey) ?? AppConstants.noData;

    _currentUser = userId;

    // notifyListeners();

    return User(userId: userId);
  }

  Future<bool> checkUserRemember() async{
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    bool rememberUser = sharedPreferences.getBool(AppConstants.rememberUserKey) ?? false;

    return rememberUser;
  }

  Future<bool> remove() async{
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.clear();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}