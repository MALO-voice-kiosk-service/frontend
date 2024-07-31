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

  List<dynamic> apiReviewResult = []; // 가공된 리뷰 데이터

  late String selectedWalkwayId;
  late String cotCONTSGeom;
  Map<String, dynamic>? apiTrailResult;
  bool isLiked = false; // Add this state variable

  @override
  void initState() {
    super.initState();
    final arguments = Get.arguments.toList();
    print('arguments_get: $arguments');
    selectedWalkwayId = arguments[0];
    print('walkway_id: $selectedWalkwayId');
    cotCONTSGeom = arguments[1];

    _getSelectedTrailData();
    _loadReviewData(1); //(TODO) 이거 아이디 받아와서 해야해~

    if(isLiked == true){
      postLike(selectedWalkwayId);
    }
  }

  Future<void> _getSelectedTrailData() async {
    final result = await httpGet(path: '/api/walkway/$selectedWalkwayId');
    setState(() {
      apiTrailResult = result['data'];
    });
  }
  
  Future<void> _loadReviewData(int id) async {
    final result = await httpGet(path: '/api/review/$id');
    setState(() {
      apiReviewResult = result['data'];
    });
  }

  Future<void> postLike(String selectedWalkwayId) async {
    String plus_url = '/api/like/$selectedWalkwayId';
    final response = await httpPostString(path: plus_url, data: selectedWalkwayId);

    if (response == 200){
      print('조아요수 증가 성공');
    } else {
      print('조아요수 증가 실패');
    }
  }

  void _toggleLike() {
    setState(() {
      isLiked = !isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff8B75B5),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.black38,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 3,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Image.asset('lib/assets/images/defaultImg.png'),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            child: Text(
                              '혼자 즐기는 공원 산책',
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
                                  onPressed: _toggleLike,
                                  icon: Icon(
                                    isLiked ? Icons.thumb_up : FeatherIcons.thumbsUp,
                                  ),
                                  color: const Color(0xff481C75),
                                  iconSize: 17,
                                ),
                                SizedBox(width: 1,),
                                Text(
                                  isLiked ? '25개' : '24개',
                                  /*apiTrailResult != null
                                ? '${apiTrailResult!['likeCount']}개'
                                : '로딩 중...',*/
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
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.black38,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 3,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
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
                                NaverMapWidget(isDetailedMap: false, lineString: cotCONTSGeom,),
                                Container(
                                  margin: EdgeInsets.all(10),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Get.to(ShowTrailPinPage(), arguments: {true, cotCONTSGeom, selectedWalkwayId});
                                    },
                                    style: ElevatedButton.styleFrom(
                                      fixedSize: Size(MediaQuery.of(context).size.width * (1/3),15),
                                      backgroundColor: Color(0xff481C75),
                                    ),
                                    child: const Text(
                                      '산책 시작하기',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.black38,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 3,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
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
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                              child: apiReviewResult.isEmpty ? Center(child: CircularProgressIndicator()) : ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: apiReviewResult.length,
                                itemBuilder: (BuildContext context, int index) {

                                  return Container(
                                    child: Column(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                                          margin: EdgeInsets.fromLTRB(20, 2, 20, 2),
                                          width: MediaQuery.of(context).size.width - 40,
                                          decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius: BorderRadius.circular(15),
                                            border: Border.all(
                                              color: Colors.black38,
                                            ),
                                          ),
                                          child: Container(
                                            padding: const EdgeInsets.only(left: 10, right: 10),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.person,
                                                  color: Colors.black,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Flexible( // 이 부분 추가
                                                  child: Text(
                                                    apiReviewResult[index]['review_content'],
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.black,
                                                    ),
                                                    softWrap: true,
                                                    overflow: TextOverflow.visible, // 이 부분 수정
                                                    maxLines: null, // 자동 줄바꿈
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),


                                        const SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              )

                          ),
                        ],
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
