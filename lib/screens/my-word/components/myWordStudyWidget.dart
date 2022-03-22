import 'package:bearvoca/screens/my-word/temporary-data/wordList.dart';
import 'package:flutter/material.dart';

/*class MyWordStudyWidget extends StatelessWidget {
  final MyWordStudyItem myword;

  const MyWordStudyWidget({Key? key, required this.myword}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.orangeAccent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 0.3, color: Colors.grey)),
      width: 289,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("${myword.word}"),
          const Divider(height: 10, color: Colors.black),
          Text("${myword.meaning}"),
          const Divider(height: 10, color: Colors.black),
          Text("${myword.example}"),
          Icon(
            myword.like ? Icons.favorite : Icons.favorite_border,
            color: myword.like ? Colors.red : null,
          ),
        ],
      ),
    );
  }
}*/

class MyWordStudyWidget extends StatefulWidget {
  final MyWordStudyItem myword2;

  const MyWordStudyWidget({Key? key, required this.myword2}) : super(key: key);

  @override
  State<MyWordStudyWidget> createState() =>
      _MyWordStudyWidgetState(myword: myword2);
}

class _MyWordStudyWidgetState extends State<MyWordStudyWidget> {
  final MyWordStudyItem myword;
  _MyWordStudyWidgetState({required this.myword});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.orangeAccent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 0.3, color: Colors.grey)),
      width: 289,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("${myword.word}"),
          const Divider(height: 10, color: Colors.black),
          Text("${myword.meaning}"),
          const Divider(height: 10, color: Colors.black),
          Text("${myword.example}"),
          GestureDetector(
            child: Icon(
              myword.like ? Icons.favorite : Icons.favorite_border,
              color: myword.like ? Colors.red : null,
            ),
            onTap: () {
              setState(() {
                if (myword.like)
                  myword.like = false;
                else
                  myword.like = true;
              });
            },
          ),
        ],
      ),
    );
  }
}
