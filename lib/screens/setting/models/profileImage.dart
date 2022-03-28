import 'package:flutter/material.dart';

class ProfileImage {
  final String? strImagePath;
  bool bImageChecked = false;
  ProfileImage({required this.strImagePath, required this.bImageChecked});
}

List<ProfileImage> profileImages = [
  ProfileImage(
      strImagePath: "assets/profile-image/profileExample1.png",
      bImageChecked: false),
  ProfileImage(
      strImagePath: "assets/profile-image/profileExample2.png",
      bImageChecked: false),
  ProfileImage(
      strImagePath: "assets/profile-image/profileExample3.png",
      bImageChecked: false),
  ProfileImage(
      strImagePath: "assets/profile-image/profileExample4.png",
      bImageChecked: false),
  ProfileImage(
      strImagePath: "assets/profile-image/profileExample5.png",
      bImageChecked: false),
  ProfileImage(
      strImagePath: "assets/profile-image/profileExample6.png",
      bImageChecked: false),
  ProfileImage(
      strImagePath: "assets/profile-image/profileExample7.png",
      bImageChecked: false),
  ProfileImage(
      strImagePath: "assets/profile-image/profileExample8.png",
      bImageChecked: false),
];
