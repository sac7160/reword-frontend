import 'package:bearvoca/screens/setting/components/settingHeader.dart';
import 'package:bearvoca/screens/setting/components/textMenu.dart';
import 'package:bearvoca/screens/setting/components/textMenuCard.dart';
import 'package:flutter/material.dart';

class SettingBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SettingHeader(),
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
