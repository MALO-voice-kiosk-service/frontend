import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class TrailUsePage extends StatefulWidget {

  static const start_loc = '우리 집'; // 받아온 data
  static const arrive_loc = '성동구청'; // 받아온 data

  @override
  State<StatefulWidget> createState() => TrailUsePageState();
}

class TrailUsePageState extends State<TrailUsePage> {
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
            Container(
              width: MediaQuery.of(context).size.width - 40,
              child: Flexible(
                child: RichText(
                  overflow: TextOverflow.ellipsis,
                  maxLines:3,
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
                        text: '가 추천하는 ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      TextSpan(
                        //(TODO) data 받아와서 띄워야 해
                        text: '산책로',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: '를 이용하는 중입니다.',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      )
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                    child: IconButton(
                        icon: Icon(Icons.sync_rounded),
                        color: const Color(0xff481C75),
                        onPressed: () {
                          null;
                          //(TODO) 출발지, 도착지 변경
                        }
                    ),
                  ),
              ),
              Expanded(
                  flex: 3,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: (){},
                          child: Text(
                            TrailUsePage.start_loc,
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: (){},
                          child: Text(
                            TrailUsePage.arrive_loc,
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
              ),
            ]
        )
      ),
    );
  }

}