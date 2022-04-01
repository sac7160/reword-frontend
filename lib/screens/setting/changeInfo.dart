import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../values/dimensions.dart';
import 'components/changeInfoMenu.dart';
import 'components/textMenuCard.dart';

class ChangeInfo extends StatelessWidget {
  static String routeName = "/ChangeInfo";
  const ChangeInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              FontAwesomeIcons.angleLeft,
              color: Colors.grey,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text("내 정보 변경하기"),
        ),
        body: Center(
          child: Container(
            margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
            //width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              children: [
                SizedBox(height: 20),
                Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "계정 정보 관리",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: textSize20),
                        ),
                      ]),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 55,
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "연동 계정",
                        style: TextStyle(fontSize: textSize16),
                      ),
                      Text(
                        "카카오톡으로 로그인",
                        style: TextStyle(fontSize: textSize16),
                      )
                    ],
                  )),
                ),
                Divider(
                  color: Colors.grey,
                  height: 0,
                ),
                SizedBox(
                  height: 165,
                  child: ListView.separated(
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, index) => SizedBox(
                      height: 55,
                      child: TextMenuCard(
                        title: changeInfoMenuList[index].text,
                        icon: changeInfoMenuList[index].icon,
                        press: changeInfoMenuList[index].press,
                      ),
                    ),
                    separatorBuilder: (context, index) => Divider(
                      color: Colors.grey,
                      height: 0,
                    ),
                    itemCount: changeInfoMenuList.length,
                  ),
                ),
                Divider(
                  color: Colors.grey,
                  height: 0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 55,
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "탈퇴하기",
                        style: TextStyle(fontSize: textSize16),
                      ),
                    ],
                  )),
                ),
              ],
            ),
          ),
        ));
  }
}
