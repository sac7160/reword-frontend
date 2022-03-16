import 'package:flutter/foundation.dart';

void printLog(String? strMsg) {
  if (kDebugMode) {
    print(strMsg);
  }
}