import 'package:bearvoca/screens/my-word/myWordStudy.dart';
import 'package:flutter/material.dart';

class AllWord extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
            child: ElevatedButton(
      child: Text("Study"),
      onPressed: () {
        Navigator.pushNamed(context, MyWordStudyScreen.routeName);
      },
    )));
  }
}
