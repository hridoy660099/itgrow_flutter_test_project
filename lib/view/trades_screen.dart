import 'package:flutter/material.dart';
import 'package:itgrow_flutter_test_project/res/app_colors.dart';
import 'package:itgrow_flutter_test_project/res/app_strings.dart';
import 'package:itgrow_flutter_test_project/res/app_values.dart';
import 'package:itgrow_flutter_test_project/res/components/screen_subtitle.dart';
import 'package:itgrow_flutter_test_project/res/components/screen_title.dart';
import 'package:itgrow_flutter_test_project/utils/routes/routes.dart';
import 'package:itgrow_flutter_test_project/viewmodel/tades_viewmodel.dart';
import 'package:provider/provider.dart';

class TradesScreen extends StatefulWidget {
  const TradesScreen({Key? key}) : super(key: key);

  @override
  State<TradesScreen> createState() => _TradesScreenState();
}

class _TradesScreenState extends State<TradesScreen> {
  late TradesViewmodel _tradesViewmodel;

  Future<void> _getTrades(BuildContext context) async {
    await _tradesViewmodel.getTrades(context);
  }

  @override
  void initState() {
    _tradesViewmodel = Provider.of<TradesViewmodel>(context, listen: false);

    super.initState();

    _getTrades(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.appBackgroundColor,
        appBar: AppBar(
          elevation: AppDoubles.d1,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: AppColors.primaryTextColor,
            // Change this to the desired color
            onPressed: () => Navigator.pop(context),
          ),
          backgroundColor: AppColors.appBackgroundColor,
          actions: [
            InkWell(
              borderRadius: BorderRadius.circular(AppSizes.s100),
              radius: AppSizes.s100,
              onTap: () {
                _tradesViewmodel.logout(context).then((value) {
                  Navigator.pushNamed(context, Routes.loginScreen);
                });
              },
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(AppSizes.s8),
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    // border: Border.all(color: AppColor.primaryDeepColor,width: 1,),
                    // color: AppColor.whiteColor
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
        body: Consumer<TradesViewmodel>(
          builder: (context, viewmodel, _) {
            Future.microtask((){
              Future.delayed(const Duration(seconds: 1), () => viewmodel.calculateProfit(),);
            });
            return RefreshIndicator(
              onRefresh: () async{
                viewmodel.getTrades(context);

              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: AppSizes.s16,
                  ),

                  //Screen Title
                  const ScreenTitle(title: AppStrings.tradesTitle),

                  ScreenSubtitle(subtitle: AppStrings.totalProfit + AppStrings.colon + AppStrings.blankSpace + viewmodel.totalProfit.toString()),

                  const SizedBox(
                    height: AppSizes.s16,
                  ),

                  Expanded(
                    child: StreamBuilder<bool>(
                        stream: viewmodel.isLoadingStream,
                        builder: (context, isLoading) {
                          debugPrint(
                              "loading history connection state: ${isLoading.connectionState}");

                          if (viewmodel.isLoading == true ||
                              isLoading.connectionState ==
                                  ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator(color: AppColors.primaryColor,));
                          } else {
                            if (viewmodel.trades.isEmpty) {
                              return _emptyViewWidget();
                            } else {
                              return _tradesWidget();
                            }
                          }
                        }),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  ListView _tradesWidget() {
    return ListView.builder(
        itemCount: _tradesViewmodel.trades.length,
        shrinkWrap: true,
        // reverse: true,
        physics: const BouncingScrollPhysics(),

        itemBuilder: (context, index) {
          return Column(
            children: [
              Card(
                margin: const EdgeInsets.symmetric(
                  horizontal: AppMargins.m16,
                  vertical: AppMargins.m2,
                ),
                // color: AppColors.secondaryColor.withOpacity(AppOpacities.op0_8),
                shadowColor:
                    AppColors.primaryDeeperColor.withOpacity(AppOpacities.op0_2),
                clipBehavior: Clip.antiAlias,
                child: Container(
                  padding: const EdgeInsets.only(
                    left: AppPaddings.p16,
                    top: AppPaddings.p16,
                    bottom: AppPaddings.p16,
                    right: AppPaddings.p8,
                  ),
                  child: Column(
                    children: [
                      tradeItem(index, AppStrings.currentPrice, _tradesViewmodel.trades.elementAt(index).currentPrice.toString()),
                      const SizedBox(height: AppSizes.s8,),
                      tradeItem(index, AppStrings.comment, _tradesViewmodel.trades.elementAt(index).comment.toString()),
                      const SizedBox(height: AppSizes.s8,),
                      tradeItem(index, AppStrings.digits, _tradesViewmodel.trades.elementAt(index).digits.toString()),
                      const SizedBox(height: AppSizes.s8,),
                      tradeItem(index, AppStrings.login, _tradesViewmodel.trades.elementAt(index).login.toString()),
                      const SizedBox(height: AppSizes.s8,),
                      tradeItem(index, AppStrings.openPrice, _tradesViewmodel.trades.elementAt(index).openPrice.toString()),
                      const SizedBox(height: AppSizes.s8,),
                      tradeItem(index, AppStrings.openTime, _tradesViewmodel.trades.elementAt(index).openTime.toString()),
                      const SizedBox(height: AppSizes.s8,),
                      tradeItem(index, AppStrings.profit, _tradesViewmodel.trades.elementAt(index).profit.toString()),
                      const SizedBox(height: AppSizes.s8,),
                      tradeItem(index, AppStrings.sl, _tradesViewmodel.trades.elementAt(index).sl.toString()),
                      const SizedBox(height: AppSizes.s8,),
                      tradeItem(index, AppStrings.swaps, _tradesViewmodel.trades.elementAt(index).swaps.toString()),
                      const SizedBox(height: AppSizes.s8,),
                      tradeItem(index, AppStrings.symbol, _tradesViewmodel.trades.elementAt(index).symbol.toString()),
                      const SizedBox(height: AppSizes.s8,),
                      tradeItem(index, AppStrings.tp, _tradesViewmodel.trades.elementAt(index).tp.toString()),
                      const SizedBox(height: AppSizes.s8,),
                      tradeItem(index, AppStrings.ticket, _tradesViewmodel.trades.elementAt(index).ticket.toString()),
                      const SizedBox(height: AppSizes.s8,),
                      tradeItem(index, AppStrings.type, _tradesViewmodel.trades.elementAt(index).type.toString()),
                      const SizedBox(height: AppSizes.s8,),
                      tradeItem(index, AppStrings.volume, _tradesViewmodel.trades.elementAt(index).volume.toString()),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: AppSizes.s8,),
            ],
          );
        });
  }

  Row tradeItem(int index, String title, String value) {
    return Row(
      children: [
        Expanded(
          flex: 1,
            child: Text(title)),
        const Text(AppStrings.colon + AppStrings.blankSpace + AppStrings.blankSpace),
        Expanded(
          flex: 2,
            child: Text(value)),
      ],
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
}
