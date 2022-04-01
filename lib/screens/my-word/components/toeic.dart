import 'package:bearvoca/screens/my-word/components/folderCard.dart';
import 'package:flutter/material.dart';

class Toeic extends StatelessWidget {
  const Toeic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        FolderCard(name: "토익1", height: 100),
        SizedBox(height: 20),
        FolderCard(name: "토익2", height: 100)
      ],
    );
  }
}
