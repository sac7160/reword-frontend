import 'package:bearvoca/screens/setting/profileGallery.dart';
import 'package:flutter/material.dart';

class SettingHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.yellow,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _Profile(context),
            SizedBox(height: 15),
            _info(),
            SizedBox(height: 15),
            _info2()
          ],
        ),
      ),
    );
  }
}

Widget _Profile(BuildContext context) {
  return Stack(
    children: [
      SizedBox(
        width: 165,
        height: 165,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Container(
            color: Colors.black,
          ),
        ),
      ),
      Positioned(
        bottom: 10,
        right: 10,
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, ProfileGalleryScreen.routeName);
          },
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey[100]),
            child: Icon(
              Icons.camera_alt_outlined,
              size: 15,
              color: Colors.black,
            ),
          ),
        ),
      )
    ],
  );
}

Widget _info() {
  return Container(
    child: Text(
      "게스트 모드로 이용중이에요",
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
  );
}

Widget _info2() {
  return Container(
    width: 130,
    child: InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        height: 35,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('로그인 하러가기'),
            Icon(
              Icons.arrow_right_alt_outlined,
              color: Colors.black,
            )
          ],
        ),
      ),
    ),
  );
}
