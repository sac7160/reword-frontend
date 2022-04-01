import 'package:flutter/material.dart';

class Ad extends StatelessWidget {
  const Ad({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.grey),
      height: 300,
      child: Center(
        child: Text("광고 자리입니다"),
      ),
    );
  }
}
