import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Colors.yellow,
    appBarTheme: appbarTheme(),
    textTheme: TextTheme(
      bodyText2: TextStyle(color: Colors.brown),
    ),
  );
}

AppBarTheme appbarTheme() {
  return AppBarTheme(
      centerTitle: false,
      color: Colors.yellow,
      elevation: 0,
      titleTextStyle: TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20));
}
