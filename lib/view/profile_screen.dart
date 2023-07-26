
import 'package:flutter/material.dart';
import 'package:itgrow_flutter_test_project/config/size_config.dart';
import 'package:itgrow_flutter_test_project/res/app_colors.dart';
import 'package:itgrow_flutter_test_project/res/app_strings.dart';
import 'package:itgrow_flutter_test_project/res/app_values.dart';
import 'package:itgrow_flutter_test_project/res/components/screen_title.dart';
import 'package:itgrow_flutter_test_project/viewmodel/profile_viewmodel.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late final ProfileViewmodel _profileViewmodel;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _nationalityController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  Future _getProfile(BuildContext context) async {
    await _profileViewmodel.getAccountInfo(context);
  }

  @override
  void initState() {
    _profileViewmodel = Provider.of<ProfileViewmodel>(context, listen: false);

    super.initState();

    _getProfile(context);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _mobileController.dispose();
    _nationalityController.dispose();
    _addressController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      body: SingleChildScrollView(
        child: Consumer<ProfileViewmodel>(
          builder: (context, viewmodel, _) {
            return StreamBuilder<bool>(
                stream: viewmodel.isLoadingStream,
                builder: (context, isLoading) {
                  debugPrint(
                      "loading profile connection state: ${isLoading.connectionState}");
                  debugPrint("is loading profile: ${viewmodel.isLoading}");

                  if (viewmodel.isLoading == true ||
                      isLoading.connectionState ==
                          ConnectionState.waiting) {
                    return Column(
                      children: [
                        SizedBox(height: SizeConfig.getHeight(context) / AppDoubles.d2_5,),
                        const Center(
                            child: CircularProgressIndicator(color: AppColors.primaryColor,)),
                      ],
                    );
                  } else {
                    if (viewmodel.lastFourDigitsOfPhone!.isEmpty || viewmodel.lastFourDigitsOfPhone == null) {
                      return _emptyViewWidget();
                    } else {
                      return _profileView(viewmodel);
                    }
                  }
                });
          },
        ),
      ),
    );
  }

  Widget _emptyViewWidget() {
    return const Center(
      child: Opacity(
        opacity: AppOpacities.op0_1,
        child: Icon(Icons.list_alt_outlined),
      ),
    );
  }

  Column _profileView(ProfileViewmodel viewmodel) {
    return Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: AppSizes.s16,
                ),

                // Screen Title
                const ScreenTitle(title: AppStrings.accountTitle),

                const SizedBox(
                  height: AppSizes.s8,
                ),

                const SizedBox(
                  height: AppSizes.s8,
                ),

                // Contents
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.primaryDeepColor
                        .withOpacity(AppOpacities.op0_02),
                  ),
                  child: Column(
                    children: [
                      //Name
                      buildProfileItem(
                        AppStrings.name,
                        viewmodel.accountInfo?.name,
                        false,
                        leadingIconData: Icons.person_outline,
                      ),
                      Container(
                        height: AppSizes.s0_4,
                        color: AppColors.greyColor
                            .withOpacity(AppOpacities.op0_2),
                      ),

                      // Balance
                      buildProfileItem(
                        AppStrings.balance,
                        viewmodel.accountInfo?.balance.toString(),
                        true,
                        leadingIconData: Icons.account_balance_outlined,
                      ),
                      Container(
                        height: AppSizes.s0_4,
                        color: AppColors.greyColor
                            .withOpacity(AppOpacities.op0_2),
                      ),

                      //Phone No.
                      buildProfileItem(
                        AppStrings.phone,
                        "${viewmodel.lastFourDigitsOfPhone}",
                        false,
                        leadingIconData: Icons.phone_android_outlined,
                      ),
                      Container(
                        height: AppSizes.s0_4,
                        color: AppColors.greyColor
                            .withOpacity(AppOpacities.op0_2),
                      ),

                      //Address
                      buildProfileItem(
                        AppStrings.address,
                        viewmodel.accountInfo?.address,
                        false,
                        leadingIconData: Icons.location_on_outlined,
                      ),
                      Container(
                        height: AppSizes.s0_4,
                        color: AppColors.greyColor
                            .withOpacity(AppOpacities.op0_2),
                      ),

                      // City
                      buildProfileItem(
                        AppStrings.city,
                        viewmodel.accountInfo?.city,
                        false,
                        leadingIconData: Icons.location_on_outlined,
                      ),
                      Container(
                        height: AppSizes.s0_4,
                        color: AppColors.greyColor
                            .withOpacity(AppOpacities.op0_2),
                      ),

                      // Country
                      buildProfileItem(
                        AppStrings.country,
                        viewmodel.accountInfo?.country,
                        true,
                        leadingIconData: Icons.flag_outlined,
                      ),
                      Container(
                        height: AppSizes.s0_4,
                        color: AppColors.greyColor
                            .withOpacity(AppOpacities.op0_2),
                      ),

                      // Currency
                      buildProfileItem(
                        AppStrings.currency,
                        viewmodel.accountInfo?.currency.toString(),
                        true,
                        leadingIconData: Icons.currency_exchange_outlined,
                      ),
                      Container(
                        height: AppSizes.s0_4,
                        color: AppColors.greyColor
                            .withOpacity(AppOpacities.op0_2),
                      ),

                      // Current Trades Count
                      buildProfileItem(
                        AppStrings.currentTradesCount,
                        viewmodel.accountInfo?.currentTradesCount.toString(),
                        true,
                        leadingIconData: Icons.info_outline,
                      ),
                      Container(
                        height: AppSizes.s0_4,
                        color: AppColors.greyColor
                            .withOpacity(AppOpacities.op0_2),
                      ),

                      // Current Trades Volume
                      buildProfileItem(
                        AppStrings.currentTradesVolume,
                        viewmodel.accountInfo?.currentTradesVolume.toString(),
                        true,
                        leadingIconData: Icons.info_outline,
                      ),
                      Container(
                        height: AppSizes.s0_4,
                        color: AppColors.greyColor
                            .withOpacity(AppOpacities.op0_2),
                      ),

                      // Equity
                      buildProfileItem(
                        AppStrings.equity,
                        viewmodel.accountInfo?.equity.toString(),
                        true,
                        leadingIconData: Icons.info_outline,
                      ),
                      Container(
                        height: AppSizes.s0_4,
                        color: AppColors.greyColor
                            .withOpacity(AppOpacities.op0_2),
                      ),

                      // Free Margin
                      buildProfileItem(
                        AppStrings.freshMargin,
                        viewmodel.accountInfo?.freeMargin.toString(),
                        true,
                        leadingIconData: Icons.info_outline,
                      ),
                      Container(
                        height: AppSizes.s0_4,
                        color: AppColors.greyColor
                            .withOpacity(AppOpacities.op0_2),
                      ),

                      // Is any open trades
                      buildProfileItem(
                        AppStrings.isAnyOpenTrades,
                        viewmodel.accountInfo?.isAnyOpenTrades.toString(),
                        true,
                        leadingIconData: Icons.info_outline,
                      ),
                      Container(
                        height: AppSizes.s0_4,
                        color: AppColors.greyColor
                            .withOpacity(AppOpacities.op0_2),
                      ),

                      // Is swap free
                      buildProfileItem(
                        AppStrings.isSwapFree,
                        viewmodel.accountInfo?.isSwapFree.toString(),
                        true,
                        leadingIconData: Icons.info_outline,
                      ),
                      Container(
                        height: AppSizes.s0_4,
                        color: AppColors.greyColor
                            .withOpacity(AppOpacities.op0_2),
                      ),

                      // Leverage
                      buildProfileItem(
                        AppStrings.leverage,
                        viewmodel.accountInfo?.leverage.toString(),
                        true,
                        leadingIconData: Icons.info_outline,
                      ),
                      Container(
                        height: AppSizes.s0_4,
                        color: AppColors.greyColor
                            .withOpacity(AppOpacities.op0_2),
                      ),

                      // Total Trade count
                      buildProfileItem(
                        AppStrings.totalTradesCount,
                        viewmodel.accountInfo?.totalTradesCount.toString(),
                        true,
                        leadingIconData: Icons.info_outline,
                      ),
                      Container(
                        height: AppSizes.s0_4,
                        color: AppColors.greyColor
                            .withOpacity(AppOpacities.op0_2),
                      ),

                      // Total Trade volume
                      buildProfileItem(
                        AppStrings.totalTradesVolume,
                        viewmodel.accountInfo?.totalTradesVolume.toString(),
                        true,
                        leadingIconData: Icons.info_outline,
                      ),
                      Container(
                        height: AppSizes.s0_4,
                        color: AppColors.greyColor
                            .withOpacity(AppOpacities.op0_2),
                      ),

                      // Type
                      buildProfileItem(
                        AppStrings.type,
                        viewmodel.accountInfo?.type.toString(),
                        true,
                        leadingIconData: Icons.info_outline,
                      ),
                      Container(
                        height: AppSizes.s0_4,
                        color: AppColors.greyColor
                            .withOpacity(AppOpacities.op0_2),
                      ),

                      // Verification Level
                      buildProfileItem(
                        AppStrings.verificationLevel,
                        viewmodel.accountInfo?.verificationLevel.toString(),
                        true,
                        leadingIconData: Icons.info_outline,
                      ),
                      Container(
                        height: AppSizes.s0_4,
                        color: AppColors.greyColor
                            .withOpacity(AppOpacities.op0_2),
                      ),

                      // Zip code
                      buildProfileItem(
                        AppStrings.zipCode,
                        viewmodel.accountInfo?.zipCode.toString(),
                        true,
                        leadingIconData: Icons.info_outline,
                      ),
                      Container(
                        height: AppSizes.s0_4,
                        color: AppColors.greyColor
                            .withOpacity(AppOpacities.op0_2),
                      ),

                      // Container(height: AppSizes.s0_4,color: AppColor.greyColor.withOpacity(AppOpacities.op0_2),),

                      const SizedBox(
                        // height: AppSizes.s16,
                      ),
                    ],
                  ),
                ),
              ],
            );
  }

  Widget buildProfileItem(String title, String? value, bool isDisabled,
      {IconData? leadingIconData}) {
    return AbsorbPointer(
      absorbing: isDisabled,
      child: ListTile(
        title: Text(
          title.toString(),
        ),
        subtitle: Text(
          value.toString(),
        ),
        leading: leadingIconData == null ? null : Icon(leadingIconData),
      ),
    );
  }
}
