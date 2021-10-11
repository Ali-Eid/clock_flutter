import 'dart:math';

import 'package:flutter/material.dart';

class Clock extends StatelessWidget {
  int seconds = 0;
  int minutes = 0;
  int hours = 0;
  String? ss = 'images/clock.jpg';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown.shade900,
        title: Center(
          child: Text(
            'Clock',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
      ),
      body: Container(
        child: Container(
          child: Stack(
            children: [
              // Image(image: AssetImage('images/clock2.png')),
              //Dot
              Container(
                child: Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                alignment: Alignment(0, 0),
              ),
              //Seconds
              StreamBuilder(
                  stream: sec(),
                  builder: (ctxt, asyncData) {
                    return Transform.rotate(
                      child: Container(
                        child: Container(
                          width: 2,
                          height: 180,
                          decoration: BoxDecoration(
                            color: Colors.pink,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        alignment: Alignment(0, -0.65),
                      ),
                      angle: (pi / 30) * seconds,
                    );
                  }),
              //Minutes
              StreamBuilder(
                  stream: min(),
                  builder: (ctxt, asyncData) {
                    return Transform.rotate(
                      child: Container(
                        child: Container(
                          // width: 5,
                          // height: 140,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('images/big.png')),
                            // color: Colors.black,
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        alignment: Alignment(0, -0.35),
                      ),
                      angle: (pi / 30) * minutes,
                    );
                  }),
              //Hours
              StreamBuilder(
                  stream: hour(),
                  builder: (ctxt, asyncData) {
                    return Transform.rotate(
                      child: Container(
                        child: Container(
                          //   width: 7,
                          //  height: 90,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('images/small.png'),
                            ),
                            //  color: Colors.black,
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        alignment: Alignment(0, -0.2),
                      ),
                      angle: (pi / 6) * hours + (pi / 360) * minutes,
                    );
                  }),
            ],
          ),
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('images/clock.jpg')),
            border: Border.all(
              color: Colors.brown.shade900,
              width: 8,
            ),
            borderRadius: BorderRadius.circular(200),
            //  borderRadius: BorderRadius.circular(550),
          ),
        ),
        color: Colors.white,
        alignment: Alignment(0, 0),
      ),
    );
  }

  Stream<int> sec() async* {
    while (true) {
      await Future.delayed(Duration(seconds: 1));
      DateTime date = DateTime.now();
      seconds = date.second;
      yield seconds;
    }
  }

  Stream<int> min() async* {
    while (true) {
      await Future.delayed(Duration(seconds: 1));
      DateTime date = DateTime.now();
      minutes = date.minute;
      // print(minutes);
      yield minutes;
    }
  }

  Stream<int> hour() async* {
    while (true) {
      await Future.delayed(Duration(seconds: 1));
      DateTime date = DateTime.now();
      hours = date.hour;
      print(hours);
      yield hours;
    }
  }
}

Stream<Map<String, int>> seqAsyncValues() async* {
  // while (true) {
  //   // await Future.delayed(Duration(seconds: 1));
  //   DateTime date = new DateTime.now();

  //   yield date.second;
  // }

  for (var i = 0;; i++) {
    DateTime date = new DateTime.now();
    // await Future.delayed(Duration(seconds: 1));
    Map<String, int> dateMap = {
      'hours': date.hour,
      'minutes': date.minute,
      'seconds': date.second
    };
    String format = '${date.hour} : ${date.minute} : ${date.second}';
    yield dateMap;
  }
}
