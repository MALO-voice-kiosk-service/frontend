import 'package:flutter/cupertino.dart';
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
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                  'lib/assets/images/back_img.png',
                fit: BoxFit.fill,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height*(5/7),
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*(1/7), left: 20, right: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(30)),
                border: Border.all(
                  color: Colors.black,
                  width: 3,
                ),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(top: 80, left: 20, right: 20, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 80,),
                  Container(
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Image.asset(
                      'lib/assets/images/profileImg.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Text(
                    '이유민',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
    );
  }
}