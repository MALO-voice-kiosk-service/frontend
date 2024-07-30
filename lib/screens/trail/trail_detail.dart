import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sparcs_2024_frontend/screens/trail/trail_use.dart';

class TrailDetailPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TrailDetailPageState();
}

class TrailDetailPageState extends State<TrailDetailPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
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
                        //(TODO) 제목 get
                        child:
                          Text(
                          '반려견과 함께하는 공원 산책',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ),
                      Container(
                        //(TODO) 설명 get
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
                                    text: '휠체어 사용자가 반려견과 함께 산책하기 좋은 루트는 평탄하고 넓은 보행로가 있는 공원이나 강변 산책로입니다.',
                                    style:
                                    TextStyle(
                                      color: Colors.black,
                                      fontSize: 14.0,
                                    ),
                                  )
                                )
                            )
                          ],
                        )
                      ),
                      Container(
                        height: 5,
                      ),
                      Container(
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: (){
                                  //(TODO) 누르기 전엔 아웃라인따봉, 누르면 가득찬따봉과 좋아요수++;
                                  null;
                                },
                                icon: const Icon(FeatherIcons.thumbsUp),
                                color: const Color(0xff481C75),
                                iconSize: 17,
                            ),
                            SizedBox(width: 1,),
                            Text(
                              //(TODO) 좋아요 수 get해오기
                              '106개',
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 15,),
                            Text(
                              '리뷰',
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 1,),
                            Text(
                              //(TODO) 리뷰 수 get해오기
                              '10개',
                              style: const TextStyle(
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
                      Text(
                        '지도',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        width: MediaQuery.of(context).size.width - 40,
                        height: MediaQuery.of(context).size.height * (1 / 7),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: Colors.black38,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            '지도 가져와야 함', //(TODO) 지도
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        '출발지: (여기도 나중에 get)',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                        ),
                      ),
                      Text(
                        '도착지: (여기도 나중에 get)',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                        ),
                      ),
                      Text(
                        '이동거리: (여기도 나중에 get)',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                        ),
                      ),
                      const Divider(
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Icon(
                              Icons.comment_outlined,
                              size: 17,
                              color: const Color(0xff481C75),
                            ),
                            SizedBox(width: 5,),
                            Text(
                              '사용자들의 리뷰',
                              style: const TextStyle(
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
                      )
                      )
                    ],
                  ),
                ),
              )
            ],
          )
      ),
    );
  }

}