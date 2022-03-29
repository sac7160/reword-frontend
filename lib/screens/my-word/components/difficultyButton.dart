import 'package:flutter/material.dart';

class DifficultyButton extends StatelessWidget {
  final String strTitle;
  final int intPosition;

  const DifficultyButton(
      {Key? key, required this.strTitle, required this.intPosition})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var paddingValue = intPosition == 0 ? 16.0 : 8.0;
    return Padding(
      padding: EdgeInsets.only(left: paddingValue),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          border: Border.all(width: 0.5, color: Colors.grey),
        ),
        child: Text(
          strTitle,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
