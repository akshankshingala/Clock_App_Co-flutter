import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class simple_watch extends StatefulWidget {
  const simple_watch({Key? key}) : super(key: key);

  @override
  State<simple_watch> createState() => _simple_watchState();
}

class _simple_watchState extends State<simple_watch> {
  int s = 0;
  int m = 0;
  int h = 0;

  myTime() {
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        s = DateTime.now().second;
        m = DateTime.now().minute;
        h = DateTime.now().hour;
      });
      myTime();
    });
  }

  @override
  void initState() {
    super.initState();
    myTime();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Analog clock"),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(CupertinoIcons.back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 400,
                width: w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xff3f6080),
                      Colors.blueGrey,
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(.6),
                      blurRadius: 32,
                      offset: Offset(25, 15),
                    ),
                    BoxShadow(
                      color: Color(0xffffffff).withOpacity(.8),
                      blurRadius: 32,
                      offset: Offset(-15, -10),
                    )
                  ],
                ),
              ),
              ...List.generate(
                60,
                (index) => Transform.rotate(
                  angle: (index / 60) * (3 * pi / 2 * 2),
                  child: Divider(
                    thickness: (index % 5 == 0) ? 5 : 2,
                    endIndent: (index % 5 == 0) ? w * 0.86 : w * 0.89,
                    color: (index % 5 == 0) ? Colors.red : Colors.black,
                  ),
                ),
              ),
              //second
              Transform.rotate(
                angle: pi / 2,
                child: Transform.rotate(
                  angle: (s * (pi * 2)) / 60,
                  child: Divider(
                    thickness: 4,
                    color: Colors.red,
                    indent: w * 0.5,
                    endIndent: 35,
                  ),
                ),
              ),
              //minutes
              Transform.rotate(
                angle: pi / 2,
                child: Transform.rotate(
                  angle: (m * (pi * 2)) / 60,
                  child: Divider(
                    thickness: 4,
                    color: Colors.blue,
                    indent: w * 0.5,
                    endIndent: 50,
                  ),
                ),
              ),
              //hour
              Transform.rotate(
                angle: pi / 2,
                child: Transform.rotate(
                  angle: (h % 12 + (m / 60)) * (pi * 2) / 12,
                  child: Divider(
                    thickness: 4,
                    color: Colors.black,
                    indent: w * 0.5,
                    endIndent: 80,
                  ),
                ),
              ),

              CircleAvatar(
                radius: 13,
                backgroundColor: Colors.black,
              )
            ],
          ),
        ),
      ),
    );
  }
}
