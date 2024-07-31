import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sparcs_2024_frontend/screens/trail/trail_main.dart';
import 'package:sparcs_2024_frontend/screens/trail/trail_reviewEnd.dart';

import '../../service/api.dart';
import '../main.dart';

class TrailReviewPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => TrailReviewPageState();
}

class TrailReviewPageState extends State<TrailReviewPage> {

  final TextEditingController contentController = TextEditingController();
  String content = "";

  @override
  void initState() {
    super.initState();

    contentController.addListener(() {
      setState(() {
        content = contentController.text;
      });
    });
  }

  @override
  void dispose() {
    contentController.dispose();
    super.dispose();
  }

  Future<void> uploadReview(int reviewId) async {
    String url = '/api/review/$reviewId';
    final response = await httpPostString(path: url, data: content);
    //(TODO) id 받아와서 하는 걸로 수정해야 해

    if (response == 200) {
      Get.to(() => TrailReviewEndPage());
      //_fetchCommentData(postId);
    } else {
      //print('*** Review Upload failed ***');
    }

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
              IconButton(
                  icon: const Icon(Icons.close),
                  color: const Color(0xff481C75),
                  onPressed: () {
                    Get.back();
                  }
              ),
              const Text(
                '리뷰 작성',
                style: TextStyle(
                  color: const Color(0xff481C75),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'NanumSquareNeo',
                ),
              ),
              TextButton(
                onPressed: () async {
                  // (TODO) 리뷰 post하셔야해
                  uploadReview(1); // 이거 아이디 받아와서
                },
                child: const Text(
                  '등록',
                  style: TextStyle(
                    color: Color(0xff481C75),
                    fontSize: 18,
                    fontFamily: 'NanumSquareNeo',
                  ),
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child:
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width - 40,
                  height: MediaQuery.of(context).size.height - 90,
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            '사진',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5,),
                          ElevatedButton(
                            onPressed: () async {
                              var picker = ImagePicker();
                              var image = await picker.pickImage(source: ImageSource.gallery);
                            },
                            child: const Text(
                              '사진을 업로드해주세요',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          const SizedBox(height: 5,),
                          const Text(
                            '본문',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5,),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                  color: Colors.black38,
                                )
                            ),
                            width: MediaQuery.of(context).size.width - 60,
                            height: 500,
                            padding: EdgeInsets.all(20),
                            child: TextField(
                              controller: contentController,
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              decoration: const InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          )
                        ],



                      ),
                    ),
                  ),
                )


              ],
            )
        )
    );
  }

}