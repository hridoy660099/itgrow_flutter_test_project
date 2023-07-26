import 'package:flutter/material.dart';
import 'package:itgrow_flutter_test_project/app/di.dart';
import 'package:itgrow_flutter_test_project/res/app_colors.dart';
import 'package:itgrow_flutter_test_project/utils/routes/route_manager.dart';
import 'package:itgrow_flutter_test_project/utils/routes/routes.dart';
import 'package:itgrow_flutter_test_project/viewmodel/auth/auth_viewmodel.dart';
import 'package:itgrow_flutter_test_project/viewmodel/auth/login_viewmodel.dart';
import 'package:itgrow_flutter_test_project/viewmodel/base/main_viewmodel.dart';
import 'package:itgrow_flutter_test_project/viewmodel/profile_viewmodel.dart';
import 'package:itgrow_flutter_test_project/viewmodel/tades_viewmodel.dart';
import 'package:itgrow_flutter_test_project/viewmodel/user_viewmodel.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // start
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => instance<AuthViewmodel>()),
        ChangeNotifierProvider(create: (_) => instance<UserViewmodel>()),
        ChangeNotifierProvider(create: (_) => instance<LoginViewmodel>()),
        ChangeNotifierProvider(create: (_) => instance<MainViewmodel>()),
        ChangeNotifierProvider(create: (_) => instance<ProfileViewmodel>()),
        ChangeNotifierProvider(create: (_) => instance<TradesViewmodel>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'IT Grow Division Ltd. Project',
        scrollBehavior: const ScrollBehavior().copyWith(scrollbars: false),
        theme: ThemeData(
          primarySwatch: Colors.red,
          primaryColor: AppColors.primaryDeepColor,
        ),
        // home: const LoginScreen(),
        initialRoute: Routes.splashScreen,
        onGenerateRoute: RouteManager.generateRoute,
      ),
    );
  }
}