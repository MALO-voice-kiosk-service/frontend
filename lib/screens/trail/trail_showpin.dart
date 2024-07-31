import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:developer';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:sparcs_2024_frontend/widgets/naver_map.dart';

class ShowTrailPinPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ShowTrailPinPageState();
}

class ShowTrailPinPageState extends State<ShowTrailPinPage> {
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

    return Scaffold(
      backgroundColor: Colors.white,
      body: NaverMapWidget(),
    );
  }
}
