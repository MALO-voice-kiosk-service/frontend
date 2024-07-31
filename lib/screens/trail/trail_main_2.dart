import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sparcs_2024_frontend/screens/trail/trail_detail.dart';
import 'package:sparcs_2024_frontend/screens/trail/trail_view.dart';

import '../../service/api.dart';

class TrailMainPage2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TrailMainPage2State();
}

class TrailMainPage2State extends State<TrailMainPage2> {
  static const keywords = ['반려견과', '보호자와', '혼자'];
  Map<int, bool> selectedKeywords = {}; // 키워드 선택 상태
  int? selectedKeywordIndex; // 선택된 키워드 인덱스

  void _toggleSelection(int index) {
    setState(() {
      selectedKeywords[index] = !(selectedKeywords[index] ?? false);
    });
  }

  Future<void> _keywordPost(cityID, int keyword ) async {
    // API URL을 정의합니다.
    const String url = '/api/walkway/fetchWalkwayData';

    // 요청에 포함할 데이터를 정의합니다.
    Map<String, dynamic> data = {
      "cityID": cityID,
      "keyword": selectedKeywordIndex
    };

    // httpPOST 함수를 호출하여 데이터를 전송합니다.
    print('data :');
    print(data);
    final response = await httpPost(path: url, data: data);

    if (response == 200) {
      // 로그인 성공 시 처리
      Get.to(() => TrailViewPage());
      //print('로그인 성공은 함');
    } else {
      // 로그인 실패 시 처리
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // 2초 후에 다이얼로그 닫기
          Future.delayed(Duration(seconds: 1), () {
            Navigator.of(context).pop(true);
          });
          return AlertDialog(
            title: Text('키워드 선택 실패'),
            content: Text('위치와 키워드를 하나 이상 선택해주세요.'),
          );
        },
      );
      //print('*** Login failed ***');
    }
  }

  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments as Map<String, dynamic>;
    final selectedCityIds = arguments['selectedCityIds'] as List<int>;

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          children: [
            SizedBox(height: 20),
            Column(
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
            SizedBox(height: 10),
            Container(
              alignment: Alignment.topLeft,
              child: const Text(
                'yumin 님 반가워요 !',
                style: TextStyle(fontSize: 17),
              ),
            ),
            SizedBox(height: 40),
            Container(
              alignment: Alignment.topLeft,
              child: const Text(
                '산책 루트 추천을 위한 키워드를 선택해주세요',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: MediaQuery.of(context).size.width - 40,
              height: MediaQuery.of(context).size.height - 350,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: Colors.black38,
                ),
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
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: selectedKeywords[0] == true ? const Color(0xff481C75) : Colors.transparent,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Column(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      _toggleSelection(0);
                                    },
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
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black, // 텍스트 색상
                                    ),
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
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: selectedKeywords[1] == true ? const Color(0xff481C75) : Colors.transparent,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Column(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      _toggleSelection(1);
                                    },
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
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black, // 텍스트 색상
                                    ),
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
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: selectedKeywords[2] == true ? const Color(0xff481C75) : Colors.transparent,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Column(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      _toggleSelection(2);
                                    },
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
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black, // 텍스트 색상
                                    ),
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
            SizedBox(height: 10),
            Container(
              alignment: Alignment.bottomRight,
              margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  // 선택된 키워드의 인덱스 설정
                  selectedKeywordIndex = selectedKeywords.entries
                      .firstWhere((element) => element.value == true, orElse: () => MapEntry(-1, false))
                      .key;
                  print(selectedCityIds);
                  print('선택된 키워드 인덱스: $selectedKeywordIndex'); // 선택된 키워드 인덱스 확인용 출력
                  _keywordPost(selectedCityIds[0], selectedKeywordIndex!);
                  //Get.to(() => TrailViewPage());
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: const Color(0xff481C75),
                  padding: EdgeInsets.symmetric(vertical: 15), // 버튼 높이 조정
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // 모서리를 둥글게 설정
                  ),
                ),
                child: const Text(
                  '산책 루트 추천받기',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: MediaQuery.of(context).size.width - 40,
              height: MediaQuery.of(context).size.height * (1 / 7),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: Colors.black38,
                ),
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
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
