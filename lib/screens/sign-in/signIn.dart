import 'package:bearvoca/screens/sign-in/components/signInButton.dart';
import 'package:bearvoca/screens/sign-in/siginInEmail.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = "/SignInScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 100,
            ),
            Container(
              height: 330,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "리워드와 함께 \n 공부도 하고 돈도 받고!",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 20,
                    child: SignInButton(
                      text: "kakao계정으로 시작",
                      press: () {},
                      color: Colors.brown,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 20,
                    child: SignInButton(
                      text: "Apple 계정으로 시작",
                      press: () {},
                      color: Colors.white,
                      fontColor: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 20,
                    child: SignInButton(
                      text: "이메일 / 핸드폰 으로 시작",
                      press: () {},
                      color: Colors.white,
                      fontColor: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Divider(
                height: 10,
                color: Colors.black,
              ),
            ),
            Text(
              "이미 계정이 있으신가요?",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 20,
              child: SignInButton(
                text: "로그인하기",
                press: () {
                  Navigator.pushNamed(context, SignInEmailScreen.routeName);
                },
                color: Colors.white,
                fontColor: Colors.black,
              ),
            ),
            SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}
