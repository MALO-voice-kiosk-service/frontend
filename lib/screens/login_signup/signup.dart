import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../main.dart';

class SignupPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SignupPageState();
}

class SignupPageState extends State<SignupPage> {



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
                height: 50,
              ),
              Container(
                margin: EdgeInsets.fromLTRB((MediaQuery.of(context).size.width)*(1/7), 0, (MediaQuery.of(context).size.width)*(1/7), 0),
                child: TextFormField(
                  key: const ValueKey(1),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.face,
                      color: Colors.grey,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    hintText: "이름 입력",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                      //fontWeight: FontWeight.bold,
                    ),
                    contentPadding: EdgeInsets.all(10),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                height: 40,
              ),
              Container(
                margin: EdgeInsets.fromLTRB((MediaQuery.of(context).size.width)*(1/7), 0, (MediaQuery.of(context).size.width)*(1/7), 0),
                child: TextFormField(
                  key: const ValueKey(1),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.grey,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    hintText: "아이디 입력",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                      //fontWeight: FontWeight.bold,
                    ),
                    contentPadding: EdgeInsets.all(10),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                height: 40,
              ),
              Container(
                margin: EdgeInsets.fromLTRB((MediaQuery.of(context).size.width)*(1/7), 0, (MediaQuery.of(context).size.width)*(1/7), 0),
                child: TextFormField(
                  key: const ValueKey(1),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.grey,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    hintText: "비밀번호 입력",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                      //fontWeight: FontWeight.bold,
                    ),
                    contentPadding: EdgeInsets.all(10),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                height: 40,
              ),
              Container(
                margin: EdgeInsets.fromLTRB((MediaQuery.of(context).size.width)*(1/7), 0, (MediaQuery.of(context).size.width)*(1/7), 0),
                child: TextFormField(
                  key: const ValueKey(1),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.abc,
                      color: Colors.grey,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    hintText: "닉네임 입력",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                      //fontWeight: FontWeight.bold,
                    ),
                    contentPadding: EdgeInsets.all(10),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                height: 40,
              ),
              Container(
                  margin: EdgeInsets.fromLTRB((MediaQuery.of(context).size.width)*(1/7), 0, (MediaQuery.of(context).size.width)*(1/7), 0),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(() => MainPage());
                    },
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white, backgroundColor: Color.fromRGBO(139, 117, 181, 1.0),
                        padding: EdgeInsets.symmetric(vertical: 15), // 버튼 높이 조정
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // 모서리를 둥글게 설정
                        )
                    ),
                    child: const Text('회원가입 하기',
                      style: TextStyle(
                        fontSize: 20,
                        //fontWeight: FontWeight.bold,
                      ),),
                  )
              ),
          ]
        )


        ),
    );
  }
}