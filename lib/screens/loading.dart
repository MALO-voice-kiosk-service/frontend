import 'package:flutter/material.dart';

class LoadingPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _LoadingPageState();

}

class _LoadingPageState extends State<LoadingPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      body: SingleChildScrollView(
        child: Container(
          color: const Color(0xff8B75B5),
          child: Column(
            children: [
              Container(
                height: 50,
              ),
              Container(
                padding: const EdgeInsets.only(left: 55),
                alignment: Alignment.topLeft,
                child: const Text(
                    '늘 우리 곁에,',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Container(
                height: 5,
              ),
              Container(
                padding: const EdgeInsets.only(left: 50),
                alignment: Alignment.topLeft,
                child: Image.asset(
                  'lib/assets/loading_logo.png',
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Image.asset(
                  'lib/assets/loading_road.png',
                  fit: BoxFit.fill,
                ),
              ),
            ],
          )
        ),
      ),
    );
  }

}