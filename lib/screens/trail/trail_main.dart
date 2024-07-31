import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../service/api.dart';
import 'trail_main_2.dart';

class TrailMainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TrailMainPageState();
}

class TrailMainPageState extends State<TrailMainPage> {
  List<dynamic> apiCityResult = []; // 가공된 데이터
  Map<int, bool> selectedCities = {}; // 버튼 선택 상태

  @override
  void initState() {
    super.initState();
    _fetchCityData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  // 구 정보 전체
  Future<void> _fetchCityData() async {
    final result = await httpGet(path: '/api/location/city');
    setState(() {
      apiCityResult = result['data'];
    });
  }

  void _toggleSelection(int index) {
    setState(() {
      selectedCities[index] = !(selectedCities[index] ?? false);
    });
  }

  List<int> _getSelectedCityIds() {
    List<int> selectedCityIds = [];
    selectedCities.forEach((index, isSelected) {
      if (isSelected) {
        selectedCityIds.add(apiCityResult[index]['id']);
      }
    });
    return selectedCityIds;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
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
          SingleChildScrollView(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: '느긋한 여유',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'NanumSquareNeo',
                                ),
                              ),
                              TextSpan(
                                text: '를 선물할',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontFamily: 'NanumSquareNeo',
                                ),
                              ),
                            ],
                            style: TextStyle(
                              fontFamily: 'NanumSquareNeo',
                            )
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
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Container(
                  alignment: Alignment.topLeft,
                  child: const Text(
                    'yumin 님, 반가워요 !',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Container(
                  alignment: Alignment.topLeft,
                  child: const Text(
                    '산책할 지역을 선택해주세요',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: MediaQuery.of(context).size.width - 40,
                  height: MediaQuery.of(context).size.height*(3/5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: Colors.black38,
                      width: 3
                    ),
                  ),
                  child: apiCityResult.isEmpty
                      ? Center(child: CircularProgressIndicator())
                      : ListView.builder(
                    itemCount: apiCityResult.length,
                    itemBuilder: (BuildContext context, int index) {
                      final city = apiCityResult[index];
                      final isSelected = selectedCities[index] ?? false;
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: OutlinedButton(
                          onPressed: () {
                            _toggleSelection(index);
                          },
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                              color: isSelected ? const Color(0xff481C75) : Colors.white,
                            ),
                          ),
                          child: Text(
                            city['cityName'],
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  alignment: Alignment.bottomRight,
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      List<int> selectedCityIds = _getSelectedCityIds();
                      print('여기서');
                      print(selectedCityIds);
                      Get.to(() => TrailMainPage2(), arguments: {'selectedCityIds': selectedCityIds});
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff481C75),
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.only(left: 20, right: 20), // 버튼 높이 조정
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(45), // 모서리를 둥글게 설정
                      ),
                    ),
                    child: const Text(
                      '다음 단계로',
                      style: TextStyle(
                        fontSize: 15,
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
        ],
      ),
    );
  }
}
