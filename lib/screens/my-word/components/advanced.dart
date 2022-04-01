import 'package:bearvoca/screens/my-word/components/folderCard.dart';
import 'package:flutter/material.dart';

class Advanced extends StatelessWidget {
  const Advanced({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        FolderCard(name: "고급1", height: 100),
        SizedBox(height: 20),
        FolderCard(name: "고급2", height: 100)
      ],
    );
  }
}
