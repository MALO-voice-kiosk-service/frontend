import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:developer';
import 'package:flutter_naver_map/flutter_naver_map.dart';

class NaverMapWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => NaverMapWidgetState();
}

class NaverMapWidgetState extends State<NaverMapWidget> {
  Future<void>? _initializeFuture;

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

    return FutureBuilder<void>(
      future: _initializeFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show a loading spinner while the SDK is initializing
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          // Handle initialization error
          return Center(child: Text('Error initializing Naver Map SDK'));
        } else {
          // SDK is initialized, show the map
          return Container(
            width: MediaQuery.of(context).size.width, // Adjust width as needed
            height: MediaQuery.of(context).size.height, // Adjust height as needed
            child: NaverMap(
              options: const NaverMapViewOptions(
                locationButtonEnable: false, // 위치 버튼 표시 여부 설정
                consumeSymbolTapEvents: false, // 심볼 탭 이벤트 소비 여부 설정
                mapType: NMapType.basic,
                liteModeEnable: true,
              ),
              onMapReady: (controller) async {
                mapControllerCompleter.complete(controller);
                log("onMapReady", name: "onMapReady");
              },
            ),
          );
        }
      },
    );
  }
}
