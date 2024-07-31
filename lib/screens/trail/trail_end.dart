import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sparcs_2024_frontend/screens/trail/trail_main.dart';
import 'package:sparcs_2024_frontend/screens/trail/trail_review.dart';

import '../main.dart';

class TrailEndPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => TrailEndPageState();
}

class TrailEndPageState extends State<TrailEndPage> {
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
            ],
          ),
        ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child:
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 40,
                    height: MediaQuery.of(context).size.height - 300,
                    child: SingleChildScrollView(
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 100,
                            ),
                            Text(
                              '축하드립니다 !',
                              style: TextStyle(
                                fontSize: 24,
                              ),
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: '혼자 즐기는 공원 산책',
                                          //(TODO) 산책로 이름 get해와야해요
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        TextSpan(
                                          text: '을',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 24,
                                          ),
                                        ),
                                      ],
                                        style: TextStyle(
                                          fontFamily: 'NanumSquareNeo',
                                        )
                                    ),

                                  ),

                                ],

                              ),
                            ),
                            Text(
                              '달성하셨습니다.',
                              style: TextStyle(
                                fontSize: 24,
                              ),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Container(
                                margin: EdgeInsets.fromLTRB(
                                    (MediaQuery.of(context).size.width) * (1 / 5),
                                    0,
                                    (MediaQuery.of(context).size.width) * (1 / 5),
                                    0),
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Get.to(() => TrailReviewPage());

                                  },
                                  style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      backgroundColor: const Color(0xff481C75),
                                      padding: EdgeInsets.symmetric(vertical: 15), // 버튼 높이 조정
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10), // 모서리를 둥글게 설정
                                      )),
                                  child: const Text(
                                    '리뷰 쓰러가기',
                                    style: TextStyle(
                                      fontSize: 20,
                                      //fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                            ),
                            SizedBox(height: 20),
                            Container(
                                margin: EdgeInsets.fromLTRB(
                                    (MediaQuery.of(context).size.width) * (1 / 5),
                                    0,
                                    (MediaQuery.of(context).size.width) * (1 / 5),
                                    0),
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Get.to(() => MainPage());
                                  },
                                  style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      backgroundColor: Colors.grey,
                                      padding: EdgeInsets.symmetric(vertical: 15), // 버튼 높이 조정
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10), // 모서리를 둥글게 설정
                                      )),
                                  child: const Text(
                                    '메인 화면으로',
                                    style: TextStyle(
                                      fontSize: 20,
                                      //fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                            ),


                          ],
                        ),
                      ),
                    ),
                  )


                ],
              )
          )
      );
  }

}