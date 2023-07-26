import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:itgrow_flutter_test_project/res/app_colors.dart';
import 'package:itgrow_flutter_test_project/res/app_strings.dart';
import 'package:itgrow_flutter_test_project/res/app_values.dart';
import 'package:itgrow_flutter_test_project/res/components/components.dart';
import 'package:itgrow_flutter_test_project/view/home_screen.dart';
import 'package:itgrow_flutter_test_project/view/profile_screen.dart';
import 'package:itgrow_flutter_test_project/viewmodel/base/main_viewmodel.dart';
import 'package:itgrow_flutter_test_project/viewmodel/profile_viewmodel.dart';
import 'package:provider/provider.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late final MainViewmodel _mainViewModel;
  late final ProfileViewmodel _profileViewmodel;

  Future _getAccountInfo() async {
    await _profileViewmodel.getAccountInfo(context);
  }

  @override
  void initState() {
    _mainViewModel = Provider.of<MainViewmodel>(context, listen: false);
    _profileViewmodel = Provider.of<ProfileViewmodel>(context, listen: false);

    _getAccountInfo();

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottomNavItems = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(
        icon: Icon(Icons.home_outlined),
        label: AppStrings.home,
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: AppStrings.account,
      ),
    ];
    final bottomNavViews = [
      const HomeScreen(),
      const ProfileScreen(),
    ];

    return WillPopScope(
      onWillPop: () async {
        bool willLeave = false;

        if (_scaffoldKey.currentState!.isDrawerOpen) {
          Navigator.pop(context);

          debugPrint("drawer is open");
          return Future.value(willLeave);
        }

        // Exit Popup
        await showAlertDialog(
          context: context,
          title: AppStrings.exit.toUpperCase(),
          content: AppStrings.exitWarning,
          negativeBtnOnTap: () {
            willLeave = false;
            Navigator.of(context).pop();
          },
          positiveBtnOnTap: () {
            willLeave = true;
            // Navigator.of(context).pop();
            SystemNavigator.pop();
          },
        );

        return Future.value(willLeave);
      },
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: AppColors.appBackgroundColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.appBackgroundColor,
          elevation: AppDoubles.d1,
          shadowColor:
          AppColors.primaryDeepColor.withOpacity(AppOpacities.op0_1),
          actions: [
            Consumer<ProfileViewmodel>(builder: (context, viewmodel, _) {
              return Container(
                alignment: Alignment.center,
                child: Text(
                  viewmodel.accountInfo?.name.toUpperCase() ??
                      AppStrings.empty,
                  style: TextStyle(
                    color: AppColors.primaryDeeperColor
                        .withOpacity(AppOpacities.op0_4),
                  ),
                ),
              );
            }),
            InkWell(
              borderRadius: BorderRadius.circular(AppSizes.s100),
              radius: AppSizes.s100,
              onTap: () async {
                // Logout Popup
                await showAlertDialog(
                  context: context,
                  title: AppStrings.logout.toUpperCase(),
                  content: AppStrings.logoutWarning,
                  negativeBtnOnTap: () {
                    Navigator.of(context).pop();
                  },
                  positiveBtnOnTap: () {
                    _mainViewModel.logout(context);
                  },
                );
              },
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(AppPaddings.p8),
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.logout_outlined,
                    color: AppColors.primaryDeepColor,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: AppSizes.s16,
            ),
          ],
        ),
        body: Consumer<MainViewmodel>(builder: (context, viewmodel, _) {
          return bottomNavViews
              .elementAt(_mainViewModel.selectedBottomNavItemIndex);
        }),
        bottomNavigationBar:
        Consumer<MainViewmodel>(builder: (context, viewmodel, _) {
          return BottomNavigationBar(
            items: bottomNavItems,
            selectedItemColor: AppColors.primaryDeepColor,
            backgroundColor: AppColors.appBackgroundColor,
            currentIndex: viewmodel.selectedBottomNavItemIndex,

            onTap: (index) {
              debugPrint(index.toString());
              viewmodel.setBottomNavCurrentIndex(index);
            },
          );
        }),
      ),
    );
  }
}
