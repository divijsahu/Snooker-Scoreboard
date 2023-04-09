// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, sized_box_for_whitespace, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class HScoreBoardPage extends StatefulWidget {
  HScoreBoardPage({
    Key? key,
    required this.p1name,
    required this.p2name,
    required this.totalframes,
    required this.totalreds,
    required this.totalredsdummy,
  }) : super(key: key);
  final String p1name, p2name;
  int totalreds, totalframes, totalredsdummy;

  @override
  State<HScoreBoardPage> createState() => _HScoreBoardPageState();
}

// Variables
int current_turn = 1;

int p1_score = 0;
int p2_score = 0;
int diff_score = 0;

int curr_break = 0;
int p1maxbreak = 0;
int p2maxbreak = 0;

int curr_frame = 1;

int p1fouls = 0;
int p2fouls = 0;
int p1pots7 = 0;
int p1pots6 = 0;
int p1pots5 = 0;
int p1pots4 = 0;
int p1pots3 = 0;
int p1pots2 = 0;
int p1pots1 = 0;

int p2pots7 = 0;
int p2pots6 = 0;
int p2pots5 = 0;
int p2pots4 = 0;
int p2pots3 = 0;
int p2pots2 = 0;
int p2pots1 = 0;

int match_winner = 0;
int p1_wins = 00;
int p2_wins = 00;
// int left_red = widget.totalreds;
int left_points = 0;
int color_points = 27;

bool shot_after_last_red = false;

