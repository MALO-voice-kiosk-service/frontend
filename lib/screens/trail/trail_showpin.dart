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
