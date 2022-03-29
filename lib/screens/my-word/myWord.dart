import 'package:bearvoca/screens/my-word/components/advanced.dart';
import 'package:bearvoca/screens/my-word/components/allWord.dart';
import 'package:bearvoca/screens/my-word/components/dayFilterButton.dart';
import 'package:bearvoca/screens/my-word/components/difficultyButton.dart';
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
    List<String> eCategories = ["기초", "중급", "고급", "토익", "토플"];
    return DefaultTabController(
        length: eCategories.length,
        initialIndex: 0,
        child: Scaffold(
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
                  SizedBox(height: 30),
                  /*Container(
                  alignment: Alignment.bottomLeft, child: DayFilterButton()),*/
                  // 와이어프레임 변경 전 day 선택 버튼

                  SizedBox(height: 20),
                  MyWordCard(
                    name: "내가 즐겨찾기 한 단어로\n랜덤 공부해봐요!",
                    buttonName: "Study",
                    height: 100,
                    routename: MyWordStudyScreen.routeName,
                  ),
                  SizedBox(height: 10),

                  SizedBox(height: 50),
                  Text(
                    "내가 만든 단어장",
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 25),

                  // 내가 만든 단어장 탭바사용해 구현?
                  Container(
                    child: TabBar(
                      tabs: List.generate(
                        eCategories.length,
                        (index) => Container(
                          height: 30,
                          child: Tab(
                              child: Container(
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border:
                                    Border.all(color: Colors.grey, width: 1)),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(eCategories[index]),
                            ),
                          )),
                        ),
                      ),
                      labelPadding:
                          EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicator: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.grey),
                    ),
                  ),

                  SizedBox(
                    height: 66,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: eCategories.length,
                      itemBuilder: (context, index) {
                        return Center(
                          child: DifficultyButton(
                            strTitle: eCategories[index],
                            intPosition: index,
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    child: TabBarView(children: [
                      Basic(),
                      Basic(),
                      Basic(),
                      Basic(),
                      Basic(),
                    ]),
                  ),
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
        ));
  }
}

class Basic extends StatelessWidget {
  const Basic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("기초"),
      ),
    );
  }
}
