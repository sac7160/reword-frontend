import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../values/colors.dart';
import '../../values/dimensions.dart';
import '../../util/appFunc.dart';

class QuizChoiceForm extends StatefulWidget {
  static const String routeName = "/quizChoiceForm";

  @override
  _QuizChoiceFormState createState() => _QuizChoiceFormState();
}

class _QuizChoiceFormState extends State<QuizChoiceForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
              padding: EdgeInsets.only(
            top: margin96,
          )),

          Padding(
            padding: EdgeInsets.only(left: getScreenWidth(context) * 0.1 * 0.5),
            child: SizedBox(
              width: double.infinity,
              child: Text('다음 단어의 올바른 뜻은 무엇일까요?',
                  style: TextStyle(color: Colors.black, fontSize: wordTitleText)),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(left: getScreenWidth(context) * 0.1 * 0.5),
            child: SizedBox(
              width: double.infinity,
              child: Text('정답이에요!',
                  style: TextStyle(color: Colors.pink, fontSize: wordSubTitleText)),
            ),
          ),

          Padding(
              padding: EdgeInsets.only(
            top: margin32,
          )),

          _wordItem(context),

          Padding(
              padding: EdgeInsets.only(
                top: margin64,
              )),

          SizedBox(
            width: wordOkButtonWidth,
              height: wordOkButtonHeight,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "확인",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: wordTitleText,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.pinkAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
              )),

        ],
      ),
    );
  }
}

Widget _wordItem(BuildContext context) {
  return Center(
    child: Container(
      width: getScreenWidth(context) * 0.9,
      height: getScreenHeight(context) * 0.5 + margin24,
      decoration: BoxDecoration(
        color: wordBackground,
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.all(margin16),
                    width: hintCircleSize,
                    height: hintCircleSize,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Hint',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(
                    top: margin24,
                  )),
                  Text(
                    "Apple",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                    top: margin24,
                  )),
                  Divider(thickness: 1, height: 1, color: Colors.grey),
                  Padding(
                      padding: EdgeInsets.only(
                    top: margin16,
                  )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      _wordAnswers(context),
                    ],
                  ),
                ],
              )
            ],
          )
        ],
      ),
    ),
  );
}

Widget _wordAnswers(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: <Widget>[
      const Padding(padding: EdgeInsets.only(top: margin8)),
      SizedBox(
          height: wordItemPadding,
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              "Answer A",
              style: TextStyle(
                color: Colors.white,
                fontSize: wordTextSize,
              ),
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.blueAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
            ),
          )),
      const Padding(padding: EdgeInsets.only(top: margin16)),
      SizedBox(
          height: wordItemPadding,
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              "Answer A",
              style: TextStyle(
                color: Colors.white,
                fontSize: wordTextSize,
              ),
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.blueAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
            ),
          )),
      const Padding(padding: EdgeInsets.only(top: margin16)),
      SizedBox(
          height: wordItemPadding,
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              "Answer A",
              style: TextStyle(
                color: Colors.white,
                fontSize: wordTextSize,
              ),
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.blueAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
            ),
          )),
      const Padding(padding: EdgeInsets.only(top: margin16, bottom: margin16))
    ],
  );
}
