import 'package:bearvoca/screens/mainScreens.dart';
import 'package:bearvoca/screens/my-word/myWordStudy.dart';
import 'package:bearvoca/screens/sign-in/siginInEmail.dart';
import 'package:bearvoca/screens/sign-in/signIn.dart';
import 'package:flutter/material.dart';
import 'screens/splash/splashScreen.dart';
import 'screens/home/homeScreen.dart';

final Map<String, WidgetBuilder> route = {
  SplashScreen.routeName: (context) => SplashScreen(),
  MainScreens.routeName: (context) => MainScreens(),
  SignInScreen.routeName: (context) => SignInScreen(),
  SignInEmailScreen.routeName: (context) => SignInEmailScreen(),
  MyWordStudyScreen.routeName: (context) => MyWordStudyScreen(),
};
