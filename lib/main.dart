import 'package:clock_app/screens/views/home_page.dart';
import 'package:clock_app/screens/views/simple_watch.dart';
import 'package:clock_app/screens/views/smart_watch.dart';
import 'package:clock_app/screens/views/stop_watch.dart';
import 'package:clock_app/screens/views/strap_watch.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Akshank());
}

class Akshank extends StatefulWidget {
  const Akshank({Key? key}) : super(key: key);

  @override
  State<Akshank> createState() => _AkshankState();
}

class _AkshankState extends State<Akshank> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const home_page(),
        'simple_watch': (context) => const simple_watch(),
        'strap_watch': (context) => const strap_watch(),
        'smart_watch': (context) => const smart_watch(),
        'stop_watch': (context) => const stop_watch(),
      },
    );
  }
}
