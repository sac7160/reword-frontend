import 'package:bearvoca/screens/achievement-rate/achievementRate.dart';
import 'package:bearvoca/screens/my-word/myWord.dart';
import 'package:bearvoca/screens/reward/reward.dart';
import 'package:bearvoca/screens/setting/setting.dart';
import 'package:flutter/material.dart';
import '../../models/navItem.dart';
import 'home/homeScreen.dart';

class MainScreens extends StatefulWidget {
  static String routeName = "/MainScreens";

  @override
  _MainScreensState createState() => _MainScreensState();
}

class _MainScreensState extends State<MainScreens> {
  int _selectedIndex = 0;
  List pages = [
    HomeScreen(),
    MyWordScreen(),
    RewardScreen(),
    AchievementRateScreen(),
    SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        selectedFontSize: 12.0,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: List.generate(
            navItems.length,
            (index) => BottomNavigationBarItem(
                icon: Icon(navItems[index].icon),
                label: navItems[index].label)),
      ),
    );
  }
}
