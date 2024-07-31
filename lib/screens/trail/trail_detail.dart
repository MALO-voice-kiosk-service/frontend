import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:sparcs_2024_frontend/screens/trail/trail_showpin.dart';
import '../../service/api.dart';
import '../../widgets/naver_map.dart';

class TrailDetailPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TrailDetailPageState();
}

class TrailDetailPageState extends State<TrailDetailPage> {
  late String selectedWalkwayId;
  late String cotCONTSGeom;
  Map<String, dynamic>? apiTrailResult;

  @override
  void initState() {
    super.initState();
    final arguments = Get.arguments.toList();
    print('arguments_get: $arguments');
    selectedWalkwayId = arguments[0];
    print('walkway_id: $selectedWalkwayId');
      cotCONTSGeom = arguments[1];
      _getSelectedTrailData();
  }

  Future<void> _getSelectedTrailData() async {
    final result = await httpGet(path: '/api/walkway/$selectedWalkwayId');
    setState(() {
      apiTrailResult = result['data'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset('lib/assets/defaultImg.png'),
                    ),
                    Container(
                      child: Text(
                        '산책로 설명',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Flexible(
                            child: RichText(
                              overflow: TextOverflow.ellipsis,
                              maxLines: 5,
                              strutStyle: StrutStyle(fontSize: 14.0),
                              text: TextSpan(
                                text: apiTrailResult != null
                                    ? apiTrailResult!['walkway_description']
                                    : '로딩 중...',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 5,
                    ),
                    Container(
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              //(TODO) 누르기 전엔 아웃라인따봉, 누르면 가득찬따봉과 좋아요수++;
                              null;
                            },
                            icon: const Icon(FeatherIcons.thumbsUp),
                            color: const Color(0xff481C75),
                            iconSize: 17,
                          ),
                          SizedBox(width: 1,),
                          Text(
                            apiTrailResult != null
                                ? '${apiTrailResult!['likeCount']}개'
                                : '로딩 중...',
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 15,),
                          const Text(
                            '리뷰',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 1,),
                          const Text(
                            '10개',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      '지도',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      width: MediaQuery.of(context).size.width - 40,
                      height: MediaQuery.of(context).size.height * (1 / 4),
                      child: Stack(
                        children: [
                          // TODO
                          NaverMapWidget(isDetailedMap: false, lineString: cotCONTSGeom,),
                          Container(
                            margin: EdgeInsets.all(10),
                            child: ElevatedButton(
                              onPressed: () {
                                Get.to(ShowTrailPinPage(), arguments: {true, cotCONTSGeom});
                              },
                              style: ElevatedButton.styleFrom(
                                fixedSize: Size(MediaQuery.of(context).size.width * (1/3),20),
                                shape: BeveledRectangleBorder(
                                  borderRadius: BorderRadius.circular(0),
                                ),
                                backgroundColor: Color(0xff481C75),
                              ),
                              child: const Text(
                                '산책 시작하기',
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    const Divider(
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: const Row(
                        children: [
                          Icon(
                            Icons.comment_outlined,
                            size: 17,
                            color: Color(0xff481C75),
                          ),
                          SizedBox(width: 5,),
                          Text(
                            '사용자들의 리뷰',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      //(TODO) ListView로 리뷰 get해온거 띄워야 해요

                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 3, //(TODO) 리뷰 수 세서
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              child: Column(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width - 40,
                                    height: 100, //(TODO) 내용 맞춰서
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                        color: Colors.black38,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '리뷰 가져와야 함', //(TODO) 리뷰
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            );
                          }
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
