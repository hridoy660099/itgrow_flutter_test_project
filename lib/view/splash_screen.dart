import 'package:flutter/material.dart';
import 'package:itgrow_flutter_test_project/res/app_colors.dart';
import 'package:itgrow_flutter_test_project/res/app_strings.dart';
import 'package:itgrow_flutter_test_project/res/app_values.dart';
import 'package:itgrow_flutter_test_project/viewmodel/services/splash_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late SplashService _splashService;

  @override
  void initState() {
    _splashService = SplashService();
    super.initState();

    _splashService.checkAuthentication(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: CircularProgressIndicator(color: AppColors.primaryColor.withOpacity(AppOpacities.op0_9) ,),
          ),
          const SizedBox(height: AppSizes.s32,),
          const Text(AppStrings.splashTitle, style: TextStyle(
            fontWeight: FontWeight.bold,
          ),),
        ],
      ),
    );
  }
}