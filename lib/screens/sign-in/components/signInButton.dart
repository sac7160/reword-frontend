import 'package:flutter/material.dart';

class SignInButton extends StatelessWidget {
  final String? text;
  final GestureTapCallback? press;
  final Color? color;
  final Color? fontColor;

  const SignInButton(
      {Key? key, this.text, this.press, this.color, this.fontColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: color,
        padding: EdgeInsets.all(10),
      ),
      onPressed: press,
      child: Center(
        child: Text(
          text ?? "",
          style: TextStyle(color: fontColor, fontSize: 18),
        ),
      ),
    );
  }
}
