import 'package:flutter/material.dart';

class stop_watch extends StatefulWidget {
  const stop_watch({super.key});

  @override
  State<stop_watch> createState() => _stop_watchState();
}

class _stop_watchState extends State<stop_watch> {
  int hh = 0;

  int mm = 0;

  int ss = 0;

  bool isStop = true;

  void clockTimer() async {
    isStop = true;
    await Future.delayed(Duration(milliseconds: 100), () {
      ss++;
      if (isStop) {
        ss++;
      }
      if (ss > 59) {
        ss = 0;
        mm++;
      }
      if (mm > 59) {
        mm = 0;
        hh++;
      }
      if (hh >= 12) {
        hh = 0;
      }
      setState(() {});
    });
    if (isStop) {
      clockTimer();
    }
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;
    double w = MediaQuery.sizeOf(context).width;
    TextScaler textScaler = MediaQuery.textScalerOf(context);
    return Scaffold(
      backgroundColor: const Color(0xffEFF9FF),
      appBar: AppBar(
        backgroundColor: const Color(0xffEFF9FF),
        title: const Text("Stop Watch"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${(hh).toString().padLeft(2, "0")} : ${(mm).toString().padLeft(2, "0")} : ${(ss).toString().padLeft(2, "0")}",
              style: const TextStyle(
                fontSize: 30,
                color: Color(0xff3f6080),
              ),
            ),
            SizedBox(
              height: h * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffEFF9FF),
                    shadowColor: Color(0xff3f6080),
                  ),
                  onPressed: () {
                    if (!isStop) {
                      clockTimer();
                    }
                    setState(() {});
                  },
                  icon: Icon(Icons.play_arrow),
                  label: Text("Start"),
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffEFF9FF),
                    shadowColor: Color(0xff3f6080),
                  ),
                  onPressed: () {
                    isStop = false;
                    setState(() {});
                  },
                  icon: Icon(Icons.play_arrow),
                  label: Text("Stop"),
                ),
              ],
            ),
            SizedBox(
              height: h * 0.02,
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffEFF9FF),
                shadowColor: Color(0xff3f6080),
              ),
              onPressed: () {
                isStop = false;
                hh = mm = 0;
                ss = 0;
                setState(() {});
              },
              icon: Icon(Icons.restart_alt),
              label: Text("Restart"),
            ),
          ],
        ),
      ),
    );
  }
}
