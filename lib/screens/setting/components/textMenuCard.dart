import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextMenuCard extends StatelessWidget {
  final String? title;
  final IconData? icon;
  final GestureTapCallback? press;
  final Color? textColor;
  final Color? iconColor;

  const TextMenuCard({
    Key? key,
    this.title,
    this.icon,
    this.press,
    this.textColor = Colors.black,
    this.iconColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Card(
        margin: EdgeInsets.zero,
        color: Colors.yellow,
        elevation: 0,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                title ?? "",
                style: TextStyle(color: textColor, fontSize: 16),
              ),
              Spacer(),
              SizedBox(
                width: 26,
                child: Icon(icon),
              )
            ],
          ),
        ),
      ),
    );
  }
}
