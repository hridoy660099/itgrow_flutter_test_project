import 'package:flutter/material.dart';
import 'package:itgrow_flutter_test_project/res/app_colors.dart';
import 'package:itgrow_flutter_test_project/res/app_strings.dart';
import 'package:itgrow_flutter_test_project/res/app_values.dart';

Future<void> showAlertDialog({
  required BuildContext context,
  required String title,
  required String content,
  String positiveBtnText = AppStrings.yes,
  String negativeBtnText = AppStrings.no,
  Color backgroundColor = AppColors.appBackgroundColor,
  Color positiveBtnBgColor = AppColors.dangerColor,
  Color negativeBtnBgColor = AppColors.transparentColor,
  Color positiveBtnTextColor = AppColors.whiteColor,
  Color negativeBtnTextColor = AppColors.primaryTextColor,
  VoidCallback? positiveBtnOnTap,
  VoidCallback? negativeBtnOnTap,
  bool isPositiveBtnVisible = true,
  bool isNegativeBtnVisible = true,
}) async {
  return await showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        backgroundColor: backgroundColor,
        actions: [
          //Negative Button
          Visibility(
            visible: isNegativeBtnVisible,
            child: OutlinedButton(
              onPressed: negativeBtnOnTap,
              style: ElevatedButton.styleFrom(
                backgroundColor: negativeBtnBgColor,
              ),
              child: Text(
                negativeBtnText.toUpperCase(),
                style: TextStyle(
                  color: negativeBtnTextColor,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: AppSizes.s0,
          ),

          //Positive Button
          Visibility(
            visible: isPositiveBtnVisible,
            child: ElevatedButton(
              onPressed: positiveBtnOnTap,
              style: ElevatedButton.styleFrom(
                backgroundColor: positiveBtnBgColor,
              ),
              child: Text(positiveBtnText.toUpperCase()),
            ),
          ),
        ],
      );
    },
  );
}