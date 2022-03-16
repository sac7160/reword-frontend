import 'package:bearvoca/screens/mainScreens.dart';
import 'package:flutter/material.dart';
import 'screens/splash/splashScreen.dart';
import 'screens/home/homeScreen.dart';

final Map<String, WidgetBuilder> route = {
  SplashScreen.routeName: (context) => SplashScreen(),
  MainScreens.routeName: (context) => MainScreens(),
};
