import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sparcs_2024_frontend/screens/trail/trail_detail.dart';
import 'package:sparcs_2024_frontend/screens/trail/trail_showpin.dart';

class TrailViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TrailViewPageState();
}

class TrailViewPageState extends State<TrailViewPage> {
  static const data = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10']; // 받아온 data

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
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '느루',
                    style: TextStyle(
                      color: const Color(0xff481C75),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: '가 추천하는 산책로입니다',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(top: 200, bottom: 200),

              child: Row(
                children: List.generate(data.length, (index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 10),
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: Colors.black38,
                      ),
                    ),
                    child: Center(
                      child: TextButton(
                        onPressed: () {
                          Get.to(() => TrailDetailPage());
                          // 완전 센터 눌러야 해요
                          //(TODO) 추천 지도 get해와서 띄우기
                        },
                        child: Text(
                          data[index],
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
