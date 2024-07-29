import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sparcs_2024_frontend/screens/login_signup/signup.dart';
import 'package:sparcs_2024_frontend/screens/trail/trail_main.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                height: 100,
              ),
              Container(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  'lib/assets/logo.png',
                  width: (MediaQuery.of(context).size.width)*(2/3),
                  height: (MediaQuery.of(context).size.width)*(1/5),
                  fit: BoxFit.contain,
                ),
              ),
              Container(
                height: 50,
              ),
              Container(
                margin: EdgeInsets.fromLTRB((MediaQuery.of(context).size.width)*(1/5), 0, (MediaQuery.of(context).size.width)*(1/5), 0),
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
                      fontWeight: FontWeight.bold,
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
                margin: EdgeInsets.fromLTRB((MediaQuery.of(context).size.width)*(1/5), 0, (MediaQuery.of(context).size.width)*(1/5), 0),
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
                      fontWeight: FontWeight.bold,
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
                margin: EdgeInsets.fromLTRB((MediaQuery.of(context).size.width)*(1/5), 0, (MediaQuery.of(context).size.width)*(1/5), 0),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => TrailMainPage());
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Color.fromRGBO(139, 117, 181, 1.0),
                    padding: EdgeInsets.symmetric(vertical: 15), // 버튼 높이 조정
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // 모서리를 둥글게 설정
                    )
                  ),
                  child: const Text('로그인',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),),
                )
              ),
              Container(
                height: 40,
              ),
              Container(
                  margin: EdgeInsets.fromLTRB((MediaQuery.of(context).size.width)*(1/5), 0, (MediaQuery.of(context).size.width)*(1/5), 0),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(() => SignupPage());
                    },
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black, backgroundColor: Colors.white,
                        side: BorderSide(color: Color.fromRGBO(139, 117, 181, 1.0)),
                        padding: EdgeInsets.symmetric(vertical: 15), // 버튼 높이 조정
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // 모서리를 둥글게 설정
                        )
                    ),
                    child: const Text('회원가입',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),),
                  )
              ),

            ],
          ),

        ),
      )
    );
  }
}