
import 'package:flutter/material.dart';
import 'package:itgrow_flutter_test_project/res/app_colors.dart';
import 'package:itgrow_flutter_test_project/res/app_values.dart';
import 'package:itgrow_flutter_test_project/utils/utils.dart';

class PasswordInputBoxOutlined extends StatelessWidget {
  const PasswordInputBoxOutlined({
    super.key,
    required TextEditingController passwordController,
    required FocusNode passwordFocusNode,
    required ValueNotifier<bool> obscurePassword,
    this.hintText,
    required this.labelText,
    required ValueNotifier<bool> isFocusChanged,
    this.nextFocusNode,
    this.isTheLastField = false,
    this.prefixIcon = const Icon(Icons.lock_open_outlined),
  })  : _passwordController = passwordController,
        _passwordFocusNode = passwordFocusNode,
        _obscurePassword = obscurePassword,
        _isFocusChanged = isFocusChanged;

  final TextEditingController _passwordController;
  final FocusNode _passwordFocusNode;
  final ValueNotifier<bool> _obscurePassword;
  final String? hintText;
  final String labelText;
  final Icon prefixIcon;
  final FocusNode? nextFocusNode;
  final bool isTheLastField;
  final ValueNotifier<bool> _isFocusChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: AppMargins.m32,
      ),
      child: TextFormField(
        controller: _passwordController,
        focusNode: _passwordFocusNode,
        obscureText: _obscurePassword.value,
        obscuringCharacter: '*',
        onFieldSubmitted: isTheLastField
            ? null
            : (value) {
          Utils.changeFieldFocus(
              context, _passwordFocusNode, nextFocusNode!);
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "$labelText is required";
          }
          return null;
        },
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          // labelStyle: TextStyle(color: AppColor.primaryDeeperColor),
          // border: UnderlineInputBorder(borderSide: BorderSide(color: AppColor.primaryDeeperColor)),
          prefixIconColor: AppColors.primaryDeeperColor.withOpacity(0.7),
          prefixIcon: prefixIcon,
          filled: false,
          fillColor: AppColors.appBackgroundColor,
          floatingLabelStyle:
          const TextStyle(color: AppColors.primaryDeeperColor),
          // border: InputBorder.none,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.primaryDeeperColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.greyColor.withOpacity(AppOpacities.op0_2),
            ),
          ),
          suffixIcon: ValueListenableBuilder(
            valueListenable: _isFocusChanged,
            builder: (context, value, child) {
              return InkWell(
                borderRadius: BorderRadius.circular(AppSizes.s100),
                onTap: () {
                  _obscurePassword.value = !_obscurePassword.value;
                },
                focusColor: AppColors.primaryDeeperColor,
                onFocusChange: (value) {
                  _isFocusChanged.value = value;
                },
                child: _obscurePassword.value
                    ? Icon(
                  Icons.visibility_off_outlined,
                  color:
                  value ? AppColors.primaryDeeperColor : Colors.grey,
                )
                    : const Icon(
                  Icons.visibility,
                  color: AppColors.primaryDeeperColor,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
