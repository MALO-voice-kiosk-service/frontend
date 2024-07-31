import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:developer';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:get/get.dart';
import 'package:sparcs_2024_frontend/widgets/naver_map.dart';

class ShowTrailPinPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ShowTrailPinPageState();
}

class ShowTrailPinPageState extends State<ShowTrailPinPage> {
  Future<void>? _initializeFuture;
  bool isDetailedMap = Get.arguments;
  int locationTag = 0; // 화장실 : 0, 전동보장구 급속충전기 : 1, 영화관 : 2

  @override
  void initState() {
    super.initState();
    _initializeFuture = _initialize();
  }

  Future<void> _initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    await NaverMapSdk.instance.initialize(
      clientId: 'r2v3jakzsi', // 클라이언트 ID
      onAuthFailed: (e) => log("네이버맵 인증오류 : $e", name: "onAuthFailed"),
    );
  }

  @override
  Widget build(BuildContext context) {
    Completer<NaverMapController> mapControllerCompleter = Completer();

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
              },
              style: ButtonStyle(
                overlayColor: WidgetStateColor.resolveWith((states) => Colors.transparent),
              ),
            ),
            const Text(
              '산책하기',
              style: TextStyle(
                color: Color(0xff481C75),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              width: 50,
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          NaverMapWidget(isDetailedMap: true),
          Container(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.only(left: 10, right: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // 화장실 버튼
                  ElevatedButton(
                    onPressed: (){
                      setState(() {
                        locationTag = 0;
                      });
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
                        if(locationTag == 0){
                          return const Color(0xff481C75);
                        }
                        return Colors.grey;
                      }),
                    ),
                    child: Row(
                      children: [
                        Container(
                            child: Image.asset(
                                'lib/assets/toilet.png',
                              fit: BoxFit.contain,
                            ),
                          width: 20,
                          height: 20,
                        ),
                        SizedBox(width: 10,),
                        const Text(
                          '화장실',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10,),
                  // 충전기 버튼
                  ElevatedButton(
                    onPressed: (){
                      setState(() {
                        locationTag = 1;
                      });
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
                        if(locationTag == 1){
                          return const Color(0xff481C75);
                        }
                        return Colors.grey;
                      }),
                    ),
                    child: Row(
                      children: [
                        Container(
                          child: Image.asset(
                            'lib/assets/wheelchair_2.png',
                            fit: BoxFit.contain,
                          ),
                          width: 20,
                          height: 20,
                        ),
                        SizedBox(width: 10,),
                        const Text(
                          '급속충전기',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10,),
                  // 영화관 버튼
                  ElevatedButton(
                    onPressed: (){
                      setState(() {
                        locationTag = 2;
                      });
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
                        if(locationTag == 2){
                          return const Color(0xff481C75);
                        }
                        return Colors.grey;
                      }),
                    ),
                    child: Row(
                      children: [
                        Container(
                          child: Image.asset(
                            'lib/assets/movie.png',
                            fit: BoxFit.contain,
                          ),
                          width: 20,
                          height: 20,
                        ),
                        SizedBox(width: 10,),
                        const Text(
                          '영화관',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 20),
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
                onPressed: (){

                },
                child: const Text(
                  '산책 끝내기',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff481C75),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
