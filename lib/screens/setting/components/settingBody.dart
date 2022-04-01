import 'package:bearvoca/screens/setting/components/settingHeader.dart';
import 'package:bearvoca/screens/setting/components/textMenu.dart';
import 'package:bearvoca/screens/setting/components/textMenuCard.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../values/dimensions.dart';

class SettingBody extends StatefulWidget {
  @override
  State<SettingBody> createState() => _SettingBodyState();
}

class _SettingBodyState extends State<SettingBody> {
  bool boolisSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SettingHeader(),
        SizedBox(height: 30),
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "알림 설정",
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: textSize20),
              ),
              Container(
                child: Transform.scale(
                  scale: 1.5,
                  child: Switch(
                    value: boolisSwitched,
                    onChanged: (value) {
                      setState(() {
                        boolisSwitched = value;
                      });
                    },
                    inactiveTrackColor: Colors.grey,
                    activeTrackColor: Colors.black,
                    activeColor: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 15),
        InkWell(
          onTap: () {},
          child: Card(
            margin: EdgeInsets.zero,
            color: Colors.white,
            elevation: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "베어보카 200% 활용법",
                    style: TextStyle(
                        fontSize: textSize20, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  SizedBox(
                    width: 26,
                    child:
                        Icon(FontAwesomeIcons.angleRight, color: Colors.grey),
                  )
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
        Container(
          width: MediaQuery.of(context).size.width * 0.92,
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Text(
              "베어보카 정보",
              style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: textSize20),
            ),
          ]),
        ),
        SizedBox(
          height: 330,
          child: ListView.separated(
            physics: ClampingScrollPhysics(),
            itemBuilder: (context, index) => SizedBox(
              height: 55,
              child: TextMenuCard(
                title: textMenuList[index].text,
                icon: textMenuList[index].icon,
                press: textMenuList[index].press,
              ),
            ),
            separatorBuilder: (context, index) => Divider(
              color: Colors.grey,
              height: 0,
            ),
            itemCount: textMenuList.length,
          ),
        ),
      ],
    );
  }
}
