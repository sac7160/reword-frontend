//임시 단어 데이터 입력
//단어 클래스 정리 필요

import 'package:flutter/material.dart';

class MyWordStudyItem {
  final String? word;
  final String? meaning;
  final String? example;
  bool like;

  MyWordStudyItem({
    Key? key,
    required this.word,
    required this.meaning,
    required this.example,
    required this.like,
  });
}

final List<MyWordStudyItem> words = [
  MyWordStudyItem(
      word: "Apple", meaning: "사과", example: "I like apple.", like: true),
  MyWordStudyItem(
      word: "Car", meaning: "자동차", example: "I like car.", like: false),
  MyWordStudyItem(
      word: "Bear", meaning: "곰", example: "I like bear.", like: false),
  MyWordStudyItem(
      word: "You", meaning: "너", example: "I love you.", like: false),
  MyWordStudyItem(
      word: "Love", meaning: "사랑", example: "My love is you.", like: false),
];
