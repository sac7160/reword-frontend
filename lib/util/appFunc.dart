import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void printLog(String strMsg) {
  if (kDebugMode) {
    print(strMsg);
  }
}

// Note: custom toast won't work on android api 30
void showToast(String msg, {Color backgroundColor = Colors.white, Color textColor = Colors.black, double textSize = 16.0}) {
  Fluttertoast.cancel();
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.white,
      textColor: Colors.black,
      fontSize: 16.0);
}
