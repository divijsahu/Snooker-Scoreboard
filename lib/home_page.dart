// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';

import 'scoreboard_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _player1 = TextEditingController()..text = 'Green Bull';
  final _player2 = TextEditingController()..text = 'Little Talk';
  final _formKey = GlobalKey<FormState>();

  int frame_count = 1;
  int frame_redball = 6;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Green Bull Cafe!'),
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView(
              children: [
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  // initialValue: 'Green Bull!',
                  controller: _player1,
                  decoration: InputDecoration(
                      labelText: 'Name',
                      hintText: "Player's Name",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: _player1.clear,
                      )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter Player's Name";
                    }
                    return null;
                  },
                ),
                Center(child: Text('V/S')),
                TextFormField(
                  // initialValue: 'Little Talk!',
                  controller: _player2,
                  decoration: InputDecoration(
                      labelText: 'Name',
                      hintText: "Player's Name",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: _player2.clear,
                      )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Player\'s Name';
                    }
                    return null;
                  },
                ),
                Card(
                  color: Colors.lightGreenAccent.shade100,
                  child: ListTile(
                    leading: IconButton(
                        color: Colors.blue,
                        onPressed: () {
                          setState(() {
                            if (frame_count > 2) frame_count -= 2;
                          });
                        },
                        icon: Icon(Icons.remove_circle_outline_rounded)),
                    title: Center(child: Text('$frame_count')),
                    subtitle: Center(child: Text('No. Of Frames')),
                    trailing: IconButton(
                        color: Colors.blue,
                        onPressed: () {
                          setState(() {
                            frame_count += 2;
                          });
                        },
                        icon: Icon(Icons.add_circle_outline_rounded)),
                  ),
                ),
                Card(
                  color: Colors.red.shade100,
                  child: ListTile(
                    // selected: true,
                    leading: IconButton(
                        color: Colors.blue,
                        onPressed: () {
                          setState(() {
                            if (frame_redball == 15) {
                              frame_redball = 10;
                            } else if (frame_redball == 10) {
                              frame_redball = 6;
                            }
                          });
                        },
                        icon: Icon(Icons.remove_circle_outline_rounded)),
                    title: Center(child: Text('$frame_redball')),
                    subtitle: Center(child: Text('Red Balls Count')),
                    trailing: IconButton(
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
                        icon: Icon(Icons.add_circle_outline_rounded)),
                  ),
                ),
                ElevatedButton.icon(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ScoreBoardPage(
                                    p1name: _player1.text,
                                    p2name: _player2.text,
                                    totalframes: frame_count,
                                    totalreds: frame_redball,
                                    totalredsdummy: frame_redball,
                                  )),
                        );
                      }
                    },
                    icon: Icon(Icons.start_rounded),
                    label: Text('Start Match!')),
                Container(
                  height: MediaQuery.of(context).size.width * 0.9,
                  child: Image.asset(
                    'images/GBlogo.jpeg',
                    fit: BoxFit.cover,
                  ),
                  // decoration: BoxDecoration(
                  //   image: DecorationImage(
                  //     image: AssetImage("images/GBlogo.jpeg"),
                  //     fit: BoxFit.fitWidth,
                  //     alignment: Alignment.topCenter,
                  //   ),
                  // ),
                )
              ],
            ),
          ),
        ));
  }
}
