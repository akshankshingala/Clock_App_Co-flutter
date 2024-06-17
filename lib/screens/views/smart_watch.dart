import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class smart_watch extends StatefulWidget {
  const smart_watch({Key? key}) : super(key: key);

  @override
  State<smart_watch> createState() => _smart_watchState();
}

class _smart_watchState extends State<smart_watch> {
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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Digital Watch"),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(CupertinoIcons.back),
        ),
      ),
      body: Center(
        child: (h >= 12)
            ? Text(
                "${(h.toString().padLeft(2, '0'))} : ${(m.toString().padLeft(2, "0"))} : ${(s.toString().padLeft(2, "0"))} \n        PM",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.w500),
              )
            : Text(
                "${(h.toString().padLeft(2, '0'))} : ${(m.toString().padLeft(2, "0"))} : ${(s.toString().padLeft(2, "0"))} \n        AM",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.w500),
              ),
      ),
    );
  }
}
