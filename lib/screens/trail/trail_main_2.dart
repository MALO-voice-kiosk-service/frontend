import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class TrailMainPage2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TrailMainPage2State();
}

class TrailMainPage2State extends State<TrailMainPage2> {

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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                    const Text(
                      '산책 루트를 안내합니다.',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 40,
              ),
              Container(
                child: const Text(
                  '이유민님, 반가워요 !',
                  style: TextStyle(
                      fontSize: 17
                  ),

                ),
              ),
              Container(
                height: 50,
              ),
              Container(
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
                    child: Column(





                    ),
                  ),
                ),
              ),
              Container(
                height: 10,
              ),
              Container(
                  margin: EdgeInsets.fromLTRB((MediaQuery.of(context).size.width)*(1/5), 0, (MediaQuery.of(context).size.width)*(1/5), 0),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      null;
                    },
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white, backgroundColor: const Color(0xff481C75),
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
                height: MediaQuery.of(context).size.height - 700,
                color: Colors.grey,
                child: Text(
                    '광고'
                ),
              )
            ],
          ),
        )
    );
  }
}