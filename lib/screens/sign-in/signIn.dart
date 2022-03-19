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
            const SizedBox(
              height: 100,
            ),
            SizedBox(
              height: 330,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    "리워드와 함께 \n 공부도 하고 돈도 받고!",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  const SizedBox(
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
                  const SizedBox(
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
                  const SizedBox(
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
            const SizedBox(height: 40),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: const Divider(
                height: 10,
                color: Colors.black,
              ),
            ),
            const Text(
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
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}
