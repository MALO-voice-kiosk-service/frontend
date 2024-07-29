import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyAchTrailPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyAchTrailPageState();
}

class MyAchTrailPageState extends State<MyAchTrailPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 50,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.close),
              color: const Color(0xff481C75),
              onPressed: () {
                Get.back();
              },
              style: ButtonStyle(
                overlayColor: WidgetStateColor.resolveWith((states) => Colors.transparent),
              ),
            ),
            const Text(
              '달성한 산책로',
              style: TextStyle(
                color: Color(0xff481C75),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Text('hello'),
      ),
    );
  }
}