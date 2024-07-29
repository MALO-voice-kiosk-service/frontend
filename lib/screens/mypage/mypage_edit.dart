import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileEditPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ProfileEditPageState();
}

class ProfileEditPageState extends State<ProfileEditPage> {

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
              '내 정보 수정',
              style: TextStyle(
                color: Color(0xff481C75),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: null,
              style: ButtonStyle(
                overlayColor: WidgetStateColor.resolveWith((states) => Colors.transparent),
              ),
              child: const Text(
                '완료',
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xff481C75),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Text('bonjour'),
      ),
    );
  }
}