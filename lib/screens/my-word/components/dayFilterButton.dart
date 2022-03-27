import 'package:flutter/material.dart';

class DayFilterButton extends StatefulWidget {
  @override
  State<DayFilterButton> createState() => _DayFilterButtonState();
}

class _DayFilterButtonState extends State<DayFilterButton> {
  String _selectedDay = 'Day 1';
  List _days = ['Day 1', 'Day2', 'Day3', 'Day40'];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      child: PopupMenuButton(
        padding: EdgeInsets.zero,
        offset: Offset(20, 10),
        icon: Align(
          alignment: Alignment.bottomRight,
          child: TextButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "$_selectedDay",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.black),
                ),
                Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black,
                ),
              ],
            ),
            onPressed: null, //이거따라 밑에 카드 두개도 바뀌어야함
          ),
        ),
        onSelected: (value) {
          setState(() {
            _selectedDay = value.toString();
          });
        },
        itemBuilder: (BuildContext context) {
          return _days
              .map((day) => PopupMenuItem(
                    child: ClipRect(
                      child: Text("$day",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                    ),
                    value: day,
                  ))
              .toList();
        },
      ),
    );
  }
}
