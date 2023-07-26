import 'package:flutter/material.dart';
import 'package:itgrow_flutter_test_project/res/app_colors.dart';
import 'package:itgrow_flutter_test_project/res/app_strings.dart';
import 'package:itgrow_flutter_test_project/res/app_values.dart';

class ScreenTitle extends StatelessWidget {
  final String title;
  const ScreenTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => AppColors.primaryGradient.createShader(bounds),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            text: AppStrings.empty.toUpperCase(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: AppSizes.s16,
            ),
            children: [
              TextSpan(
                text: title.toUpperCase(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: AppSizes.s20,
                ),
              ),
            ]),
      ),
    );
  }
}