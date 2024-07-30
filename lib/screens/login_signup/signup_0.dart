import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sparcs_2024_frontend/screens/login_signup/signup.dart';

import '../main.dart';

class Signup0Page extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Signup0PageState();
}

class Signup0PageState extends State<Signup0Page> {
  // 사용자 or 클래스선생님
  static int userMode = 0;

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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '안녕하세요,',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '느루',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: '에 오신 걸 환영합니다.',
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
                    ]
                ),
              ),
              Container(
                height: 80,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 40,
                height: MediaQuery.of(context).size.height - 300,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                ),
                child: SingleChildScrollView(
                  child: Container(
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              '어떤 역할로 활동하시나요?',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black
                              ),
                            ),
                            Text(
                              '원하시는 역할을 선택해주세요',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 50,
                        ),
                        Container(
                          child: ElevatedButton(
                            onPressed: (){
                              //(TODO)
                              userMode = 0;
                              Get.toNamed('/signup', arguments: userMode);
                            },
                            style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white, backgroundColor: Color.fromRGBO(139, 117, 181, 1.0),
                                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 55), // 버튼 높이 조정
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10), // 모서리를 둥글게 설정
                                )
                            ),
                            child: const Text('여가 활동을 찾고 싶어요.',
                              style: TextStyle(
                                fontSize: 20,
                                //fontWeight: FontWeight.bold,
                              ),),
                          ),
                        ),
                        Container(
                          height: 20,
                        ),
                        Container(
                          child: ElevatedButton(
                            onPressed: (){
                              //(TODO)
                              userMode = 1;
                              Get.toNamed('/signup', arguments: userMode);
                            },
                            style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white, backgroundColor: Color.fromRGBO(139, 117, 181, 1.0),
                                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50), // 버튼 높이 조정
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10), // 모서리를 둥글게 설정
                                )
                            ),
                            child: const Text('클래스를 모집하고 싶어요.',
                              style: TextStyle(
                                fontSize: 20,
                              ),),
                          ),
                        )




                      ],
                    ),
                  ),

                ),
              )


            ],

          ),
    )
    );
  }

}