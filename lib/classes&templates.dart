// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';

class InfoTemplate extends StatefulWidget {
  const InfoTemplate({Key? key, required this.text1, required this.text2})
      : super(key: key);
  final String text1, text2;
  @override
  State<InfoTemplate> createState() => _InfoTemplate();
}

class _InfoTemplate extends State<InfoTemplate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(
                    color: Colors.teal,
                  ),
                ),
                elevation: 3,
                color: Colors.tealAccent,
                child: Center(
                    child: Text(widget.text1, style: TextStyle(fontSize: 20)))),
          ),
          Container(
            // width: MediaQuery.of(context).size.width * 0.5,
            width: 100,
            child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(
                    color: Colors.teal,
                  ),
                ),
                elevation: 3,
                color: Colors.tealAccent,
                child: Center(
                    child: Text(widget.text2, style: TextStyle(fontSize: 20)))),
          ),
        ],
      ),
    );
  }
}
