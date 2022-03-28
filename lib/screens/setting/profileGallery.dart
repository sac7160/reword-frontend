import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'models/profileImage.dart';

class ProfileGalleryScreen extends StatefulWidget {
  static String routeName = "/ProfileGalleryScreen";
  const ProfileGalleryScreen({Key? key}) : super(key: key);

  @override
  State<ProfileGalleryScreen> createState() => _ProfileGalleryScreenState();
}

class _ProfileGalleryScreenState extends State<ProfileGalleryScreen> {
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
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            backgroundColor: Colors.yellow,
            titleSpacing: 0,
            actions: [
              TextButton(onPressed: () {}, child: Text("확인")),
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
                      if (profileImages[index].bImageChecked)
                        profileImages[index].bImageChecked = false;
                      else
                        profileImages[index].bImageChecked = true;
                    });
                  },
                  child: profileImages[index]
                          .bImageChecked //사진 하나만 선택 어떻게 처리할지 수정필요
                      ? Stack(children: [
                          Container(
                            child: Image(
                              image: AssetImage(
                                  profileImages[index].strImagePath!),
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            right: 10,
                            child: Text("선택됨"),
                          )
                        ])
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
