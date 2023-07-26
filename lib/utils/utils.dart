
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:itgrow_flutter_test_project/res/app_values.dart';

class Utils {

  static void changeFieldFocus(BuildContext context, FocusNode currentFocusNode, FocusNode nextFocusNode){
    currentFocusNode.unfocus();
    FocusScope.of(context).requestFocus(nextFocusNode);
  }

  static showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
    );
  }

  static showSuccessToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
    );
  }

  static showErrorToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
    );
  }

  static void showFlushbar(BuildContext context, String message) {
    showFlushbar(context, message);
  }

  static void showErrorFlushbar(
      BuildContext context,
      String? title,
      String message, {
        FlushbarPosition position = FlushbarPosition.TOP,
        Color backgroundColor = Colors.red,
        Color iconColor = Colors.white,
        Color textColor = Colors.white,
        actionText = "",
      }) {
    Flushbar flush;
    flush = Flushbar(
      title: title,
      message: message,

      margin: const EdgeInsets.symmetric(horizontal: AppMargins.m16, vertical: AppMargins.m16,),
      borderRadius: BorderRadius.circular(AppSizes.s8),

      duration: const Duration(seconds: 3),
      flushbarStyle: FlushbarStyle.FLOATING,
      flushbarPosition: position,
      backgroundColor: backgroundColor,
      reverseAnimationCurve: Curves.decelerate,
      forwardAnimationCurve: Curves.elasticOut,
      boxShadows: [
        BoxShadow(
            color: backgroundColor, offset: const Offset(0.0, 2.0), blurRadius: 3.0)
      ],

      icon: Icon(
        Icons.error_outline,
        color: iconColor,
      ),
      mainButton: TextButton(
        onPressed: () {
          // flush.dismiss(true);
        },
        child: Text(
          actionText,
          style: TextStyle(color: textColor),
        ),
      ),

      isDismissible: false,

      // positionOffset: 20,

      // leftBarIndicatorColor: Colors.white,

      showProgressIndicator: false,
      progressIndicatorBackgroundColor: Colors.blueGrey,
    );

    flush.show(context);
  }

  static void showSuccessFlushbar(
      BuildContext context,
      String? title,
      String message, {
        FlushbarPosition position = FlushbarPosition.TOP,
        Color backgroundColor = Colors.green,
        Color iconColor = Colors.white,
        Color textColor = Colors.white,
        actionText = "",
        int duration = 3,
      }) {
    Flushbar flush;
    flush = Flushbar(
      title: title,
      message: message,

      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      borderRadius: BorderRadius.circular(8),

      duration: const Duration(seconds: 3),
      flushbarStyle: FlushbarStyle.FLOATING,
      flushbarPosition: position,
      backgroundColor: backgroundColor,
      reverseAnimationCurve: Curves.decelerate,
      forwardAnimationCurve: Curves.elasticOut,
      boxShadows: [
        BoxShadow(
            color: backgroundColor, offset: const Offset(0.0, 2.0), blurRadius: 3.0)
      ],

      icon: Icon(
        Icons.check,
        color: iconColor,
      ),
      mainButton: TextButton(
        onPressed: () {
          // flush.dismiss(true);
        },
        child: Text(
          actionText,
          style: TextStyle(color: textColor),
        ),
      ),

      isDismissible: false,

      positionOffset: 20,
      showProgressIndicator: false,
      progressIndicatorBackgroundColor: Colors.blueGrey,
    );

    flush.show(context);
  }

  static showSnackbar(BuildContext context, String message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
        ),
      ),
    );
  }

  static showErrorSnackbar(BuildContext context, String message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
        ),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 1),
      ),
    );
  }

  static showSuccessSnackbar(BuildContext context, String message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
        ),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 1),
      ),
    );
  }
}
