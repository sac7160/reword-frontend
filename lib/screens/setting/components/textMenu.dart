import 'package:flutter/material.dart';

class TextMenu {
  String? text;
  IconData? icon;
  String? path;
  final GestureTapCallback? press;

  TextMenu({this.text, this.icon, this.path, this.press});
}

List<TextMenu> textMenuList = [
  TextMenu(
      text: "문의하기",
      icon: Icons.arrow_right_alt_outlined,
      path: "/",
      press: () {}),
  TextMenu(
      text: "버전",
      icon: Icons.arrow_right_alt_outlined,
      path: "/",
      press: () {}),
  TextMenu(
      text: "개인정보처리방침",
      icon: Icons.arrow_right_alt_outlined,
      path: "/",
      press: () {}),
  TextMenu(
      text: "이용약관",
      icon: Icons.arrow_right_alt_outlined,
      path: "/",
      press: () {}),
  TextMenu(
      text: "이용약관",
      icon: Icons.arrow_right_alt_outlined,
      path: "/",
      press: () {}),
  TextMenu(
      text: "오픈소스 라이센스",
      icon: Icons.arrow_right_alt_outlined,
      path: "/",
      press: () {}),
];
