import 'package:bearvoca/screens/my-word/components/folderCard.dart';
import 'package:flutter/material.dart';

class Middle extends StatelessWidget {
  const Middle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        FolderCard(name: "중급1", height: 100),
        SizedBox(height: 20),
      ],
    );
  }
}