class _HScoreBoardPageState extends State<HScoreBoardPage> {
  @override
  Widget build(BuildContext context) {
    // Force Landscape Orientation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
    ]);
    // Hide Notification Bar & Control Buttons Bar (Android)
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    final width = MediaQuery.of(context).size.width;
    left_points = widget.totalreds * 8 + color_points;
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          // Player 1 Name + Frame & Wins + Player 2 Name
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Player 1 Name
              Container(
                decoration: BoxDecoration(
                    // color: Colors.amberAccent.shade100,
                    // image: DecorationImage(
                    //   image: AssetImage('images/container_bg.jpg'),
                    //   fit: BoxFit.fill,
                    // ),
                    border: Border.all(
                      color: Colors.white,
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(80),
                      bottomRight: Radius.circular(80),
                    )),
                width: width * 0.4,
                height: 45,
                child: Center(
                  child: Text(
                    widget.p1name ,
                    // .toUpperCase(),
                    style: GoogleFonts.ptSerif(
                      textStyle: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              // Frame & Wins Card
              Container(
                  decoration: BoxDecoration(
                    // image: DecorationImage(
                    //   image: AssetImage('images/container_bg.jpg'),
                    //   fit: BoxFit.fill,
                    // ),
                    border: Border.all(
                      color: Colors.white,
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: width * 0.17,
                  height: 40,
                  child: Center(
                      child:
                          Text('$p1_wins   (${widget.totalframes})   $p2_wins',
                              style: TextStyle(
                                fontSize: 25,

                                fontWeight: FontWeight.bold,
                                color: Colors.white,

                              )))),
              // Player 2 Name
              Container(
                decoration: BoxDecoration(
                    // color: Colors.grey.shade800,
                    // image: DecorationImage(
                    //   image: AssetImage('images/container_bg.jpg'),
                    //   fit: BoxFit.fill,
                    // ),
                    border: Border.all(
                      color: Colors.white,
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(80),
                      bottomLeft: Radius.circular(80),
                    )),
                width: width * 0.40,
                height: 45,
                child: Center(
                  child: Text(
                    widget.p2name,
                    // .toUpperCase(),
                    style: GoogleFonts.ptSerif(
                      textStyle: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Individual Balls Pot Count + GreenBullCafe!
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Individual Player 1 Balls Pot Count
              Container(
                height: 38,
                child: Card(
                  elevation: 3,
                  color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 30,
                        height: 40,
                        child: Card(
                          elevation: 3,
                          color: Colors.red,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                '$p1pots1',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 30,
                        height: 40,
                        child: Card(
                          elevation: 3,
                          color: Colors.amber,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                '$p1pots2',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 30,
                        height: 40,
                        child: Card(
                          elevation: 3,
                          color: Colors.green,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                '$p1pots3',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 30,
                        height: 40,
                        child: Card(
                          elevation: 3,
                          color: Color.fromARGB(255, 171, 73, 31),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                '$p1pots4',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 30,
                        height: 40,
                        child: Card(
                          elevation: 3,
                          color: Colors.blueAccent,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                '$p1pots5',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 30,
                        height: 40,
                        child: Card(
                          elevation: 3,
                          color: Colors.pinkAccent,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                '$p1pots6',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: 30,
                        height: 25,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Colors.white,
                            width: 0.5,
                          ),
                        ),
                        child: Card(
                          color: Colors.black,
                          elevation: 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                '$p1pots7',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Green Bull Cafe
              Container(

                height: 30,
                decoration: BoxDecoration(
                  // color: Colors.transparent,
                  image: DecorationImage(
                    image: AssetImage('images/container_bg.jpg'),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(50),
                
                ),
                child: Center(
                    child: Text(
                  'Golden Frame Tournament',
                  style: GoogleFonts.ptSerif(
                      textStyle: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                )),
              ),
              // Individual Player 2 Balls Pot Count
              Container(
                // padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                height: 39,
                child: Card(
                  elevation: 3,
                  color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Colors.white,
                            width: 0.5,
                          ),
                        ),
                        width: 30,
                        height: 25,
                        child: Card(
                          color: Colors.black,
                          elevation: 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                '$p2pots7',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: 30,
                        height: 40,
                        child: Card(
                          elevation: 3,
                          color: Colors.pinkAccent,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                '$p2pots6',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 30,
                        height: 40,
                        child: Card(
                          elevation: 3,
                          color: Colors.blueAccent,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                '$p2pots5',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 30,
                        height: 40,
                        child: Card(
                          elevation: 3,
                          color: Color.fromARGB(255, 171, 73, 31),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                '$p2pots4',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 30,
                        height: 40,
                        child: Card(
                          elevation: 3,
                          color: Colors.green,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                '$p2pots3',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 30,
                        height: 40,
                        child: Card(
                          elevation: 3,
                          color: Colors.amber,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                '$p2pots2',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 30,
                        height: 40,
                        child: Card(
                          elevation: 3,
                          color: Colors.red,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                '$p2pots1',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Individual Balls Potted for Player 2
                ),
              ),
            ],
          ),
          // Player 1 Details Card + Logo & Curr_Break + Player 2 Details Card
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Player 1 Details Card
              Container(
                width: 300,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.white,
                    width: 0.5,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Max Break and Foul Points
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Max Break
                          Container(
                            width: 120,
                            height: 60,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade800,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40),
                                  topRight: Radius.circular(40),
                                )),
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    '$p1maxbreak',
                                    style: GoogleFonts.ptSerif(
                                      textStyle: TextStyle(
                                          fontSize: 20, color: Colors.white
                                          // fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                  Text(
                                    'MAX BREAK',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white),
                                  )
                                ]),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          // Foul Points
                          Container(
                            width: 120,
                            height: 60,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade800,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(40),
                                  bottomRight: Radius.circular(40),
                                )),
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'FOUL PENALTY',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    '$p1fouls',
                                    style: GoogleFonts.ptSerif(
                                      textStyle: TextStyle(
                                          fontSize: 20, color: Colors.white
                                          // fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  )
                                ]),
                          )
                        ]),
                    // Lead and Total Points of a Player 1
                    Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Card(
                              color: Colors.transparent,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
                                child: Text(
                                    (p1_score > p2_score)
                                        ? (p1_score - p2_score).toString()
                                        : '0',
                                    style: GoogleFonts.ptSerif(
                                        textStyle: TextStyle(
                                            fontSize: 65,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white))),
                              )),
                          Card(
                            color: Colors.grey.shade800,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
                              child: Text('POINTS  $p1_score',
                                  style: GoogleFonts.ptSerif(
                                      textStyle: TextStyle(
                                          fontSize: 20, color: Colors.white))),
                            ),
                          ),
                        ]),
                  ],
                ),
              ),
              // Logo & Current Break
              Column(
                children: [
                  // GB Logo
                  Container(
                    height: 100,
                    width: 100,
                    child: GestureDetector(
                      onTap: (() => setState(() {
                            shot_after_last_red = false;
                            if (current_turn == 1 && curr_break >= p1maxbreak) {
                              p1maxbreak = curr_break;
                            } else if (current_turn == 2 &&
                                curr_break >= p2maxbreak) {
                              p2maxbreak = curr_break;
                            }
                            current_turn = (current_turn == 1) ? 2 : 1;
                            curr_break = 0;
                          })),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          'images/divij.sahu.logo.trans2.png',
                          width: width * 0.2,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  // Current Break & Turn Arrow Indicator
                  Container(
                    height: 40,
                    width: 110,
                    child: Card(
                        color: Colors.black,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.arrow_back_rounded,
                              color: (current_turn == 1)
                                  ? Colors.white
                                  : Colors.transparent,
                            ),
                            Text(
                              '$curr_break',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            ),
                            Icon(
                              Icons.arrow_forward_rounded,
                              color: (current_turn == 2)
                                  ? Colors.white
                                  : Colors.transparent,
                            ),
                          ],
                        )),
                  ),
                ],
              ),
              // Player 2 Details Card
              Container(
                width: 300,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.white,
                    width: 0.5,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Lead and Total Points of a Player
                    Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Card(
                              color: Colors.transparent,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
                                child: Text(
                                    (p2_score > p1_score)
                                        ? (p2_score - p1_score).toString()
                                        : '0',
                                    style: GoogleFonts.ptSerif(
                                        textStyle: TextStyle(
                                            fontSize: 65,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white))),
                              )),
                          Card(
                            color: Colors.grey.shade800,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
                              child: Text('POINTS  $p2_score',
                                  style: GoogleFonts.ptSerif(
                                      textStyle: TextStyle(
                                          fontSize: 20, color: Colors.white))),
                            ),
                          ),
                        ]),
                    // Max Break and Foul Points
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Max Break
                          Container(
                            width: 120,
                            height: 60,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade800,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40),
                                  topRight: Radius.circular(40),
                                )),
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    '$p2maxbreak',
                                    style: GoogleFonts.ptSerif(
                                      textStyle: TextStyle(
                                          fontSize: 20, color: Colors.white
                                          // fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                  Text(
                                    'MAX BREAK',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white),
                                  )
                                ]),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          // Foul Points
                          Container(
                            width: 120,
                            height: 60,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade800,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(40),
                                  bottomRight: Radius.circular(40),
                                )),
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'FOUL PENALTY',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white),
                                  ),
                                  Text(
                                    '$p2fouls',
                                    style: GoogleFonts.ptSerif(
                                      textStyle: TextStyle(
                                          fontSize: 20, color: Colors.white
                                          // fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  )
                                ]),
                          )
                        ]),
                  ],
                ),
              ),
            ],
          ),
          // Remaining Reds + Balls Potted Buttons + Points Remaining
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Remaining Reds info
              Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Container(
                    height: 35,
                    width: width * 0.25,
                    // Golden Color Container
                    // color: Colors.transparent,
                    decoration: BoxDecoration(
                        // image: DecorationImage(
                        //   image: AssetImage('images/container_bg.jpg'),
                        //   fit: BoxFit.fill,
                        // ),
                        // color: Colors.grey.shade800,
                        border: Border.all(
                          color: Colors.white,
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(80),
                          bottomRight: Radius.circular(80),
                        )),
                    child: Center(
                        child: Text('Remaining Reds ${widget.totalreds}',
                            style: GoogleFonts.ptSerif(
                                textStyle: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white))))),
              ),
              // Balls Potting Buttons
              Card(
                color: Colors.transparent,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Yellow Pot Button
                    FloatingActionButton.small(
                      onPressed: () {
                        setState(() {
                          if (left_points >= 2) {
                            updateIndiScore(current_turn, 2);
                            curr_break += 2;
                            if (current_turn == 1) {
                              p1_score += 2;
                            } else {
                              p2_score += 2;
                            }
                            if (widget.totalreds == 0 && color_points >= 2) {
                              if (shot_after_last_red == false) {
                                color_points -= 2;
                              }
                            }
                            shot_after_last_red = false;
                          }
                        });
                      },
                      backgroundColor: Colors.amber,
                      child: Icon(
                        Icons.add_rounded,
                        color: Colors.black,
                      ),
                    ),
                    // Brown Pot Button
                    FloatingActionButton.small(
                      onPressed: () {
                        setState(() {
                          if (left_points >= 4) {
                            updateIndiScore(current_turn, 4);
                            curr_break += 4;
                            if (current_turn == 1) {
                              p1_score += 4;
                            } else {
                              p2_score += 4;
                            }
                            if (widget.totalreds == 0 && color_points >= 4) {
                              if (shot_after_last_red == false) {
                                color_points -= 4;
                              }
                            }
                            shot_after_last_red = false;
                          }
                        });
                      },
                      backgroundColor: Color.fromARGB(255, 171, 73, 31),
                      child: Icon(
                        Icons.add_rounded,
                        color: Colors.black,
                      ),
                    ),
                    // Pink Pot Button
                    FloatingActionButton.small(
                      onPressed: () {
                        setState(() {
                          if (left_points >= 6) {
                            updateIndiScore(current_turn, 6);
                            curr_break += 6;
                            if (current_turn == 1) {
                              p1_score += 6;
                            } else {
                              p2_score += 6;
                            }
                            if (widget.totalreds == 0 && color_points >= 6) {
                              if (shot_after_last_red == false) {
                                color_points -= 6;
                              }
                            }
                            shot_after_last_red = false;
                          }
                        });
                      },
                      backgroundColor: Colors.pinkAccent,
                      child: Icon(
                        Icons.add_rounded,
                        color: Colors.black,
                      ),
                    ),
                    // Black Pot Button
                    FloatingActionButton.small(
                      onPressed: () {
                        setState(() {
                          if (left_points >= 7) {
                            updateIndiScore(current_turn, 7);
                            curr_break += 7;
                            if (current_turn == 1) {
                              p1_score += 7;
                            } else {
                              p2_score += 7;
                            }
                            if (widget.totalreds == 0 && color_points >= 7) {
                              if (shot_after_last_red == false)
                                color_points -= 7;
                            }
                            shot_after_last_red = false;
                          }
                        });
                      },
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(
                          width: 0.5,
                          color: Colors.white,
                        ),
                      ),
                      child: Icon(Icons.add_rounded),
                    ),
                    // Blue Pot Button
                    FloatingActionButton.small(
                      onPressed: () {
                        setState(() {
                          if (left_points >= 5) {
                            updateIndiScore(current_turn, 5);
                            curr_break += 5;
                            if (current_turn == 1) {
                              p1_score += 5;
                            } else {
                              p2_score += 5;
                            }
                            if (widget.totalreds == 0 && color_points >= 5) {
                              if (shot_after_last_red == false) {
                                color_points -= 5;
                              }
                            }
                            shot_after_last_red = false;
                          }
                        });
                      },
                      backgroundColor: Colors.blueAccent,
                      child: Icon(
                        Icons.add_rounded,
                        color: Colors.black,
                      ),
                    ),
                    // Green Pot Button
                    FloatingActionButton.small(
                      onPressed: () {
                        setState(() {
                          if (left_points >= 3) {
                            updateIndiScore(current_turn, 3);
                            curr_break += 3;
                            if (current_turn == 1) {
                              p1_score += 3;
                            } else {
                              p2_score += 3;
                            }
                            if (widget.totalreds == 0 && color_points >= 3) {
                              if (shot_after_last_red == false)
                                color_points -= 3;
                            }
                            shot_after_last_red = false;
                          }
                        });
                      },
                      backgroundColor: Colors.green,
                      child: Icon(
                        Icons.add_rounded,
                        color: Colors.black,
                      ),
                    ),
                    // Red Pot Button
                    FloatingActionButton.small(
                      onPressed: () {
                        setState(() {
                          if (widget.totalreds > 0) {
                            if (widget.totalreds == 1) {
                              shot_after_last_red = true;
                            }
                            updateIndiScore(current_turn, 1);
                            widget.totalreds--;
                            // left_points--;
                            curr_break++;
                            if (current_turn == 1) {
                              p1_score++;
                            } else {
                              p2_score++;
                            }
                            left_points = widget.totalreds * 8 + color_points;
                          }
                        });
                      },
                      backgroundColor: Colors.red,
                      child: Icon(
                        Icons.add_rounded,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              // Points on Table
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: Container(
                    height: 35,
                    width: width * 0.25,
                    decoration: BoxDecoration(
                        // color: Colors.grey.shade800,

                        // image: DecorationImage(
                        //   image: AssetImage('images/container_bg.jpg'),
                        //   fit: BoxFit.fill,
                        // ),
                        border: Border.all(
                          color: Colors.white,
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(80),
                          bottomLeft: Radius.circular(80),
                        )),
                    child: Center(
                        child: Text('$left_points Points on Table',
                            style: GoogleFonts.ptSerif(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold))))),
              ),
            ],
          ),
          // Reset Frame + Fouls Buttons + Finish Frame
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Reset Frame Button
              ElevatedButton.icon(
                onPressed: (() {
                  setState(() {
                    p1_score = 0;
                    p2_score = 0;
                    curr_break = 0;
                    p1maxbreak = 0;
                    p2maxbreak = 0;
                    widget.totalreds = widget.totalredsdummy;
                    color_points = 27;
                    p1pots1 = 0;
                    p1pots2 = 0;
                    p1pots3 = 0;
                    p1pots4 = 0;
                    p1pots5 = 0;
                    p1pots6 = 0;
                    p1pots7 = 0;
                    p2pots1 = 0;
                    p2pots2 = 0;
                    p2pots3 = 0;
                    p2pots4 = 0;
                    p2pots5 = 0;
                    p2pots6 = 0;
                    p2pots7 = 0;
                    p1fouls = p2fouls = 0;
                  });
                }),
                icon: Icon(Icons.restart_alt_rounded),
                label: Text('Reset Frame!'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey.shade800, // Background color
                ),
              ),
              // Fouls Buttons
              Container(
                height: 51,
                width: MediaQuery.of(context).size.width * 0.4,
                child: Card(
                  color: Colors.transparent,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FloatingActionButton.small(
                        // Increase Reds Count Button
                        onPressed: () {
                          // left_points = widget.totalreds * 8 + 27;
                          // if (widget.totalreds > 0) widget.totalreds--;
                          // left_points--;
                          setState(() {
                            if (widget.totalreds < widget.totalredsdummy) {
                              widget.totalreds++;
                              shot_after_last_red = false;
                            }
                            // if (current_turn == 1) {
                            //   p2_score += 4;
                            // } else {
                            //   p1_score += 4;
                            // }
                          });
                        },
                        backgroundColor: Colors.red,
                        child: Icon(
                          Icons.add_rounded,
                          color: Colors.black,
                        ),
                      ),
                      FloatingActionButton.small(
                        onPressed: () {
                          // left_points = widget.totalreds * 8 + 27;
                          // if (widget.totalreds > 0) widget.totalreds--;
                          // left_points--;
                          setState(() {
                            if (widget.totalreds > 0) widget.totalreds--;
                            // if (current_turn == 1) {
                            //   p2_score += 4;
                            // } else {
                            //   p1_score += 4;
                            // }
                          });
                        },
                        backgroundColor: Colors.red,
                        child: Icon(
                          Icons.remove_rounded,
                          color: Colors.white,
                        ),
                      ),
                      FloatingActionButton.small(
                        onPressed: () {
                          setState(() {
                            if (current_turn == 1) {
                              p1fouls += 5;
                              p2_score += 5;
                            } else {
                              p2fouls += 5;
                              p1_score += 5;
                            }
                          });
                        },
                        backgroundColor: Colors.blueAccent,
                        child: Icon(
                          Icons.remove_rounded,
                          color: Colors.black,
                        ),
                      ),
                      FloatingActionButton.small(
                        onPressed: () {
                          setState(() {
                            if (current_turn == 1) {
                              p1fouls += 7;
                              p2_score += 7;
                            } else {
                              p2fouls += 7;
                              p1_score += 7;
                            }
                          });
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(
                            width: 0.5,
                            color: Colors.white,
                          ),
                        ),
                        backgroundColor: Colors.black,
                        child: Icon(
                          Icons.remove_rounded,
                        ),
                      ),
                      FloatingActionButton.small(
                        onPressed: () {
                          setState(() {
                            if (current_turn == 1) {
                              p1fouls += 6;

                              p2_score += 6;
                            } else {
                              p2fouls += 6;
                              p1_score += 6;
                            }
                          });
                        },
                        backgroundColor: Colors.pinkAccent,
                        child: Icon(
                          Icons.remove_rounded,
                          color: Colors.black,
                        ),
                      ),
                      FloatingActionButton.small(
                        onPressed: () {
                          setState(() {
                            if (current_turn == 1) {
                              p1fouls += 4;
                              p2_score += 4;
                            } else {
                              p2fouls += 4;
                              p1_score += 4;
                            }
                          });
                        },
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.remove_rounded,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Finish Frame Button
              ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    p1pots1 = 0;
                    p1pots2 = 0;
                    p1pots3 = 0;
                    p1pots4 = 0;
                    p1pots5 = 0;
                    p1pots6 = 0;
                    p1pots7 = 0;
                    p2pots1 = 0;
                    p2pots2 = 0;
                    p2pots3 = 0;
                    p2pots4 = 0;
                    p2pots5 = 0;
                    p2pots6 = 0;
                    p2pots7 = 0;
                    p1fouls = p2fouls = 0;
                    p1maxbreak = p2maxbreak = 0;
                    curr_break = 0;
                    if (p1_score > p2_score) {
                      p1_wins++;
                      p1_score = 0;
                      p2_score = 0;
                    } else if (p1_score < p2_score) {
                      p2_wins++;
                      p1_score = 0;
                      p2_score = 0;
                    }
                    if (p1_wins > widget.totalframes / 2) {
                      match_winner = 1;
                      openDialog();
                      p1_wins = 0;
                      p2_wins = 0;
                    }
                    if (p2_wins > widget.totalframes / 2) {
                      match_winner = 2;
                      openDialog();
                      p1_wins = 0;
                      p2_wins = 0;
                    }
                  });
                },
                icon: Icon(Icons.flag_circle_sharp),
                label: Text('Finish Frame!'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey.shade800, // Background color
                ),
              ),
            ],
          ),
          // Developer Credits

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('    Made with ❤️ in India!',
                  style: GoogleFonts.ptSerif(
                      textStyle:
                          TextStyle(fontSize: 12, color: Colors.blueGrey))),
              Text('Developed by ~>> Divij Sahu!       ',
                  style: GoogleFonts.ptSerif(
                      textStyle:
                          TextStyle(fontSize: 10, color: Colors.blueGrey)))
            ],
          )

        ],
      ),
    );
  }

  Future openDialog() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: (match_winner == 1)
                ? Text('${widget.p1name} Won!')
                : Text('${widget.p2name} Won!'),
          ));
}

updateIndiScore(int current_turn, int score) {
  if (current_turn == 1) {
    if (score == 1 && p1pots1 < 15) {
      p1pots1++;
    } else if (score == 2 && p1pots2 < 15) {
      p1pots2++;
    } else if (score == 3 && p1pots3 < 15) {
      p1pots3++;
    } else if (score == 4 && p1pots4 < 15) {
      p1pots4++;
    } else if (score == 5 && p1pots5 < 15) {
      p1pots5++;
    } else if (score == 6 && p1pots6 < 15) {
      p1pots6++;
    } else if (score == 7 && p1pots7 < 15) {
      p1pots7++;
    }
  } else {
    if (score == 1 && p2pots1 < 15) {
      p2pots1++;
    } else if (score == 2 && p2pots2 < 15) {
      p2pots2++;
    } else if (score == 3 && p2pots3 < 15) {
      p2pots3++;
    } else if (score == 4 && p2pots4 < 15) {
      p2pots4++;
    } else if (score == 5 && p2pots5 < 15) {
      p2pots5++;
    } else if (score == 6 && p2pots6 < 15) {
      p2pots6++;
    } else if (score == 7 && p2pots7 < 15) {
      p2pots7++;
    }
  }
}
