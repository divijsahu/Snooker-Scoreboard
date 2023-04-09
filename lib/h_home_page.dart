// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter/services.dart';

import 'h_score_board.dart';
// import 'scoreboard_page.dart';

class MyHHomePage extends StatefulWidget {
  const MyHHomePage({Key? key}) : super(key: key);

  @override
  State<MyHHomePage> createState() => _MyHHomePageState();
}

class _MyHHomePageState extends State<MyHHomePage> {
  final _player1 = TextEditingController()..text = 'Mark Selby';
  final _player2 = TextEditingController()..text = 'Judd Trump';
  final _formKey = GlobalKey<FormState>();

  int frame_count = 3;
  int frame_redball = 15;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return Scaffold(
        body: Form(
            key: _formKey,
            child: Container(
              height: MediaQuery.of(context).size.height,
              color: Colors.black,
              child: ListView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      //col 1
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            // p1name
                            Container(
                              width: MediaQuery.of(context).size.width * 0.25,
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
                                  textAlign: TextAlign.center,
                                  textAlignVertical: TextAlignVertical.center,
                                  style: TextStyle(
                                      // color: Colors.green,
                                      fontWeight: FontWeight.bold),
                                  controller: _player1,
                                  decoration: InputDecoration(
                                      // labelText: '              Name',
                                      hintText: "Player 1",
                                      // labelStyle: TextStyle(color: Colors.white60),
                                      hintStyle:
                                          TextStyle(color: Colors.white60),
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
                            SizedBox(
                              height: 50,
                            ),
                            // Red Balls Count
                            Container(
                                width: MediaQuery.of(context).size.width * 0.25,
                                height: 50,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image:
                                        AssetImage('images/container_bg.jpg'),
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
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
                      ),
                      // GB Logo
                      Image.asset(
                        'images/divij.sahu.logo.trans2.png',
                        height: 200,
                        fit: BoxFit.fitHeight,
                      ),
                      // Player 2 Name
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.25,
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
                                  textAlign: TextAlign.center,
                                  textAlignVertical: TextAlignVertical.center,
                                  // style: TextStyle(color),
                                  controller: _player2,
                                  decoration: InputDecoration(
                                      // labelText: '      Name',
                                      hintText: "Player 2",
                                      // labelStyle: TextStyle(color: Colors.white60),
                                      hintStyle:
                                          TextStyle(color: Colors.white60),
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

                            SizedBox(
                              height: 50,
                            ),
                            // Frame Count
                            Container(
                                width: MediaQuery.of(context).size.width * 0.25,
                                height: 50,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image:
                                        AssetImage('images/container_bg.jpg'),
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            setState(() {
                                              if (frame_count > 2)
                                                frame_count -= 2;
                                            });
                                          },
                                          icon: Icon(
                                            Icons.remove_circle_outline_rounded,
                                            color: Colors.black,
                                          )),
                                      Text(
                                        '      $frame_count\nFrames',
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
                          ],
                        ),
                      ),
                    ],
                  ),

                  // Start Button
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
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
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.1,
                            height: 40,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('images/container_bg.jpg'),
                                fit: BoxFit.fill,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                                child: Text(
                              'Start',
                              style: TextStyle(fontSize: 20),
                            )),
                          ),
                        )
                      ],
                    ),
                  ),
 
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('    Made with ❤️ in India!',
                          style: GoogleFonts.ptSerif(
                              textStyle: TextStyle(
                                  fontSize: 12, color: Colors.blueGrey))),
                      Text('Developed by ~>> Divij Sahu!    ',
                          style: GoogleFonts.ptSerif(
                              textStyle: TextStyle(
                                  fontSize: 12, color: Colors.blueGrey)))
                    ],
                  )

    
                ],
              ),
            )));
  }
}
