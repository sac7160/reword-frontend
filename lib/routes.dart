import 'package:bearvoca/screens/main_screens.dart';
import 'package:flutter/material.dart';
import 'screens/splash/splash_screen.dart';
import 'screens/home/home_screen.dart';

final Map<String, WidgetBuilder> route = {
  SplashScreen.routeName: (context) => SplashScreen(),
  MainScreens.routeName: (context) => MainScreens(),
};
