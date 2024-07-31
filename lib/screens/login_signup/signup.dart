import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sparcs_2024_frontend/service/api.dart';

import '../main.dart';

class SignupPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SignupPageState();
}

class SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();

  //밑에서 입력받을 유저 정보
  final TextEditingController userNameController = TextEditingController();
  String userName = "";
  final TextEditingController userIdController = TextEditingController();
  String userId = "";
  final TextEditingController userPwController = TextEditingController();
  String userPw = "";
  final TextEditingController userNicknameController = TextEditingController();
  String userNickname = "";

  @override
  void initState() {
    super.initState();

    // TextEditingController에 리스너를 추가하여 입력 값 변경 시 userName 변수 업데이트.
    userNameController.addListener(() {
      setState(() {
        userName = userNameController.text;
      });
    });
    // TextEditingController에 리스너를 추가하여 입력 값 변경 시 userId 변수 업데이트.
    userIdController.addListener(() {
      setState(() {
        userId = userIdController.text;
      });
    });
    // TextEditingController에 리스너를 추가하여 입력 값 변경 시 userPw 변수 업데이트.
    userPwController.addListener(() {
      setState(() {
        userPw = userPwController.text;
      });
    });
    // TextEditingController에 리스너를 추가하여 입력 값 변경 시 userNickname 변수 업데이트.
    userNicknameController.addListener(() {
      setState(() {
        userNickname = userNicknameController.text;
      });
    });
  }

  @override
  void dispose() {
    // 사용이 끝나면 TextEditingController를 dispose.
    userNameController.dispose();
    userIdController.dispose();
    userPwController.dispose();
    userNicknameController.dispose();
    super.dispose();
  }

  // 회원가입하기 버튼 클릭 시 호출될 함수
  Future<void> _signup() async {
    const String url = '/api/user/signup';

    Map<String, dynamic> data = {
      "userid": userId,
      "name": userName,
      "nickname": userNickname,
      "password": userPw,
    };

    if (_formKey.currentState?.validate() ?? false) {
      final response = await httpPost(path: url, data: data);

      if (response == 200) {
        // 회원가입 성공
        Get.to(() => MainPage(), arguments: userNickname);
      } else {
        // 회원가입 실패
        showDialog(
          context: context,
          builder: (BuildContext context) {
            // 2초 후에 다이얼로그 닫기
            Future.delayed(Duration(seconds: 1), () {
              Navigator.of(context).pop(true);
            });
            return AlertDialog(
              title: Text('회원가입 실패'),
              content: Text('중복 아이디가 존재합니다.'),
            );
          },
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // 2초 후에 다이얼로그 닫기
          Future.delayed(Duration(seconds: 1), () {
            Navigator.of(context).pop(true);
          });
          return AlertDialog(
            title: Text('회원가입 실패'),
            content: Text('각 항목의 조건을 확인하세요.'),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 50,
          automaticallyImplyLeading: false,
          title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 80,
                ),
                IconButton(
                    icon: const Icon(Icons.close),
                    color: const Color(0xff481C75),
                    onPressed: () {
                      Get.back();
                    }
                ),

              ]
          )
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Form(
          key: _formKey,
          child: Column(children: [
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
                ],
              ),
            ),
            Container(
              height: 50,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(
                  (MediaQuery.of(context).size.width) * (1 / 7),
                  0,
                  (MediaQuery.of(context).size.width) * (1 / 7),
                  0),
              child: TextFormField(
                key: const ValueKey(1),
                controller: userNameController,
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
                  ),
                  contentPadding: EdgeInsets.all(10),
                ),
                textAlign: TextAlign.center,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '이름을 작성해주세요.';
                  } else if (value.length > 10) {
                    return '이름은 10자 이내로 작성해주세요.';
                  }
                  return null;
                },
              ),
            ),
            Container(
              height: 40,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(
                  (MediaQuery.of(context).size.width) * (1 / 7),
                  0,
                  (MediaQuery.of(context).size.width) * (1 / 7),
                  0),
              child: TextFormField(
                key: const ValueKey(2),
                controller: userIdController,
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
                  ),
                  contentPadding: EdgeInsets.all(10),
                ),
                textAlign: TextAlign.center,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '아이디를 작성해주세요.';
                  } else if (value.length > 15) {
                    return '아이디는 15자 이내로 작성해주세요.';
                  }
                  return null;
                },
              ),
            ),
            Container(
              height: 40,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(
                  (MediaQuery.of(context).size.width) * (1 / 7),
                  0,
                  (MediaQuery.of(context).size.width) * (1 / 7),
                  0),
              child: TextFormField(
                key: const ValueKey(3),
                controller: userPwController,
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
                  ),
                  contentPadding: EdgeInsets.all(10),
                ),
                textAlign: TextAlign.center,
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '비밀번호를 작성해주세요';
                  } else if (value.length > 15) {
                    return '비밀번호는 15자 이내로 작성해주세요.';
                  }
                  return null;
                },
              ),
            ),
            Container(
              height: 40,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(
                  (MediaQuery.of(context).size.width) * (1 / 7),
                  0,
                  (MediaQuery.of(context).size.width) * (1 / 7),
                  0),
              child: TextFormField(
                key: const ValueKey(4),
                controller: userNicknameController,
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
                  ),
                  contentPadding: EdgeInsets.all(10),
                ),
                textAlign: TextAlign.center,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '닉네임을 작성해주세요.';
                  } else if (value.length > 10) {
                    return '닉네임은 10자 이내로 작성해주세요.';
                  }
                  return null;
                },
              ),
            ),
            Container(
              height: 40,
            ),
            Container(
                margin: EdgeInsets.fromLTRB(
                    (MediaQuery.of(context).size.width) * (1 / 7),
                    0,
                    (MediaQuery.of(context).size.width) * (1 / 7),
                    0),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    _signup();
                  },
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Color.fromRGBO(139, 117, 181, 1.0),
                      padding: EdgeInsets.symmetric(vertical: 15), // 버튼 높이 조정
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // 모서리를 둥글게 설정
                      )),
                  child: const Text(
                    '회원가입 하기',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                )),
          ]),
        ),
      ),
    );
  }
}
