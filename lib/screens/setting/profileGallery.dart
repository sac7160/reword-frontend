import 'package:flutter/material.dart';

class ProfileGalleryScreen extends StatelessWidget {
  static String routeName = "/ProfileGalleryScreen";
  const ProfileGalleryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("갤러리"),
      ),
    );
  }
}
