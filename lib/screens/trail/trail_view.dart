import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sparcs_2024_frontend/screens/trail/trail_detail.dart';

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
              padding: const EdgeInsets.only(top: 200, bottom: 150),

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
                          null;
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
            SizedBox(height: 20),
            Container(
              alignment: Alignment.bottomRight,
              margin: EdgeInsets.symmetric(
                horizontal: (MediaQuery.of(context).size.width) * (1 / 5),
              ),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => TrailDetailPage());
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15), // 버튼 높이 조정
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // 모서리를 둥글게 설정
                  ),
                ),
                child: const Text(
                  '세부페이지이동(임시)',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
