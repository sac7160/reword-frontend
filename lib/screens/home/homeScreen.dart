import 'package:bearvoca/screens/quiz/quizChoiceForm.dart';
import 'package:bearvoca/screens/quiz/quizInputForm.dart';
import 'package:flutter/material.dart';

import '../../util/appFunc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  printLog(QuizChoiceForm.routeName);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => QuizChoiceForm()));
                },
                child: Text(
                  "3지선다",
                  style: TextStyle(
                      color: Colors.white, fontSize: 25, ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                  ),
                ),
              ),
            const Padding(padding: EdgeInsets.only(top: 25)),

            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  printLog(QuizInputForm.routeName);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => QuizInputForm()));
                },
                child: Text(
                  "입력형",
                  style: TextStyle(
                    color: Colors.white, fontSize: 25, ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
