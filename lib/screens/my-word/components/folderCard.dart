import 'package:bearvoca/values/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FolderCard extends StatelessWidget {
  final String? name;
  final double? height;
  final String? routeName;

  const FolderCard({
    Key? key,
    this.name,
    this.height,
    this.routeName,
  }) : super(key: key);

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
              Icon(
                Icons.folder,
                color: Colors.black,
                size: 70,
              ),
              Text(
                "$name",
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: wordTitleText),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, routeName!);
                  },
                  icon: Icon(
                    FontAwesomeIcons.angleRight,
                    color: Colors.black,
                  )),
            ],
          )),
    );
  }
}
