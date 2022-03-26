import 'package:bearvoca/screens/quiz/quizData.dart';
import 'package:bearvoca/screens/quiz/quizNotifier.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
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
      backgroundColor: Colors.white,
          body: Column(
          children: [

            Padding(
                padding: EdgeInsets.only(
                  top: getStatusBarSize(context) + margin16,
                )),

            Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: margin16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(Icons.arrow_back_ios,
                      color: Colors.grey, size: iconSize),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(Provider.of<QuizNotifier>(context).strQuizName,
                    style:
                        TextStyle(fontSize: textSize24, color: Colors.black)),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(right: iconSize + margin16 + margin8),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                      Provider.of<QuizNotifier>(context).iHoneyCnt.toString(),
                      style:
                          TextStyle(fontSize: textSize22, color: Colors.grey)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: margin16),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Icon(Icons.arrow_circle_down_outlined,
                      color: Colors.grey, size: iconSize),
                ),
              ),
            ],
          ),
          Padding(
                padding: EdgeInsets.only(
                  top: margin8,
                )),

            LinearPercentIndicator(
              padding: EdgeInsets.zero,
              width: getScreenWidth(context),
              lineHeight: indicatorHeight,
              animation: false,
              percent: Provider.of<QuizNotifier>(context).getPercent(),
              backgroundColor: Colors.grey,
              progressColor: wordAccentColor),

            Padding(
                padding: EdgeInsets.only(
              top: margin32,
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
                        color: wordAccentColor, fontSize: wordSubTitleText)),
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
                  primary: wordAccentColor,
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
                      primary: wordAccentColor,
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
        color: wordBackgroundColor,
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.all(margin8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: hintCircleSize,
                          height: hintCircleSize,
                          child: MaterialButton(
                            onPressed: () {

                            },
                            color: Colors.white,
                            child: Text('Hint',
                            style: TextStyle(color: Colors.black, fontSize: hintTextSize),
                            ),
                            padding: EdgeInsets.all(margin8),
                            shape: CircleBorder(),
                          ),
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

          Consumer<QuizNotifier>(
            builder: (context, notifier, child) => Opacity(
              opacity: (notifier.getAnswerIdx() == iAnswerIdx &&
                  notifier.getSelectedIdx() == iAnswerIdx) ? SHOW : HIDE,
              child: Padding(
                padding: EdgeInsets.only(top:(wordItemPadding - textSize24) / 2, left: 50),
                child: Text(
                  "정답",
                  style: TextStyle(
                    color: wordAccentColor,
                    fontSize: wordTitleText,
                  ),
                ),
              ),
            ),
          ),

      Consumer<QuizNotifier>(
        builder: (context, notifier, child) => Center(
          child: SizedBox(
              height: wordItemPadding,
              child: ElevatedButton(
                onPressed: () {
                  notifier.setSelectedIdx(iAnswerIdx);

                },
                child: Container(
                  margin: EdgeInsets.only(left: margin20, right: margin20),
                  child: Text(
                    notifier.getChoiceFormAnswer(iAnswerIdx),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: textSize18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 3.0,
                        color: (notifier.getAnswerIdx() == iAnswerIdx &&
                            notifier.getSelectedIdx() == iAnswerIdx) ? wordAccentColor : Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(25)),
                ),
              )),
        ),
      ),

    ],
  );
}
