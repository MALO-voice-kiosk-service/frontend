import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:sparcs_2024_frontend/screens/trail/trail_detail.dart';
import 'package:sparcs_2024_frontend/screens/trail/trail_view.dart';

class TrailMainPage2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TrailMainPage2State();
}

class TrailMainPage2State extends State<TrailMainPage2> {

  static const keywords = ['반려견과', '동반자와', '혼자'];

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
                  'yumin 님 반가워요 !',
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
                  '산책 루트 추천을 위한 키워드를 선택해주세요',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Container(
                height: 10,
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround, // 간격을 동일하게 배치
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                child: Column(
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: Image.asset(
                                        'lib/assets/dog.png',
                                        width: 150, // 이미지의 너비 설정
                                        height: 100, // 이미지의 높이 설정
                                        fit: BoxFit.contain, // 이미지가 Container를 채우도록
                                      ),
                                      iconSize: 50, // 아이콘 크기 조절
                                    ),
                                    Text(
                                      keywords[0],
                                      style: TextStyle(fontSize: 18), // 텍스트 크기 조절
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                child: Column(
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: Image.asset(
                                        'lib/assets/together.png',
                                        width: 150, // 이미지의 너비 설정
                                        height: 100, // 이미지의 높이 설정
                                        fit: BoxFit.contain, // 이미지가 Container를 채우도록
                                      ),
                                      iconSize: 50, // 아이콘 크기 조절
                                    ),
                                    Text(
                                      keywords[1],
                                      style: TextStyle(fontSize: 18), // 텍스트 크기 조절
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                child: Column(
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: Image.asset(
                                        'lib/assets/wheelchair.png',
                                        width: 150, // 이미지의 너비 설정
                                        height: 100, // 이미지의 높이 설정
                                        fit: BoxFit.contain, // 이미지가 Container를 채우도록
                                      ),
                                      iconSize: 50, // 아이콘 크기 조절
                                    ),
                                    Text(
                                      keywords[2],
                                      style: TextStyle(fontSize: 18), // 텍스트 크기 조절
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 10,
              ),
              Container(
                  alignment: Alignment.bottomRight,
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      Get.to(() => TrailViewPage());
                    },
                    style: ElevatedButton.styleFrom(
                        foregroundColor: const Color(0xff481C75),
                        padding: EdgeInsets.symmetric(vertical: 15), // 버튼 높이 조정
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // 모서리를 둥글게 설정
                        )
                    ),
                    child: const Text('산책 루트 추천받기',
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