
import 'package:flutter/material.dart';
import 'package:itgrow_flutter_test_project/res/app_colors.dart';
import 'package:itgrow_flutter_test_project/res/app_values.dart';
import 'package:itgrow_flutter_test_project/utils/utils.dart';

class InputBoxOutlined extends StatelessWidget {
  InputBoxOutlined({
    super.key,
    TextEditingController? inputController,
    FocusNode? currentFocusNode,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    FocusNode? nextFocusNode,
    this.isTheLastField = false,
    this.isReadOnly = false,
    this.inputType,
    this.autoFocus = false,
    this.marginHorizontal = AppMargins.m32,
    this.maxLines = AppIntegers.i4, this.suffixIcon, this.suffixIconTap, this.isError,

  })  : _inputController = inputController,
        _currentFocusNode = currentFocusNode!,
        _nextFocusNode = nextFocusNode;

  final TextEditingController? _inputController;
  final FocusNode _currentFocusNode;
  final String? hintText;
  final String? labelText;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final VoidCallback? suffixIconTap;
  final FocusNode? _nextFocusNode;
  final bool isTheLastField;
  final bool isReadOnly;
  final TextInputType? inputType;
  final int? maxLines;
  final bool autoFocus;
  final double marginHorizontal;
  final bool? isError;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: marginHorizontal,
      ),
      child: TextFormField(
        // enabled: isEnabled,
        autofocus: autoFocus,
        maxLines: maxLines,
        minLines: 1,
        readOnly: isReadOnly,
        controller: _inputController,
        keyboardType: inputType,
        focusNode: _currentFocusNode,
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          prefixIcon: prefixIcon,
          // errorText: _errorText,
          prefixIconColor:
          AppColors.primaryDeeperColor.withOpacity(AppOpacities.op0_7),
          suffixIcon: suffixIcon,
          filled: false,
          fillColor: AppColors.appBackgroundColor,
          // errorText: isError == true ? "required" : null,
          // border: InputBorder.none,
          floatingLabelStyle:
          const TextStyle(color: AppColors.primaryDeeperColor),
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

        ),
        onFieldSubmitted: isTheLastField
            ? null
            : (value) {
          Utils.changeFieldFocus(
              context, _currentFocusNode, _nextFocusNode!);
        },
        validator: _validate,
      ),
    );
  }

  String? _validate(String? value) {
    if (value == null || value.isEmpty) {
      return "$labelText is required";
    }
    return null;
  }

  String? get _errorText {
    // at any time, we can get the text from _controller.value.text
    final text = _inputController?.text;
    // Note: you can do your own custom validation here
    // Move this logic this outside the widget for more testable code
    if (text!.isEmpty) {
      return 'Can\'t be empty';
    }
    if (text.length < 4) {
      return 'Too short';
    }
    // return null if the text is valid
    return null;
  }
}
