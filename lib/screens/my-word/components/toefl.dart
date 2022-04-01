import 'package:bearvoca/screens/my-word/components/folderCard.dart';
import 'package:flutter/material.dart';

class Toefl extends StatelessWidget {
  const Toefl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        FolderCard(name: "토플1", height: 100),
        SizedBox(height: 20),
        FolderCard(name: "토플2", height: 100)
      ],
    );
  }
}
