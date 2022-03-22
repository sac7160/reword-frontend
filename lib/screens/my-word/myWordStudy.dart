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
          automaticallyImplyLeading: false,
          leading: Center(
            child: GestureDetector(
              child: Icon(Icons.arrow_back),
              onTap: _showDialog,
            ),
          ),
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

  void _showDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Study를 그만할까요?"),
          content: SingleChildScrollView(child: new Text("Alert Dialog body")),
          actions: <Widget>[
            TextButton(
              child: Text("그만 하기"),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: Text("이어서 하기"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
