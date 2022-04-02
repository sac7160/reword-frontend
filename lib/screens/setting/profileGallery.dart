import 'package:bearvoca/values/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'models/profileImage.dart';

class ProfileGalleryScreen extends StatefulWidget {
  static String routeName = "/ProfileGalleryScreen";
  const ProfileGalleryScreen({Key? key}) : super(key: key);

  @override
  State<ProfileGalleryScreen> createState() => _ProfileGalleryScreenState();
}

class _ProfileGalleryScreenState extends State<ProfileGalleryScreen> {
  int? intCheckedInt; //프로필 설정 수정 필요
  bool bIsChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            title: Text("사진 선택하기"),
            elevation: 0.0,
            automaticallyImplyLeading: false,
            leading: Center(
              child: GestureDetector(
                child: Icon(
                  FontAwesomeIcons.angleLeft,
                  color: Colors.grey,
                ),
                onTap: () {
                  for (int i = 0; i < profileImages.length; i++) {
                    profileImages[i].bImageChecked = false;
                  }
                  Navigator.pop(context);
                },
              ),
            ),
            titleSpacing: 0,
            actions: [
              bIsChecked
                  ? TextButton(
                      onPressed: () {
                        for (int i = 0; i < profileImages.length; i++) {
                          profileImages[i].bImageChecked = false;
                        }
                        Navigator.pop(context, intCheckedInt); //프로필 설정 수정 필요
                      },
                      child: Text(
                        "확인",
                        style: TextStyle(color: wordAccentColor),
                      ))
                  : TextButton(
                      onPressed: () {},
                      child: Text(
                        "확인",
                        style: TextStyle(color: Colors.grey),
                      )),
            ],
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: MediaQuery.of(context).size.width * 0.4,
              mainAxisSpacing: 0,
              crossAxisSpacing: 5,
              childAspectRatio: 0.99,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (!profileImages[index].bImageChecked) {
                        for (int i = 0; i < profileImages.length; i++) {
                          profileImages[i].bImageChecked = false;
                        }
                        profileImages[index].bImageChecked = true;
                        intCheckedInt = index;
                        bIsChecked = true;
                      }
                    });
                  },
                  child: profileImages[index].bImageChecked
                      ? Container(
                          child: Image(
                            image:
                                AssetImage(profileImages[index].strImagePath!),
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 3.0),
                            //borderRadius: BorderRadius.circular(30),
                          ),
                        )
                      : Container(
                          child: Image(
                            image:
                                AssetImage(profileImages[index].strImagePath!),
                          ),
                        ),
                );
              },
              childCount: profileImages.length,
            ),
          ),
        ],
      ),
    );
  }
}
