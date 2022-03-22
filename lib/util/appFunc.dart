import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

double getScreenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double getScreenHeight(BuildContext context) => MediaQuery.of(context).size.height;
double getPixelRatio(BuildContext context) => MediaQuery.of(context).devicePixelRatio;
double getStatusBarSize(BuildContext context) => MediaQuery.of(context).padding.top;

// define processes which is not available to duplicate
enum PROCESS_TYPE {
  kakaoLogin,
  size
}

List arrProcess = List.filled(PROCESS_TYPE.size.index, false);

void registerProcess(PROCESS_TYPE eProcessType) {
  if(hasScreen(eProcessType)) {
    printLog("already has this process");
  }

  arrProcess[eProcessType.index] = true;
}

void releaseProcess(PROCESS_TYPE eProcessType) {
  if(!hasScreen(eProcessType)) {
    printLog("already released this process");
  }

  arrProcess[eProcessType.index] = false;
}

bool hasScreen(PROCESS_TYPE eProcessType) {
  return arrProcess[eProcessType.index];
}

void printLog(String strMsg) {
  if (kDebugMode) {
    print(strMsg);
  }
}

void printCurScreen(BuildContext context) {
  printLog("current Screen : " + (ModalRoute.of(context)?.settings.name ?? "none"));
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
