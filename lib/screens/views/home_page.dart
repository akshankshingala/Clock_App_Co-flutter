import 'package:flutter/material.dart';

class home_page extends StatefulWidget {
  const home_page({Key? key}) : super(key: key);

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Clock's"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('simple_watch');
              },
              child: const Text("Analog Watch"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('strap_watch');
              },
              child: const Text("Strap Watch"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('smart_watch');
              },
              child: const Text("Digital Watch"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('stop_watch');
              },
              child: const Text("Stop Watch"),
            )
          ],
        ),
      ),
    );
  }
}
