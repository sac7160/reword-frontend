import 'package:bearvoca/screens/setting/setDifficulty.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChangeInfoMenu {
  String? text;
  IconData? icon;
  String? path;
  final GestureTapCallback? press;

  ChangeInfoMenu({
    this.text,
    this.icon,
    this.path,
    this.press,
  });
}

List<ChangeInfoMenu> changeInfoMenuList = [
  ChangeInfoMenu(
      text: "난이도 재설정하기",
      icon: FontAwesomeIcons.angleRight,
      path: "/",
      press: () {}),
  ChangeInfoMenu(
      text: "닉네임 설정하기",
      icon: FontAwesomeIcons.angleRight,
      path: "/",
      press: () {}),
  ChangeInfoMenu(
      text: "개인정보처리방침",
      icon: FontAwesomeIcons.angleRight,
      path: "/",
      press: () {}),
];
