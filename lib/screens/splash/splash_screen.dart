import 'package:bearvoca/screens/home/home_screen.dart';
import 'package:bearvoca/screens/main_screens.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 1 /*5*/), () {
      Navigator.pushReplacementNamed(context, MainScreens.routeName);
    });

    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Image(
                  image: AssetImage("assets/images/icons8-bear-80.png"),
                  width: 150,
                  height: 150,
                ),
              ),
              Text(
                "Bear Voca",
                style: TextStyle(
                  color: Colors.brown,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
