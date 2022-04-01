import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TextMenu {
  String? text;
  IconData? icon;
  String? path;
  final GestureTapCallback? press;

  TextMenu({this.text, this.icon, this.path, this.press});
}

List<TextMenu> textMenuList = [
  TextMenu(
      text: "문의하기", icon: FontAwesomeIcons.angleRight, path: "/", press: () {}),
  TextMenu(
      text: "버전", icon: FontAwesomeIcons.angleRight, path: "/", press: () {}),
  TextMenu(
      text: "개인정보처리방침",
      icon: FontAwesomeIcons.angleRight,
      path: "/",
      press: () {}),
  TextMenu(
      text: "이용약관", icon: FontAwesomeIcons.angleRight, path: "/", press: () {}),
  TextMenu(
      text: "오픈소스 라이센스",
      icon: FontAwesomeIcons.angleRight,
      path: "/",
      press: () {}),
];
