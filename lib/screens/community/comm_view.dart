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
  Map<String, dynamic>? apiPostResult;
  Map<String, dynamic>? apiCommentResult;

  final TextEditingController commentController = TextEditingController();
  String comment = "";

  bool isJoinSelected = true;

  @override
  void initState() {
    super.initState();
    _fetchData();

    commentController.addListener(() {
      setState(() {
        comment = commentController.text;
      });
    });
  }

  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }

  // 게시글 전체
  Future<void> _fetchData() async {
    final result = await httpGet(path: '/api/post');
    setState(() {
      apiResult = result;
    });
  }

  // 댓글 전체
  Future<void> _fetchCommentData(int postId) async {
    final result = await httpGet(path: '/api/post/comment/$postId');
    setState(() {
      apiCommentResult = result;
    });
  }

  // comment 업로드
  Future<void> uploadComment(int postId) async {
    String url = '/api/post/comment/$postId';
    final response = await httpPostString(path: url, data: comment);

    if (response == 200) {
      print('*** Upload Successed ***');
      _fetchCommentData(postId);
    } else {
      print('*** Upload failed ***');
    }
  }

  void showDetails(BuildContext context, int id){
    apiPostResult == null
        ? Center(child: CircularProgressIndicator())
        : showModalBottomSheet(
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
            child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20,),
                      Text(
                        apiPostResult!['data']['post_title'].toString(),
                        style: const TextStyle(
                          color: const Color(0xff481C75),
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset('lib/assets/images/defaultImg.png'),
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
                            apiPostResult!['data']['location'].toString(),
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
                        apiPostResult!['data']['post_content'].toString(),
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
                      SizedBox(height: 10,),
                      Container(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          )
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width*(2/3),
                              child: TextFormField(
                                controller: commentController,
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: IconButton(
                                icon: Icon(Icons.send_rounded),
                                color: Colors.grey,
                                onPressed: () {
                                  uploadComment(id);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      apiCommentResult == null
                          ? Center(child: CircularProgressIndicator())
                          : ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: (apiCommentResult!['data'] as List).length,
                        itemBuilder: (context, index) {
                          final commentData = (apiCommentResult!['data'] as List)[index];
                          return ListTile(
                            title: Text(commentData['comment_content']),
                          );
                        },
                      ),
                    ],
                  ),
                ),
          ),
        );
      },
      backgroundColor: Colors.transparent, // 앱 <=> 모달의 여백 부분을 투명하게 처리
    );
  }

  // 특정 게시물
  Future<void> _fetchPostData(BuildContext context, int id) async {
    print('id: $id');
    final result = await httpGet(path: '/api/post/$id');
    await _fetchCommentData(id);
    setState(() {
      apiPostResult = result;
    });
    showDetails(context, id);
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        height: 20,
                        width: 20,
                        child: Image.asset(
                            'lib/assets/images/letter.png'),
                      ),
                      const Text(
                        '우리 이웃들의 소리',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '이웃들의 소리, 세상의 소리에 귀 기울여 보세요!',
                  ),
                ],
              ),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                border: Border.all(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            SizedBox(height: 20,),
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
                    fixedSize: WidgetStateProperty.all<Size>(Size(80, 30)),
                  ),
                  child: const Text(
                    '친목',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                ElevatedButton(
                  onPressed: (){
                    setState(() {
                      isJoinSelected = false;
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
                      if(!isJoinSelected){
                        return const Color(0xff481C75);
                      }
                      return Colors.grey;
                    }),
                    fixedSize: WidgetStateProperty.all<Size>(Size(80, 30)),
                  ),
                  child: const Text(
                    '홍보',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(), // 리스트 스크롤 중복 방지
              itemCount: (apiResult!['data'] as List).where((item) => isJoinSelected ? item['post_tag'] == 0 : item['post_tag'] == 1).length,
              itemBuilder: (BuildContext context, int index) {
                final filteredData = (apiResult!['data'] as List).where((item) => isJoinSelected ? item['post_tag'] == 0 : item['post_tag'] == 1).toList();
                return ElevatedButton(
                  onPressed: (){
                    int id = filteredData[index]['id'];
                    _fetchPostData(context, id);
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
                                  filteredData[index]['post_title'].toString(),
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
                                        filteredData[index]['post_tag'] == 0 ? '친목' : '홍보',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10,),
                                    Text(
                                      filteredData[index]['location'].toString(),
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
                            child: Image.asset('lib/assets/images/defaultImg.png'),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
