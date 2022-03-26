import 'package:bearvoca/screens/my-word/components/advanced.dart';
import 'package:bearvoca/screens/my-word/components/allWord.dart';
import 'package:bearvoca/screens/my-word/components/dayFilterButton.dart';
import 'package:bearvoca/screens/my-word/components/favoritesCard.dart';
import 'package:bearvoca/screens/my-word/components/middleClass.dart';
import 'package:bearvoca/screens/my-word/components/myWordCard.dart';
import 'package:bearvoca/screens/my-word/components/novice.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'components/toefl.dart';
import 'components/toeic.dart';
import 'myWordStudy.dart';

// 피그마 초안 탭바 있는 버전. 추후 수정

/*class MyWordScreen extends StatelessWidget {
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
}*/

class MyWordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("내 단어"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              FontAwesomeIcons.bell,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.hexagon,
              color: Colors.black,
            ),
          ),
          SizedBox(
            width: 5,
          )
        ],
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.95,
          child: ListView(
            children: [
              SizedBox(height: 50),
              Container(
                  alignment: Alignment.bottomLeft, child: DayFilterButton()),
              SizedBox(height: 20),
              MyWordCard(
                //이 카드 두개 day에 따라 바뀌므로 하나로 묶어서 빼야할듯 수정필요
                name: "곰돌이와 \n지금 바로 공부하러가요",
                buttonName: "Study",
                height: 150,
                routename: MyWordStudyScreen.routeName,
              ),
              SizedBox(height: 10),
              MyWordCard(
                name: "시험 볼 준비가 됐나요?",
                buttonName: "Test",
                height: 100,
              ),
              SizedBox(height: 50),
              Text(
                "내가 즐겨찾기한 단어를 확인해봐요!",
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              FavoritesCard(),
              SizedBox(height: 30),
              MyWordCard(
                name: "레벨이 맞지 않나요?",
                buttonName: "재설정하기",
                height: 100,
                buttonWidth: 120,
              )
            ],
          ),
        ),
      ),
    );
  }
}
