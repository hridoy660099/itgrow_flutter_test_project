import 'package:flutter/material.dart';
import 'package:itgrow_flutter_test_project/res/app_strings.dart';
import 'package:itgrow_flutter_test_project/utils/routes/routes.dart';
import 'package:itgrow_flutter_test_project/view/home_screen.dart';
import 'package:itgrow_flutter_test_project/view/login_screen.dart';
import 'package:itgrow_flutter_test_project/view/main_screen.dart';
import 'package:itgrow_flutter_test_project/view/profile_screen.dart';
import 'package:itgrow_flutter_test_project/view/splash_screen.dart';
import 'package:itgrow_flutter_test_project/view/trades_screen.dart';

class RouteManager{
  static Route<dynamic> generateRoute(RouteSettings settings){

    switch(settings.name){
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (BuildContext context) => const SplashScreen());
      case Routes.mainScreen:
        return MaterialPageRoute(builder: (BuildContext context) => const MainScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (BuildContext context) => const LoginScreen());
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (BuildContext context) => const HomeScreen());
      case Routes.profileScreen:
        return MaterialPageRoute(builder: (BuildContext context) => const ProfileScreen());
      case Routes.tradesScreen:
        return MaterialPageRoute(builder: (BuildContext context) => const TradesScreen());

      default:
        return MaterialPageRoute(builder: (_){
          return const Scaffold(
            body: Center(
              child: Text(
                AppStrings.routeNotFoundMessage,
              ),
            ),
          );
        });
    }
  }
}