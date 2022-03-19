import 'package:bearvoca/screens/my-word/components/advanced.dart';
import 'package:bearvoca/screens/my-word/components/allWord.dart';
import 'package:bearvoca/screens/my-word/components/middleClass.dart';
import 'package:bearvoca/screens/my-word/components/novice.dart';
import 'package:flutter/material.dart';

import 'components/toefl.dart';
import 'components/toeic.dart';

class MyWordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> categories = ["전체보기", "초급", "중급", "고급", "토익", "토플"];
    return DefaultTabController(
      initialIndex: 0,
      length: categories.length,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("내 단어장"),
          bottom: PreferredSize(
            child: Container(
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 0.3, color: Colors.black)),
                  color: Colors.brown),
              child: TabBar(
                tabs: List.generate(
                  categories.length,
                  (index) => Tab(
                    text: categories[index],
                  ),
                ),
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                labelStyle: const TextStyle(color: Colors.black),
                indicator: const UnderlineTabIndicator(
                  borderSide: BorderSide(width: 2, color: Colors.brown),
                ),
              ),
            ),
            preferredSize: const Size.fromHeight(42),
          ),
        ),
        body: TabBarView(
          children: [
            AllWord(),
            Novice(),
            MiddleClass(),
            Advanced(),
            Toeic(),
            Toefl(),
          ],
        ),
      ),
    );
  }
}
