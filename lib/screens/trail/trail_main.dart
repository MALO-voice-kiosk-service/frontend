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
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.map_outlined),
                  color: const Color(0xff481C75),
                  onPressed: () {
                    // 지도에서 선택 기능 추가
                  },
                ),
                Text(
                  '지도에서 선택',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ],
            ),
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
            SizedBox(height: 2),
            Container(
              alignment: Alignment.bottomRight,
              margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  List<int> selectedCityIds = _getSelectedCityIds();
                  Get.to(() => TrailMainPage2(), arguments: {'selectedCityIds': selectedCityIds});
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: const Color(0xff481C75),
                  padding: EdgeInsets.symmetric(vertical: 15), // 버튼 높이 조정
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // 모서리를 둥글게 설정
                  ),
                ),
                child: const Text(
                  '다음 단계로',
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
