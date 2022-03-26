import 'package:bearvoca/screens/my-word/temporary-data/wordList.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: 150,
              child: Center(
                  child: Text(
                "${myword.word}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 80),
              ))),
          const Divider(height: 10, color: Colors.black),
          Container(
            height: 70,
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  width: 110,
                  child: Text(
                    "뜻",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ),
                Text(
                  "${myword.meaning}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ],
            ),
          ),
          const Divider(height: 10, color: Colors.black),
          Container(
            height: 70,
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  width: 110,
                  child: Text(
                    "예문",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ),
                Text(
                  "${myword.example}",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          Container(
            height: 80,
            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  child: Icon(
                    myword.like ? Icons.favorite : Icons.favorite_border,
                    color: myword.like ? Colors.black : null,
                    size: 40,
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
          ),
        ],
      ),
    );
  }
}
