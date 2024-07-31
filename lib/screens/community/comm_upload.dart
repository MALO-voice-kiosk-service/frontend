import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../../service/api.dart';

class CommUploadPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CommUploadPageState();
}

class CommUploadPageState extends State<CommUploadPage> {

  bool isJoinSelected = true;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController locController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  String title = "";
  String loc = "";
  String content = "";

  @override
  void initState() {
    super.initState();

    titleController.addListener(() {
      setState(() {
        title = titleController.text;
      });
    });

    locController.addListener(() {
      setState(() {
        loc = locController.text;
      });
    });

    contentController.addListener(() {
      setState(() {
        content = contentController.text;
      });
    });
  }

  Future<void> uploadPost() async {
    const String url = '/api/post';

    Map<String, dynamic> data = {
      "post_title" : title,
      "post_content" : content,
      "post_tag" : isJoinSelected == true ? 0 : 1,
      "location" : loc,
    };

    final response = await httpPost(path: url, data: data);
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
                '게시글 쓰기',
                style: TextStyle(
                  color: const Color(0xff481C75),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () async {
                  uploadPost();
                  Get.back(result: true);
                },
                child: const Text(
                  '등록',
                  style: TextStyle(
                    color: Color(0xff481C75),
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset : false,
          body: SingleChildScrollView(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 40,
                  height: MediaQuery.of(context).size.height - 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: Colors.black38,
                    )
                  ),
                  child: SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            '태그',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              ElevatedButton(
                                  onPressed: (){
                                    setState(() {
                                      isJoinSelected = true;
                                    });
                                  },
                                style: ButtonStyle(
                                  backgroundColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
                                    if(isJoinSelected){
                                      return const Color(0xff481C75);
                                    }
                                    return Colors.grey;
                                  }),
                                ),
                                  child: const Text(
                                      '친목',
                                    style: TextStyle(color: Colors.white),
                                  ),
                              ),
                              const SizedBox(width: 5,),
                              ElevatedButton(
                                onPressed: (){
                                  setState(() {
                                    isJoinSelected = false;
                                  });
                                },
                                child: Text(
                                  '홍보',
                                  style: TextStyle(color: Colors.white),
                                ),
                                style: ButtonStyle(
                                  backgroundColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
                                    if(!isJoinSelected){
                                      return const Color(0xff481C75);
                                    }
                                    return Colors.grey;
                                  }),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5,),
                          const Text(
                            '제목',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextFormField(
                            controller: titleController,

                          ),
                          const SizedBox(height: 5,),
                          const Text(
                            '위치',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextFormField(
                            controller: locController,
                          ),
                          const SizedBox(height: 5,),
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
                                color: Colors.white70,
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
                ),
              ],
            ),
          ),
        )
    );
  }
}
