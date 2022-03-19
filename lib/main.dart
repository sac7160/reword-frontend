import 'package:bearvoca/theme.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'routes.dart';
import 'screens/splash/splashScreen.dart';

void main() async {

  KakaoSdk.init(nativeAppKey: "899d5a61865c5a45ecda3a9515e75444");
  runApp(BearVoca());
}

class BearVoca extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme(),
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: route,
    );
  }
}
