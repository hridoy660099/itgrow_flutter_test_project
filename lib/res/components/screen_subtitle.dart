import 'package:flutter/material.dart';
import 'package:itgrow_flutter_test_project/res/app_colors.dart';
import 'package:itgrow_flutter_test_project/res/app_values.dart';

class ScreenSubtitle extends StatelessWidget {

  final String subtitle;
  final double? fontSize;
  final Color? textColor;

  const ScreenSubtitle({
    super.key,
    required this.subtitle, this.fontSize = 14, this.textColor = AppColors.primaryTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      subtitle,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: textColor?.withOpacity(AppOpacities.op0_5),
          fontSize: fontSize
      ),
    );
  }
}