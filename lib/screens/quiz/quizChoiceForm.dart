import 'package:bearvoca/screens/quiz/quizData.dart';
import 'package:bearvoca/screens/quiz/quizNotifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

          Opacity(
            opacity: Provider.of<QuizNotifier>(context).isQuizCorrect() ? SHOW : HIDE,
            child: Padding(
              padding:
                  EdgeInsets.only(left: getScreenWidth(context) * 0.1 * 0.5),
              child: SizedBox(
                width: double.infinity,
                child: Text('정답이에요!',
                    style: TextStyle(
                        color: Colors.pink, fontSize: wordSubTitleText)),
              ),
            ),
          ),

          Padding(
                padding: EdgeInsets.only(
              top: margin32,
            )),

            _wordItem(context),

            Padding(
                padding: EdgeInsets.only(
                  top: margin16,
                )),

            Opacity(
              opacity: Provider.of<QuizNotifier>(context).isQuizNotCorrect() ? SHOW : HIDE,
              child: SizedBox(
              height: wordOkButtonHeight,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "다시 생각해보세요!",
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
            ),

            Padding(
                padding: EdgeInsets.only(
                  top: margin16,
                )),

              Opacity(
                opacity: Provider.of<QuizNotifier>(context).isQuizCorrect() ? SHOW : HIDE,
                child: SizedBox(
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
                ),
          ],
        ),
      );
  }
}

Widget _wordItem(BuildContext context) {
  return Center(
    child: Container(
      width: getScreenWidth(context) * 0.9,
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

                  _wordAnswers(context),

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
    children: <Widget>[
      const Padding(padding: EdgeInsets.only(top: margin8)),
      _Answer(context, 0),

      const Padding(padding: EdgeInsets.only(top: margin16)),
      _Answer(context, 1),

      const Padding(padding: EdgeInsets.only(top: margin16)),
      _Answer(context, 2),

      const Padding(padding: EdgeInsets.only(top: margin16))
    ],
  );
}

Widget _Answer(BuildContext context, int iAnswerIdx) {
  return Stack(
    children: [

          Opacity(
            opacity: Provider.of<QuizNotifier>(context).isQuizCorrect() ? SHOW : HIDE,
            child: Padding(
              padding: EdgeInsets.only(top:(wordItemPadding - wordTextSize) / 2, left: 50),
              child: Text(
                "정답",
                style: TextStyle(
                  color: Colors.pink,
                  fontSize: wordTitleText,
                ),
              ),
            ),
          ),

      Consumer<QuizNotifier>(
        builder: (context, notifier, child) => Center(
          child: SizedBox(
              height: wordItemPadding,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  notifier.getChoiceFormAnswer(iAnswerIdx),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: wordTextSize,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 3.0,
                        color: (notifier.getAnswerIdx() == iAnswerIdx &&
                            notifier.iSelectedIdx == iAnswerIdx) ? Colors.pink : Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(25)),
                ),
              )),
        ),
      ),

    ],
  );
}
