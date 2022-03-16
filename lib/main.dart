import 'package:bearvoca/theme.dart';
import 'package:flutter/material.dart';
import 'routes.dart';
import 'screens/splash/splash_screen.dart';

void main() async {

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
