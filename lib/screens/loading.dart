import 'package:flutter/material.dart';

class LoadingPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _LoadingPageState();

}

class _LoadingPageState extends State<LoadingPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: const Color(0xff8B75B5),
        child: Image.asset(
            'lib/assets/loading - 1.png',
            fit: BoxFit.fill,
        ),
      ),
    );
  }

}