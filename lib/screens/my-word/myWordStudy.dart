import 'package:bearvoca/screens/my-word/components/myWordStudyWidget.dart';
import 'package:bearvoca/screens/my-word/temporary-data/wordList.dart';
import 'package:flutter/material.dart';

class MyWordStudyScreen extends StatefulWidget {
  const MyWordStudyScreen({Key? key}) : super(key: key);
  static String routeName = "/MyWordStudyScreen";

  @override
  State<MyWordStudyScreen> createState() => _MyWordStudyScreenState();
}

class _MyWordStudyScreenState extends State<MyWordStudyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("단어장"),
          backgroundColor: Colors.yellow,
          elevation: 0,
        ),
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 288,
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: words.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: MyWordStudyWidget(myword2: words[index]),
                );
              },
            ),
          ),
        ));
  }
}
