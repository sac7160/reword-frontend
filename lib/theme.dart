import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: appbarTheme(),
    textTheme: TextTheme(
      bodyText2: TextStyle(color: Colors.black),
    ),
  );
}

AppBarTheme appbarTheme() {
  return AppBarTheme(
      //centerTitle: false,
      color: Colors.white,
      elevation: 0,
      titleTextStyle: TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20));
}
