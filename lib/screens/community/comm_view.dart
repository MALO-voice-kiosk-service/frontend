import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:sparcs_2024_frontend/screens/community/comm_upload.dart';
import '../../service/api.dart';

class CommViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CommViewPageState();
}

class CommViewPageState extends State<CommViewPage> {

  Map<String, dynamic>? apiResult;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    final result = await httpGet(path: '/api/post');
    setState(() {
      apiResult = result;
    });
  }

  void showDetails(BuildContext context, int index){
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: Colors.white, // 모달 배경색
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 5,
                  width: MediaQuery.of(context).size.width*(1/4),
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(45)),
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20,),
                      Text(
                        apiResult!['data'][index]['post_title'].toString(),
                        style: const TextStyle(
                          color: const Color(0xff481C75),
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset('lib/assets/defaultImg.png'),
                      ),
                      Row(
                        children: [
                          Text(
                            '위치',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 10,),
                          Text(
                            apiResult!['data'][index]['location'].toString(),
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Text(
                        apiResult!['data'][index]['post_content'].toString(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                        ),
                      ),
                      const Divider(
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        '댓글',
                        style: const TextStyle(
                          color: Colors.black,
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
        );
      },
      backgroundColor: Colors.transparent, // 앱 <=> 모달의 여백 부분을 투명하게 처리
    );
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
            const Text(
              '게시판',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
                icon: const Icon(FeatherIcons.edit),
                color: Colors.black,
                onPressed: () async {
                  final result = await Get.to(CommUploadPage());
                  print("get result: $result");
                  if (result == true) {
                    await _fetchData();
                  }
                }
            ),
          ],
        ),
      ),
      body: apiResult == null
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(), // 리스트 스크롤 중복 방지
              itemCount: (apiResult!['data'] as List).length,
              itemBuilder: (BuildContext context, int index) {
                return ElevatedButton(
                  onPressed: (){
                    showDetails(context, index);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    elevation: 0,
                    shape: BeveledRectangleBorder(),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width*(1/3),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // 왼쪽 게시글 정보
                                    Text(
                                      apiResult!['data'][index]['post_title'].toString(),
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          alignment: Alignment.center,
                                          height: 20,
                                          width: 30,
                                          decoration: const BoxDecoration(
                                            color: Color(0xff481C75),
                                            borderRadius: BorderRadius.all(Radius.circular(10)),
                                            shape: BoxShape.rectangle,
                                          ),
                                          child: Text(
                                            apiResult!['data'][index]['post_tag'] == 0 ? '친목' : '홍보',
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 10,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 10,),
                                        Text(
                                          apiResult!['data'][index]['location'].toString(),
                                          style: const TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),

                              ],
                            ),
                          ),
                          // 오른쪽 사진 정보
                          Container(
                            width: MediaQuery.of(context).size.width*(1/3),
                            child: Image.asset('lib/assets/defaultImg.png'),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
