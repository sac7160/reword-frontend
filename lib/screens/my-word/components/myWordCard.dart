import 'package:flutter/material.dart';

import '../myWordStudy.dart';

class MyWordCard extends StatelessWidget {
  final String? name;
  final String? buttonName;
  final double? height;
  final String? routename;
  final double? buttonWidth;

  const MyWordCard(
      {Key? key,
      this.name,
      this.buttonName,
      this.height,
      this.routename,
      this.buttonWidth = 100})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: Colors.grey,
          elevation: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "$name",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Container(
                width: buttonWidth,
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, routename!);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "$buttonName",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Icon(
                          Icons.arrow_right_alt_outlined,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
