import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:sparcs_2024_frontend/screens/trail/trail_main_2.dart';

class TrailMainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TrailMainPageState();
}

class TrailMainPageState extends State<TrailMainPage> {

  //String userNickname = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset : false,
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            children: [
              Container(
                height: 20,
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '느긋한 여유',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: '를 선물할',
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
                    Container(
                      alignment: Alignment.topLeft,
                      child: const Text(
                        '산책 루트를 안내합니다.',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 10,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: const Text(
                  '이유민님, 반가워요 !',
                  style: TextStyle(
                    fontSize: 17
                  ),

                ),
              ),
              Container(
                height: 40,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: const Text(
                  '산책할 지역을 선택해주세요',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Container(
                child: Row(
                  children: [
                    IconButton(
                        icon: const Icon(Icons.map_outlined),
                        color: const Color(0xff481C75),
                        onPressed: () {
                          null;
                        }
                    ),
                    Text(
                      '지도에서 선택',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    )
                  ],




                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width - 40,
                height: MediaQuery.of(context).size.height - 350,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: Colors.black38,
                    )
                ),
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(





                    ),
                  ),
                ),
              ),
              Container(
                height: 2,
              ),
              Container(
                  alignment: Alignment.bottomRight,
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      Get.to(() => TrailMainPage2());
                    },
                    style: ElevatedButton.styleFrom(
                        foregroundColor: const Color(0xff481C75),
                        padding: EdgeInsets.symmetric(vertical: 15), // 버튼 높이 조정
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // 모서리를 둥글게 설정
                        )
                    ),
                    child: const Text('다음 단계로',
                      style: TextStyle(
                        fontSize: 20,
                      ),),
                  )
              ),
              Container(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 40,
                height: MediaQuery.of(context).size.height * (1/7),
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: Colors.black38,
                    )
                ),
                child: Center(
                  child: Text(
                    '광고',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Container(
                height: 10,
              )
            ],
          ),
        )
    );
  }
}