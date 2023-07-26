import 'package:flutter/material.dart';
import 'package:itgrow_flutter_test_project/res/app_colors.dart';
import 'package:itgrow_flutter_test_project/res/app_values.dart';

class SubmitButton extends StatelessWidget {
  final String title;
  final bool isLoading;
  final Color color;
  final VoidCallback onTap;

  const SubmitButton({
    Key? key,
    required this.title,
    this.isLoading = false,
    required this.onTap, this.color = AppColors.submitButtonColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      radius: AppSizes.s100,
      child: Container(
        height: AppSizes.s40,
        width: double.maxFinite,
        clipBehavior: Clip.antiAlias,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: AppColors.primaryGradient,
          borderRadius: BorderRadius.circular(AppSizes.s100),
        ),
        child: isLoading? const CircularProgressIndicator(color: AppColors.submitButtonTextColor,) : Text(
          title.toUpperCase(),
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: AppColors.submitButtonTextColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}