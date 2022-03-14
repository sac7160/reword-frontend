import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Colors.yellow,
    appBarTheme: AppBarTheme(color: Colors.brown),
    textTheme: TextTheme(
      bodyText2: TextStyle(color: Colors.brown),
    ),
  );
}
