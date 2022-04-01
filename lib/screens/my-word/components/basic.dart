import 'package:bearvoca/screens/my-word/components/folderCard.dart';
import 'package:bearvoca/screens/my-word/voca.dart';
import 'package:flutter/material.dart';

class Basic extends StatelessWidget {
  const Basic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        FolderCard(name: "초급1", height: 100, routeName: Voca.routeName),
        SizedBox(height: 20),
        FolderCard(name: "초급2", height: 100)
      ],
    );
  }
}
