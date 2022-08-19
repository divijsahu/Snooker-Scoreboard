// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter/services.dart';

import 'h_score_board.dart';
// import 'scoreboard_page.dart';

class MyHHomePage extends StatefulWidget {
  const MyHHomePage({Key? key}) : super(key: key);

  @override
  State<MyHHomePage> createState() => _MyHHomePageState();
}

class _MyHHomePageState extends State<MyHHomePage> {
  final _player1 = TextEditingController()..text = 'Green Bull';
  final _player2 = TextEditingController()..text = 'Little Talk';
  final _formKey = GlobalKey<FormState>();

  int frame_count = 3;
  int frame_redball = 15;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
    ]);
    return Scaffold(
        body: Form(
            key: _formKey,
            child: Container(
              color: Colors.black,
              child: ListView(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Center(
                      child: Text(
                    'GREENBULLCAFE',
                    style: TextStyle(fontSize: 30, color: Colors.green),
                  )),
                  SizedBox(
                    height: 20,
                  ),

                  // Player 1 Name + Player 2 Name
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // Player 1 Name
                      Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/container_bg.jpg'),
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Theme(
                          data: Theme.of(context)
                              .copyWith(splashColor: Colors.transparent),
                          child: TextFormField(
                            style: TextStyle(
                                // color: Colors.green,
                                fontWeight: FontWeight.bold),
                            controller: _player1,
                            decoration: InputDecoration(
                                // labelText: '              Name',
                                hintText: "Player's Name",
                                // labelStyle: TextStyle(color: Colors.white60),
                                hintStyle: TextStyle(color: Colors.white60),
                                border: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.black,
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    Icons.clear,
                                    color: Colors.black,
                                  ),
                                  onPressed: _player1.clear,
                                )),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "    Player Name Required";
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      // Player 2 Name
                      Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/container_bg.jpg'),
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Theme(
                          data: Theme.of(context)
                              .copyWith(splashColor: Colors.transparent),
                          child: TextFormField(
                            // initialValue: 'Little Talk!',
                            // style: TextStyle(color),
                            controller: _player2,
                            decoration: InputDecoration(
                                // labelText: '      Name',
                                hintText: "Player's Name",
                                // labelStyle: TextStyle(color: Colors.white60),
                                hintStyle: TextStyle(color: Colors.white60),
                                // filled: true,
                                // fillColor: Colors.greenAccent,
                                border: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.black,
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    Icons.clear,
                                    color: Colors.black,
                                  ),
                                  onPressed: _player2.clear,
                                )),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '    Player Name Required';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),

                  // GreenBull Logo!
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      'images/GBlogo.jpeg',
                      // width: MediaQuery.of(context).size.width * 0.5,
                      // height: MediaQuery.of(context).size.height * 0.5,
                      width: 52,
                      height: 120,

                      fit: BoxFit.fitHeight,
                    ),
                  ),

                  // Frame Count + Red Balls Count
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // Frame Count
                      Container(
                          width: MediaQuery.of(context).size.width * 0.25,
                          height: 50,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('images/container_bg.jpg'),
                              fit: BoxFit.fill,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        if (frame_count > 2) frame_count -= 2;
                                      });
                                    },
                                    icon: Icon(
                                      Icons.remove_circle_outline_rounded,
                                      color: Colors.black,
                                    )),
                                Text(
                                  '             $frame_count\nNo. of Frames',
                                ),
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        frame_count += 2;
                                      });
                                    },
                                    icon: Icon(
                                      Icons.add_circle_outline_rounded,
                                      color: Colors.black,
                                    )),
                              ])),
                      // Red Balls Count
                      Container(
                          width: MediaQuery.of(context).size.width * 0.25,
                          height: 50,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('images/container_bg.jpg'),
                              fit: BoxFit.fill,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (frame_redball == 15) {
                                        frame_redball = 10;
                                      } else if (frame_redball == 10) {
                                        frame_redball = 6;
                                      }
                                    });
                                  },
                                  icon: Icon(
                                    Icons.remove_circle_outline_rounded,
                                    color: Colors.black,
                                  )),
                              Text('      $frame_redball\nRed Balls!'),
                              IconButton(
                                  color: Colors.blue,
                                  onPressed: () {
                                    setState(() {
                                      if (frame_redball == 6) {
                                        frame_redball = 10;
                                      } else if (frame_redball == 10) {
                                        frame_redball = 15;
                                      }
                                    });
                                  },
                                  icon: Icon(
                                    Icons.add_circle_outline_rounded,
                                    color: Colors.black,
                                  )),
                            ],
                          )),
                    ],
                  ),
                  // Start Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HScoreBoardPage(
                                        p1name: _player1.text,
                                        p2name: _player2.text,
                                        totalframes: frame_count,
                                        totalreds: frame_redball,
                                        totalredsdummy: frame_redball,
                                      )),
                            );
                          }
                        },
                        icon: Icon(
                          Icons.stay_current_landscape_rounded,
                          color: Colors.white,
                        ),
                        label: Text('START'),
                      ),
                    ],
                  )
                ],
              ),
            )));
  }
}
