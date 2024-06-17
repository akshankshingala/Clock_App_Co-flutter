import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class strap_watch extends StatefulWidget {
  const strap_watch({Key? key}) : super(key: key);

  @override
  State<strap_watch> createState() => _strap_watchState();
}

class _strap_watchState extends State<strap_watch> {
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
        title: const Text("Strep Watch"),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(CupertinoIcons.back),
        ),
      ),
      body: Center(
        child: Stack(
          children: [
            Transform.scale(
              scale: 8,
              child: CircularProgressIndicator(
                value: s / 60,
                color: Colors.amber,
              ),
            ),
            Transform.scale(
              scale: 5,
              child: CircularProgressIndicator(
                value: m / 60,
                color: Colors.blue,
              ),
            ),
            Transform.scale(
              scale: 3,
              child: CircularProgressIndicator(
                value: h / 24,
                color: Colors.pink,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
