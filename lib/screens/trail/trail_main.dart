import 'package:flutter/material.dart';

class TrailMainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TrailMainPageState();
}

class TrailMainPageState extends State<TrailMainPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text('trail_main.dart'),
      ),
    );
  }
}