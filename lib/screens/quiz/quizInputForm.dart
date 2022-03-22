import 'package:flutter/material.dart';

class QuizInputForm extends StatefulWidget {
  static const String routeName = "/quizInputForm";

  @override
  _QuizInputFormState createState() => _QuizInputFormState();
}

class _QuizInputFormState extends State<QuizInputForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: <Widget>[
          Text("text"),
          Text("text"),
        ],
      ),
    ));
  }
}
