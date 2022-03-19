import 'package:bearvoca/screens/home/homeScreen.dart';
import 'package:bearvoca/screens/mainScreens.dart';
import 'package:bearvoca/screens/sign-in/signIn.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacementNamed(context, SignInScreen.routeName);
    });

    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Image(
              image: AssetImage("assets/images/icons8-bear-80.png"),
              width: 150,
              height: 150,
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
    );
  }
}
