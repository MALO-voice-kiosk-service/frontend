import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sparcs_2024_frontend/screens/trail/trail_main.dart';
import 'package:sparcs_2024_frontend/screens/trail/trail_review.dart';

import '../main.dart';

class TrailReviewEndPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => TrailReviewEndPageState();
}

class TrailReviewEndPageState extends State<TrailReviewEndPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child:
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width - 40,
                  height: MediaQuery.of(context).size.height - 40,
                  child: SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 300,
                          ),
                          Text(
                            '리뷰가 등록되었습니다 !',
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