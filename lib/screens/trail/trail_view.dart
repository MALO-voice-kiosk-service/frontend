import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:get/get.dart';
import 'package:sparcs_2024_frontend/screens/trail/trail_detail.dart';
import 'package:sparcs_2024_frontend/screens/trail/trail_showpin.dart';
import 'package:sparcs_2024_frontend/widgets/naver_map.dart';

class TrailViewPage extends StatefulWidget {
  Map<String, dynamic>? apiMapResult;

  TrailViewPage({super.key, required this.apiMapResult});

  @override
  State<StatefulWidget> createState() => TrailViewPageState();
}

class TrailViewPageState extends State<TrailViewPage> {
  late Map<String, dynamic>? apiMapResult;
  static const data = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10']; // 받아온 data

  void initState() {
    super.initState();
    apiMapResult = widget.apiMapResult;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
          Column(
            children: [
              SizedBox(height: 80,),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '느루',
                      style: TextStyle(
                        color: const Color(0xff481C75),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: '가 추천하는 산책로입니다',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ],
                  style: TextStyle(
                    fontFamily: 'NanumSquareNeo',
                  ),
                ),
              ),
              SingleChildScrollView(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    SizedBox(height: 80,),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate((apiMapResult!['data'] as List).length, (index) {
                          return Container(
                            width: MediaQuery.of(context).size.width * (2/3),
                            height: MediaQuery.of(context).size.height * (2/3),
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: Colors.black38,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width * (2/3) - 50,
                                        height: MediaQuery.of(context).size.height * (2/3) - 100,
                                        child: NaverMapWidget(isDetailedMap: false, lineString: apiMapResult!['data'][index]['cot_CONTS_GEOM'],)
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        Get.to(() => TrailDetailPage(), arguments: {apiMapResult!['data'][index]['walkway_id'].toString(), apiMapResult!['data'][index]['cot_CONTS_GEOM'].toString()});
                                      },
                                      child: Text(
                                        '상세 정보',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(0xff481C75),
                                      ),
                                    ),
                                  ],
                                ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
