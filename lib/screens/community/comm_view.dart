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
                onPressed: () {
                  Get.to(() => CommUploadPage());
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
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
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
                              Text(
                                apiResult!['data'][index]['location'].toString(),
                              ),
                        ],
                      ),
                      // 오른쪽 사진 정보
                      Container(
                        child: Image.asset('lib/assets/defaultImg.png'),
                        width: MediaQuery.of(context).size.width*(1/3),
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
