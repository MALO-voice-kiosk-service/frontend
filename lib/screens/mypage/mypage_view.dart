import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:sparcs_2024_frontend/screens/mypage/mypage_ach.dart';
import 'package:sparcs_2024_frontend/screens/mypage/mypage_edit.dart';
import 'package:sparcs_2024_frontend/screens/mypage/mypage_like.dart';

class ProfileMainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ProfileMainPageState();
}

class ProfileMainPageState extends State<ProfileMainPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Image.asset(
                        'lib/assets/profileImg.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Text(
                    '이유민',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 30,),
              const Text(
                '나의 활동',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10,),
              ElevatedButton(
                  onPressed: ((){
                    Get.to(() => MyLikedTrailPage());
                  }),
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.white),
                ),
                  child: const Row(
                    children: [
                      Icon(
                        FeatherIcons.thumbsUp,
                        color: Color(0xff481C75),
                      ),
                      SizedBox(width: 10,),
                      Text(
                        '좋아요한 산책로',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
              ),
              SizedBox(height: 10,),
              ElevatedButton(
                onPressed: ((){
                  Get.to(() => MyAchTrailPage());
                }),
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.white),
                ),
                child: const Row(
                  children: [
                    Icon(
                      FeatherIcons.award,
                      color: Color(0xff481C75),
                    ),
                    SizedBox(width: 10,),
                    Text(
                      '내가 달성한 산책로',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              const Divider(thickness: 1, color: Colors.black38),
              const SizedBox(height: 20,),
              TextButton(
                  onPressed: ((){
                    Get.to(() => ProfileEditPage());
                  }),
                  child: Text(
                    '내 정보 수정',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                style: ButtonStyle(
                  overlayColor: WidgetStateColor.resolveWith((states) => Colors.transparent),
                ),
              ),
            ],
          ),
        )
    );
  }
}