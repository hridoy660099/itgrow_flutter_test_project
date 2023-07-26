
import 'package:flutter/material.dart';
import 'package:itgrow_flutter_test_project/res/app_colors.dart';
import 'package:itgrow_flutter_test_project/res/app_strings.dart';
import 'package:itgrow_flutter_test_project/res/app_values.dart';
import 'package:itgrow_flutter_test_project/res/components/screen_subtitle.dart';
import 'package:itgrow_flutter_test_project/res/components/screen_title.dart';
import 'package:itgrow_flutter_test_project/utils/routes/routes.dart';
import 'package:itgrow_flutter_test_project/viewmodel/auth/login_viewmodel.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _itemsTitle = ["Trades"];

  @override
  Widget build(BuildContext context) {
    final screenHeight =
        MediaQuery.of(context).size.height * AppScaleFactors.sf1;
    LoginViewmodel loginViewmodel = Provider.of<LoginViewmodel>(context);

    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      body: Column(
        children: [
          SizedBox(
            height: screenHeight * AppScaleFactors.sf0_14,
          ),

          //Title
          const ScreenTitle(title: AppStrings.homeTitle),

          // Screen Subtitle
          const ScreenSubtitle(subtitle: AppStrings.homeSubtitle),

          SizedBox(
            height: screenHeight * AppScaleFactors.sf0_1,
          ),

          //Menu Items
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPaddings.p64),
              child: GridView.builder(
                itemCount: _itemsTitle.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                ),
                itemBuilder: (context, index) {
                  return _menuItemButton(
                      context,
                      screenHeight,
                      loginViewmodel,
                      title: _itemsTitle[index].toUpperCase(),
                      onTap: () {
                        switch(index){
                          case 0:
                            Navigator.pushNamed(context, Routes.tradesScreen);
                          default:
                            break;
                        }
                      }
                  );
                },
              ),
            ),
          ),

          SizedBox(
            height: screenHeight * AppScaleFactors.sf0_01,
          ),
        ],
      ),
    );
  }

  Widget _menuItemButton(BuildContext context, double screenHeight,
      LoginViewmodel loginViewmodel, {VoidCallback? onTap, String title = "Item"}) {
    return Card(

      elevation: AppDoubles.d4,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.s8),
      ),
      shadowColor:
      AppColors.primaryDeeperColor.withOpacity(AppOpacities.op0_2),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppSizes.s8),
        splashColor:
        AppColors.primaryDeepColor.withOpacity(AppOpacities.op0_2),
        onTap: onTap,
        child: SizedBox(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.money_outlined,
                color: AppColors.primaryDeepColor
                    .withOpacity(AppOpacities.op0_7),
              ),
              SizedBox(
                height: screenHeight * AppScaleFactors.sf0_02,
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: AppSizes.s18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryTextColor
                      .withOpacity(AppOpacities.op1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
