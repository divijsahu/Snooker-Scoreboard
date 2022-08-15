// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, unnecessary_string_interpolations, non_constant_identifier_names, curly_braces_in_flow_control_structures, must_be_immutable

import 'package:flutter/material.dart';

class ScoreBoardPage extends StatefulWidget {
  ScoreBoardPage({
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
  State<ScoreBoardPage> createState() => _ScoreBoardPageState();
}

// Variables
int current_turn = 1;

int p1_score = 0;
int p2_score = 0;
int p1_wins = 00;
int p2_wins = 00;
int diff_score = 0;

int curr_break = 0;
int p1maxbreak = 0;
int p2maxbreak = 0;

int curr_frame = 1;

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

// int left_red = widget.totalreds;
int left_points = 0;

class _ScoreBoardPageState extends State<ScoreBoardPage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    left_points = widget.totalreds * 8 + 27;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Green Bull Cafe!'),
      ),
      body: ListView(
        children: [
          // Match Details!
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 80,
              child: Card(
                color: Colors.amberAccent.shade100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Reds'),
                        Text('Remaining'),
                        Text(widget.totalreds.toString()),
                      ],
                    ),
                    Container(
                        width: width * 0.5,
                        child: Center(
                            child: Text(
                                ' $p1_wins   (${widget.totalframes})   $p2_wins',
                                style: TextStyle(fontSize: 25)))),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Points'),
                        Text('Remaining'),
                        Text('$left_points'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Player 1 Card
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 80,
              child: GestureDetector(
                onTap: (() => setState(() {
                      if (current_turn == 1 && curr_break >= p1maxbreak) {
                        p1maxbreak = curr_break;
                      } else if (current_turn == 2 &&
                          curr_break >= p2maxbreak) {
                        p2maxbreak = curr_break;
                      }
                      current_turn = (current_turn == 1) ? 2 : 1;
                      curr_break = 0;
                    })),
                child: Card(
                  // shadowColor: Colors.white,

                  elevation: (current_turn == 1) ? 10 : 3,
                  color: (current_turn == 1)
                      ? Colors.blueGrey.shade400
                      : Colors.blueGrey.shade200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Maximum'),
                          Text('Break'),
                          Text('$p1maxbreak')
                        ],
                      ),
                      Container(
                          width: width * 0.5,
                          child: Center(
                              child: Text('${widget.p1name}',
                                  style: TextStyle(fontSize: 25)))),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                              (p1_score > p2_score)
                                  ? (p1_score - p2_score).toString()
                                  : '-',
                              style: TextStyle(fontSize: 30)),
                          Text('Points $p1_score'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Indiviual Balls Potted Details
          Container(
            padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
            height: 80,
            child: Card(
              elevation: 3,
              color: Colors.deepPurple.shade100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 40,
                    height: 70,
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
                          Text('$p2pots7',
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 70,
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
                          Text('$p2pots6',
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 70,
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
                          Text('$p2pots5',
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 70,
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
                          Text('$p2pots4',
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 70,
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
                          Text('$p2pots3',
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 70,
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
                          Text('$p2pots2',
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 70,
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
                          Text('$p2pots1',
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Player 2 Card
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 80,
              child: GestureDetector(
                onTap: (() => setState(() {
                      if (current_turn == 1 && curr_break >= p1maxbreak) {
                        p1maxbreak = curr_break;
                      } else if (current_turn == 2 &&
                          curr_break >= p2maxbreak) {
                        p2maxbreak = curr_break;
                      }
                      current_turn = (current_turn == 1) ? 2 : 1;
                      curr_break = 0;
                    })),
                child: Card(
                  elevation: (current_turn == 2) ? 10 : 3,
                  color: (current_turn == 2)
                      ? Colors.blueGrey.shade400
                      : Colors.blueGrey.shade200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Maximum'),
                          Text('Break'),
                          Text('$p2maxbreak')
                        ],
                      ),
                      Container(
                          width: width * 0.5,
                          child: Center(
                            child: Text('${widget.p2name}',
                                style: TextStyle(fontSize: 25)),
                          )),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                              (p2_score > p1_score)
                                  ? (p2_score - p1_score).toString()
                                  : '-',
                              style: TextStyle(fontSize: 30)),
                          Text('Points $p2_score'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          // Balls Potted! 1 2 3 4 5 6 7
          Container(
              height: 70,
              width: MediaQuery.of(context).size.width,
              child: Card(
                color: Colors.deepPurple.shade100,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(
                    color: Colors.black,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // brown blue pink black
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          FloatingActionButton.small(
                            onPressed: () {
                              setState(() {
                                updateIndiScore(current_turn, 7);
                                curr_break += 7;
                                if (current_turn == 1) {
                                  p1_score += 7;
                                } else {
                                  p2_score += 7;
                                }
                              });
                            },
                            backgroundColor: Colors.black,
                            child: Icon(Icons.add_rounded),
                          ),
                          FloatingActionButton.small(
                            onPressed: () {
                              setState(() {
                                updateIndiScore(current_turn, 6);
                                curr_break += 6;
                                if (current_turn == 1) {
                                  p1_score += 6;
                                } else {
                                  p2_score += 6;
                                }
                              });
                            },
                            backgroundColor: Colors.pinkAccent,
                            child: Icon(
                              Icons.add_rounded,
                              color: Colors.black,
                            ),
                          ),
                          FloatingActionButton.small(
                            onPressed: () {
                              setState(() {
                                updateIndiScore(current_turn, 5);
                                curr_break += 5;
                                if (current_turn == 1) {
                                  p1_score += 5;
                                } else {
                                  p2_score += 5;
                                }
                              });
                            },
                            backgroundColor: Colors.blueAccent,
                            child: Icon(
                              Icons.add_rounded,
                              color: Colors.black,
                            ),
                          ),
                          FloatingActionButton.small(
                            onPressed: () {
                              setState(() {
                                updateIndiScore(current_turn, 4);
                                curr_break += 4;
                                if (current_turn == 1) {
                                  p1_score += 4;
                                } else {
                                  p2_score += 4;
                                }
                              });
                            },
                            backgroundColor: Color.fromARGB(255, 171, 73, 31),
                            child: Icon(
                              Icons.add_rounded,
                              color: Colors.black,
                            ),
                          ),
                          FloatingActionButton.small(
                            onPressed: () {
                              setState(() {
                                updateIndiScore(current_turn, 3);
                                curr_break += 3;
                                if (current_turn == 1) {
                                  p1_score += 3;
                                } else {
                                  p2_score += 3;
                                }
                              });
                            },
                            backgroundColor: Colors.green,
                            child: Icon(
                              Icons.add_rounded,
                              color: Colors.black,
                            ),
                          ),
                          FloatingActionButton.small(
                            onPressed: () {
                              setState(() {
                                updateIndiScore(current_turn, 2);
                                curr_break += 2;
                                if (current_turn == 1) {
                                  p1_score += 2;
                                } else {
                                  p2_score += 2;
                                }
                              });
                            },
                            backgroundColor: Colors.amber,
                            child: Icon(
                              Icons.add_rounded,
                              color: Colors.black,
                            ),
                          ),
                          FloatingActionButton.small(
                            onPressed: () {
                              setState(() {
                                updateIndiScore(current_turn, 1);
                                if (widget.totalreds > 0) widget.totalreds--;
                                left_points = widget.totalreds * 8 + 27;
                                curr_break++;
                                if (current_turn == 1) {
                                  p1_score++;
                                } else {
                                  p2_score++;
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
                      // Center(
                      //   child: Text('Balls Potted!',
                      //       style: TextStyle(fontSize: 20)),
                      // ),
                      // green yellow red
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //   children: [
                      // FloatingActionButton.small(
                      //   onPressed: () {
                      //     setState(() {
                      //       curr_break += 3;
                      //       if (current_turn == 1) {
                      //         p1_score += 3;
                      //       } else {
                      //         p2_score += 3;
                      //       }
                      //     });
                      //   },
                      //   backgroundColor: Colors.green,
                      // ),
                      // FloatingActionButton.small(
                      //   onPressed: () {
                      //     setState(() {
                      //       curr_break += 2;
                      //       if (current_turn == 1) {
                      //         p1_score += 2;
                      //       } else {
                      //         p2_score += 2;
                      //       }
                      //     });
                      //   },
                      //   backgroundColor: Colors.amber,
                      // ),
                      // FloatingActionButton.small(
                      //   onPressed: () {
                      //     setState(() {
                      //       if (widget.totalreds > 0) widget.totalreds--;
                      //       left_points = widget.totalreds * 8 + 27;
                      //       curr_break++;
                      //       if (current_turn == 1) {
                      //         p1_score++;
                      //       } else {
                      //         p2_score++;
                      //       }
                      //     });
                      //   },
                      //   backgroundColor: Colors.red,
                      // ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              )),
          SizedBox(
            height: 15,
          ),
          // For the Foul Shots! -4 -5 -6 -7
          Container(
            height: 70,
            width: MediaQuery.of(context).size.width * 0.7,
            child: Card(
              color: Colors.deepPurple.shade100,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(
                  color: Colors.black,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FloatingActionButton.small(
                        onPressed: () {
                          if (widget.totalreds > 0) widget.totalreds--;
                          left_points = widget.totalreds * 8 + 27;
                          setState(() {
                            if (current_turn == 1) {
                              p2_score += 4;
                            } else {
                              p1_score += 4;
                            }
                          });
                        },
                        backgroundColor: Colors.red,
                        child: Icon(
                          Icons.remove_rounded,
                          color: Colors.black,
                        ),
                      ),
                      FloatingActionButton.small(
                        onPressed: () {
                          setState(() {
                            if (current_turn == 1) {
                              p2_score += 4;
                            } else {
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
                      FloatingActionButton.small(
                        onPressed: () {
                          setState(() {
                            if (current_turn == 1) {
                              p2_score += 5;
                            } else {
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
                              p2_score += 6;
                            } else {
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
                              p2_score += 7;
                            } else {
                              p1_score += 7;
                            }
                          });
                        },
                        backgroundColor: Colors.black,
                        child: Icon(
                          Icons.remove_rounded,
                        ),
                      ),
                    ],
                  ),
                  // Center(
                  //   child: Text('Foul Shots!', style: TextStyle(fontSize: 20)),
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [],
                  // ),
                ],
              ),
            ),
          ),
          // Finish Button!
          Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                    onPressed: (() {
                      setState(() {
                        p1_score = 0;
                        p2_score = 0;
                        curr_break = 0;
                        p1maxbreak = 0;
                        p2maxbreak = 0;
                        widget.totalreds = widget.totalredsdummy;
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
                      });
                    }),
                    icon: Icon(Icons.restart_alt_rounded),
                    label: Text('Reset Frame!')),
                ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        if (p1_score > p2_score) {
                          p1_wins++;
                          p1_score = 0;
                          p2_score = 0;
                        } else if (p1_score < p2_score) {
                          p2_wins++;
                          p1_score = 0;
                          p2_score = 0;
                        }
                      });
                    },
                    icon: Icon(Icons.flag_circle_sharp),
                    label: Text('Finish Frame!')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Why this Error?
updateIndiScore(int current_turn, int score) {
  if (current_turn == 1) {
    if (score == 1)
      p1pots1++;
    else if (score == 2)
      p1pots2++;
    else if (score == 3)
      p1pots3++;
    else if (score == 4)
      p1pots4++;
    else if (score == 5)
      p1pots5++;
    else if (score == 6)
      p1pots6++;
    else if (score == 7) p1pots7++;
  } else {
    if (score == 1)
      p2pots1++;
    else if (score == 2)
      p2pots2++;
    else if (score == 3)
      p2pots3++;
    else if (score == 4)
      p2pots4++;
    else if (score == 5)
      p2pots5++;
    else if (score == 6)
      p2pots6++;
    else if (score == 7) p2pots7++;
  }
}
// resetScores() {
//   setState(() {
//     p1_score = 0;
//     p2_score = 0;
//     // diff_score = 0;
//   });
// }
