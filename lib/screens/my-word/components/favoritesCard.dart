import 'package:flutter/material.dart';

class FavoritesCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.grey,
        elevation: 0,
        child: Center(
          child: Text('아직 즐겨찾기한 단어가 없어요'),
        ),
      ),
    );
  }
}
