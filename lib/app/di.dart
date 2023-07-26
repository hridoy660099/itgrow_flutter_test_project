import 'package:get_it/get_it.dart';
import 'package:itgrow_flutter_test_project/app/app_prefs.dart';
import 'package:itgrow_flutter_test_project/data/data_source/auth_data_source.dart';
import 'package:itgrow_flutter_test_project/data/data_source/auth_data_source_imp.dart';
import 'package:itgrow_flutter_test_project/data/data_source/login_data_source.dart';
import 'package:itgrow_flutter_test_project/data/data_source/login_data_source_impl.dart';
import 'package:itgrow_flutter_test_project/data/data_source/profile_data_source.dart';
import 'package:itgrow_flutter_test_project/data/data_source/profile_data_source_impl.dart';
import 'package:itgrow_flutter_test_project/data/data_source/trades_data_source.dart';
import 'package:itgrow_flutter_test_project/data/data_source/trades_data_source_impl.dart';
import 'package:itgrow_flutter_test_project/data/network/base_api_service.dart';
import 'package:itgrow_flutter_test_project/data/network/network_api_service.dart';
import 'package:itgrow_flutter_test_project/data/repositories/auth_repository_impl.dart';
import 'package:itgrow_flutter_test_project/data/repositories/login_repository_impl.dart';
import 'package:itgrow_flutter_test_project/data/repositories/main_repository_impl.dart';
import 'package:itgrow_flutter_test_project/data/repositories/profile_repository_impl.dart';
import 'package:itgrow_flutter_test_project/data/repositories/trades_repository_impl.dart';
import 'package:itgrow_flutter_test_project/domain/repositories/auth_repository.dart';
import 'package:itgrow_flutter_test_project/domain/repositories/login_repository.dart';
import 'package:itgrow_flutter_test_project/domain/repositories/main_repository.dart';
import 'package:itgrow_flutter_test_project/domain/repositories/profile_repository.dart';
import 'package:itgrow_flutter_test_project/domain/repositories/trades_repository.dart';
import 'package:itgrow_flutter_test_project/domain/usecases/auth_usecase.dart';
import 'package:itgrow_flutter_test_project/domain/usecases/auth_usecase_impl.dart';
import 'package:itgrow_flutter_test_project/domain/usecases/login_usecase.dart';
import 'package:itgrow_flutter_test_project/domain/usecases/login_usecase_impl.dart';
import 'package:itgrow_flutter_test_project/domain/usecases/profile_usecase.dart';
import 'package:itgrow_flutter_test_project/domain/usecases/profile_usecase_impl.dart';
import 'package:itgrow_flutter_test_project/domain/usecases/trades_usecase.dart';
import 'package:itgrow_flutter_test_project/domain/usecases/trades_usecase_impl.dart';
import 'package:itgrow_flutter_test_project/viewmodel/auth/auth_viewmodel.dart';
import 'package:itgrow_flutter_test_project/viewmodel/auth/login_viewmodel.dart';
import 'package:itgrow_flutter_test_project/viewmodel/base/main_viewmodel.dart';
import 'package:itgrow_flutter_test_project/viewmodel/profile_viewmodel.dart';
import 'package:itgrow_flutter_test_project/viewmodel/tades_viewmodel.dart';
import 'package:itgrow_flutter_test_project/viewmodel/user_viewmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

final instance = GetIt.instance;
Future<void> initAppModule() async{
  final sharedPreferences = await SharedPreferences.getInstance();

  // shared prefs instance
  instance.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  // app prefs instance
  instance.registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));

  // network api service instance
  instance.registerLazySingleton<BaseApiService>(() => NetworkApiService());

  //init modules
  initMainModule(); //Main
  initLoginModule();  //Login
  initAuthModule(); //Auth
  initUserModule(); //User
  initProfileModule();  //Profile
  initTradesModule();  //Trades
}

initMainModule(){
  // main repository instance
  instance.registerLazySingleton<MainRepository>(() => MainRepositoryImpl(instance()));

  // main viewmodel instance
  instance.registerLazySingleton<MainViewmodel>(() => MainViewmodel());
}

// Login Module
initLoginModule(){
  // login data source instance
  instance.registerLazySingleton<LoginDataSource>(() => LoginDataSourceImpl(instance()));

  // login repository instance
  instance.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl(instance()));

  // login usecase instance
  instance.registerLazySingleton<LoginUseCase>(() => LoginUseCaseImpl(instance()));

  // login viewmodel instance
  instance.registerLazySingleton<LoginViewmodel>(() => LoginViewmodel(instance(), instance()));
}

// Authentication Module
initAuthModule(){
  // auth data source instance
  instance.registerLazySingleton<AuthDataSource>(() => AuthDataSourceImpl(instance()));

  // auth repository instance
  instance.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(instance()));

  // auth usecase instance
  instance.registerLazySingleton<AuthUseCase>(() => AuthUseCaseImpl(instance()));

  // auth viewmodel instance
  instance.registerLazySingleton<AuthViewmodel>(() => AuthViewmodel(instance()));
}

// Trades Module
initTradesModule(){
  // trades data source instance
  instance.registerLazySingleton<TradesDataSource>(() => TradesDataSourceImpl(instance()));

  // trades repository instance
  instance.registerLazySingleton<TradesRepository>(() => TradesRepositoryImpl(instance()));

  // trades usecase instance
  instance.registerLazySingleton<TradesUseCase>(() => TradesUseCaseImpl(instance()));

  // trades viewmodel instance
  instance.registerLazySingleton<TradesViewmodel>(() => TradesViewmodel(instance()));
}

// Profile Module
initProfileModule(){
  // profile data source instance
  instance.registerLazySingleton<ProfileDataSource>(() => ProfileDataSourceImpl(instance()));

  // profile repository instance
  instance.registerLazySingleton<ProfileRepository>(() => ProfileRepositoryImpl(instance()));

  // profile usecase instance
  instance.registerLazySingleton<ProfileUseCase>(() => ProfileUseCaseImpl(instance()));

  // profile viewmodel instance
  instance.registerLazySingleton<ProfileViewmodel>(() => ProfileViewmodel(instance(), instance(), instance()));
}

initUserModule(){
  // User viewmodel instance
  instance.registerLazySingleton<UserViewmodel>(() => UserViewmodel());
}