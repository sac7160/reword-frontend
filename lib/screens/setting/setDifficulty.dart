import 'package:bearvoca/screens/home/homeScreen.dart';
import 'package:bearvoca/screens/mainScreens.dart';
import 'package:bearvoca/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../values/dimensions.dart';
import 'models/difficulty.dart';

class SetDifficulty extends StatefulWidget {
  static String routeName = "/SetDifficulty";
  const SetDifficulty({Key? key}) : super(key: key);

  @override
  State<SetDifficulty> createState() => _SetDifficultyState();
}

class _SetDifficultyState extends State<SetDifficulty> {
  bool boolIsChecked = false;

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
        title: Text("난이도 재설정"),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          margin: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50),
              Text(
                "난이도가 맞지 않나요?",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: textSize20,
                ),
              ),
              SizedBox(height: 15),
              Text(
                "원하는 난이도를 다시 설정해봐요!",
                style: TextStyle(
                  fontSize: textSize16,
                ),
              ),
              SizedBox(height: 100),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (Difficulties[0].boolIsChecked) {
                                  Difficulties[0].boolIsChecked = false;
                                  boolIsChecked = false;
                                } else {
                                  for (int i = 0;
                                      i < Difficulties.length;
                                      i++) {
                                    Difficulties[i].boolIsChecked = false;
                                  }
                                  Difficulties[0].boolIsChecked = true;
                                  boolIsChecked = true;
                                }
                              });
                            },
                            child: Column(
                              children: [
                                Container(
                                  child: Difficulties[0].boolIsNowDifficulty
                                      ? Text(
                                          "현재 난이도",
                                          style: TextStyle(
                                              color: wordAccentColor,
                                              fontSize: textSize12),
                                        )
                                      : Text(""),
                                  height: 15,
                                ),
                                SizedBox(height: 5),
                                SizedBox(
                                  width: 85,
                                  height: 85,
                                  child: Difficulties[0].boolIsChecked
                                      ? ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          child: Container(
                                            child: Center(
                                              child: Text(
                                                "${Difficulties[0].strName}",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: textSize18),
                                              ),
                                            ),
                                            color:
                                                selectedDifficultyButtonColor,
                                          ),
                                        )
                                      : ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          child: Container(
                                            child: Center(
                                              child: Text(
                                                "${Difficulties[0].strName}",
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: textSize18),
                                              ),
                                            ),
                                            color:
                                                unselectedDifficultyButtonColor,
                                          ),
                                        ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (Difficulties[1].boolIsChecked) {
                                  Difficulties[1].boolIsChecked = false;
                                  boolIsChecked = false;
                                } else {
                                  for (int i = 0;
                                      i < Difficulties.length;
                                      i++) {
                                    Difficulties[i].boolIsChecked = false;
                                  }
                                  Difficulties[1].boolIsChecked = true;
                                  boolIsChecked = true;
                                }
                              });
                            },
                            child: Column(
                              children: [
                                Container(
                                  child: Difficulties[1].boolIsNowDifficulty
                                      ? Text(
                                          "현재 난이도",
                                          style: TextStyle(
                                              color: wordAccentColor,
                                              fontSize: textSize12),
                                        )
                                      : Text(""),
                                  height: 15,
                                ),
                                SizedBox(height: 5),
                                SizedBox(
                                  width: 85,
                                  height: 85,
                                  child: Difficulties[1].boolIsChecked
                                      ? ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          child: Container(
                                            child: Center(
                                              child: Text(
                                                "${Difficulties[1].strName}",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: textSize18),
                                              ),
                                            ),
                                            color:
                                                selectedDifficultyButtonColor,
                                          ),
                                        )
                                      : ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          child: Container(
                                            child: Center(
                                              child: Text(
                                                "${Difficulties[1].strName}",
                                                style: TextStyle(
                                                  fontSize: textSize18,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ),
                                            color:
                                                unselectedDifficultyButtonColor,
                                          ),
                                        ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (Difficulties[2].boolIsChecked) {
                                  Difficulties[2].boolIsChecked = false;
                                  boolIsChecked = false;
                                } else {
                                  for (int i = 0;
                                      i < Difficulties.length;
                                      i++) {
                                    Difficulties[i].boolIsChecked = false;
                                  }
                                  Difficulties[2].boolIsChecked = true;
                                  boolIsChecked = true;
                                }
                              });
                            },
                            child: Column(
                              children: [
                                Container(
                                  child: Difficulties[2].boolIsNowDifficulty
                                      ? Text(
                                          "현재 난이도",
                                          style: TextStyle(
                                              color: wordAccentColor,
                                              fontSize: textSize12),
                                        )
                                      : Text(""),
                                  height: 15,
                                ),
                                SizedBox(height: 5),
                                SizedBox(
                                  width: 85,
                                  height: 85,
                                  child: Difficulties[2].boolIsChecked
                                      ? ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          child: Container(
                                            child: Center(
                                              child: Text(
                                                "${Difficulties[2].strName}",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: textSize18),
                                              ),
                                            ),
                                            color:
                                                selectedDifficultyButtonColor,
                                          ),
                                        )
                                      : ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          child: Container(
                                            child: Center(
                                              child: Text(
                                                "${Difficulties[2].strName}",
                                                style: TextStyle(
                                                  fontSize: textSize18,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ),
                                            color:
                                                unselectedDifficultyButtonColor,
                                          ),
                                        ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (Difficulties[3].boolIsChecked) {
                                  Difficulties[3].boolIsChecked = false;
                                  boolIsChecked = false;
                                } else {
                                  for (int i = 0;
                                      i < Difficulties.length;
                                      i++) {
                                    Difficulties[i].boolIsChecked = false;
                                  }
                                  Difficulties[3].boolIsChecked = true;
                                  boolIsChecked = true;
                                }
                              });
                            },
                            child: Column(
                              children: [
                                Container(
                                  child: Difficulties[3].boolIsNowDifficulty
                                      ? Text(
                                          "현재 난이도",
                                          style: TextStyle(
                                              color: wordAccentColor,
                                              fontSize: textSize12),
                                        )
                                      : Text(""),
                                  height: 15,
                                ),
                                SizedBox(height: 5),
                                SizedBox(
                                  width: 85,
                                  height: 85,
                                  child: Difficulties[3].boolIsChecked
                                      ? ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          child: Container(
                                            child: Center(
                                              child: Text(
                                                "${Difficulties[3].strName}",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: textSize18),
                                              ),
                                            ),
                                            color:
                                                selectedDifficultyButtonColor,
                                          ),
                                        )
                                      : ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          child: Container(
                                            child: Center(
                                              child: Text(
                                                "${Difficulties[3].strName}",
                                                style: TextStyle(
                                                  fontSize: textSize18,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ),
                                            color:
                                                unselectedDifficultyButtonColor,
                                          ),
                                        ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (Difficulties[4].boolIsChecked) {
                                  Difficulties[4].boolIsChecked = false;
                                  boolIsChecked = false;
                                } else {
                                  for (int i = 0;
                                      i < Difficulties.length;
                                      i++) {
                                    Difficulties[i].boolIsChecked = false;
                                  }
                                  Difficulties[4].boolIsChecked = true;
                                  boolIsChecked = true;
                                }
                              });
                            },
                            child: Column(
                              children: [
                                Container(
                                  child: Difficulties[4].boolIsNowDifficulty
                                      ? Text(
                                          "현재 난이도",
                                          style: TextStyle(
                                              color: wordAccentColor,
                                              fontSize: textSize12),
                                        )
                                      : Text(""),
                                  height: 15,
                                ),
                                SizedBox(height: 5),
                                SizedBox(
                                  width: 85,
                                  height: 85,
                                  child: Difficulties[4].boolIsChecked
                                      ? ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          child: Container(
                                            child: Center(
                                              child: Text(
                                                "${Difficulties[4].strName}",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: textSize18),
                                              ),
                                            ),
                                            color:
                                                selectedDifficultyButtonColor,
                                          ),
                                        )
                                      : ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          child: Container(
                                            child: Center(
                                              child: Text(
                                                "${Difficulties[4].strName}",
                                                style: TextStyle(
                                                  fontSize: textSize18,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ),
                                            color:
                                                unselectedDifficultyButtonColor,
                                          ),
                                        ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                  height: 180,
                  child: Center(
                    child: Container(height: 45, child: NextButton()),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget NextButton() {
    return Container(
      width: 100,
      child: InkWell(
        onTap: boolIsChecked
            ? () {
                for (int i = 0; i < Difficulties.length; i++) {
                  Difficulties[i].boolIsChecked = false;
                }
                Navigator.pushNamedAndRemoveUntil(
                    context, MainScreens.routeName, (route) => false);
              }
            : () {},
        child: boolIsChecked
            ? Container(
                decoration: BoxDecoration(
                  color: selectedDifficultyButtonColor,
                  border: Border.all(
                    color: selectedDifficultyButtonColor,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Center(
                    child: Text("다음",
                        style: TextStyle(
                            color: Colors.white, fontSize: textSize18))))
            : Container(
                decoration: BoxDecoration(
                  color: unselectedDifficultyButtonColor,
                  border: Border.all(
                    color: unselectedDifficultyButtonColor,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Center(
                    child: Text(
                  "다음",
                  style: TextStyle(color: Colors.grey, fontSize: textSize18),
                ))),
      ),
    );
  }
}
