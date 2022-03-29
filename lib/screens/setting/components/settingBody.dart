import 'package:bearvoca/screens/setting/components/settingHeader.dart';
import 'package:bearvoca/screens/setting/components/textMenu.dart';
import 'package:bearvoca/screens/setting/components/textMenuCard.dart';
import 'package:flutter/material.dart';

class SettingBody extends StatefulWidget {
  @override
  State<SettingBody> createState() => _SettingBodyState();
}

class _SettingBodyState extends State<SettingBody> {
  @override
  Widget build(BuildContext context) {
    bool boolisSwitched = false;

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
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Container(
                child: Transform.scale(
                  scale: 1.5,
                  child: Switch(
                    //switch 작동 이상 수정필요
                    value: boolisSwitched,
                    onChanged: (value) {
                      setState(() {
                        boolisSwitched = value;
                        print(boolisSwitched);
                      });
                    },
                    activeTrackColor: Colors.lightGreenAccent,
                    activeColor: Colors.green,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 15),
        TextMenuCard(
            title: "베어보카 200% 활용법",
            icon: Icons.arrow_right_alt_outlined,
            press: () {}),
        SizedBox(height: 15),
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Text(
              "베어보카 정보",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
