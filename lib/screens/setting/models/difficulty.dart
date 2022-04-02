import 'package:flutter/material.dart';

class Difficulty {
  bool boolIsChecked;
  bool boolIsNowDifficulty;
  String strName;

  Difficulty(
      {required this.strName,
      required this.boolIsChecked,
      required this.boolIsNowDifficulty});
}

List<Difficulty> Difficulties = [
  Difficulty(strName: "초급", boolIsChecked: false, boolIsNowDifficulty: true),
  Difficulty(strName: "중급", boolIsChecked: false, boolIsNowDifficulty: false),
  Difficulty(strName: "고급", boolIsChecked: false, boolIsNowDifficulty: false),
  Difficulty(strName: "토익", boolIsChecked: false, boolIsNowDifficulty: false),
  Difficulty(strName: "토플", boolIsChecked: false, boolIsNowDifficulty: false),
];
