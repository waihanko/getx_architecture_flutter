import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class AppUtils {
  static bool isLogout = false;
  static void showSnackBar({required String message, required String title}) {
    Get.snackbar(title, message, snackPosition: SnackPosition.BOTTOM);
  }

  static void showToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        fontSize: 16.0);
  }

  static showLoaderDialog({String? title}) {
    AlertDialog alert = AlertDialog(
      content: Row(
        children: [
          const CircularProgressIndicator(),
          Container(
            margin: const EdgeInsets.only(left: 7),
            child: Text(title ?? "Loading"),
          ),
        ],
      ),
    );
    Get.dialog(alert);
  }

  static hideAlertDialog() {
   Get.back();
  }
}
