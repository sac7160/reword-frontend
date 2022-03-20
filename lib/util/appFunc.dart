import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// define screens which is not available to duplicate
enum SCREEN_TYPE {
  kakaoLogin,
  size
}

List arrScreen = List.filled(SCREEN_TYPE.size.index, false);

void registerScreen(SCREEN_TYPE eScreenType) {
  if(hasScreen(eScreenType)) {
    printLog("already has this screen");
  }

  arrScreen[eScreenType.index] = true;
}

void releaseScreen(SCREEN_TYPE eScreenType) {
  if(!hasScreen(eScreenType)) {
    printLog("already released this screen");
  }

  arrScreen[eScreenType.index] = false;
}

bool hasScreen(SCREEN_TYPE eScreenType) {
  return arrScreen[eScreenType.index];
}

void printLog(String strMsg) {
  if (kDebugMode) {
    print(strMsg);
  }
}

// Note: custom toast won't work on android api 30 below
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
