import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:personal_budgeting/utils/color.dart';

class Utils {
  static void flushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          message: message,
          messageColor: Colors.white,
          backgroundColor: AppColor.primary,
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          borderRadius: BorderRadius.circular(10),
          icon: const Icon(
            Icons.error,
            color: Colors.red,
            size: 20,
          ),
          duration: const Duration(seconds: 3),
          positionOffset: 20,
          forwardAnimationCurve: Curves.decelerate,
        )..show(context));
  }

  static void successDialog(String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          message: message,
          messageColor: Colors.white,
          backgroundColor: AppColor.primary,
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          borderRadius: BorderRadius.circular(10),
          duration: const Duration(seconds: 3),
          positionOffset: 20,
          forwardAnimationCurve: Curves.decelerate,
        )..show(context));
  }

  static void toastMesg(String message){
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: AppColor.primary,
      textColor: AppColor.whiteColor,
      gravity: ToastGravity.BOTTOM,
    );
  }
}
