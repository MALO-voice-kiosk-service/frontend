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
  Completer<NaverMapController> _mapControllerCompleter = Completer();

  final String _lineString = "LINESTRING(126.943499323195 37.520708636788,126.943436448735 37.5207939689947,126.941731136119 37.5222258307638,126.941503970211 37.5223374257687,126.941296439188 37.5224716470201,126.941191124405 37.5225567772175,126.940822855245 37.5226203822069)";
  late List<NLatLng> _coordinates;

  @override
  void initState() {
    super.initState();
    _initializeFuture = _initialize();
    _coordinates = _parseCoordinates(_lineString);
  }

  Future<void> _initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    await NaverMapSdk.instance.initialize(
      clientId: 'r2v3jakzsi', // 클라이언트 ID
      onAuthFailed: (e) => log("네이버맵 인증오류 : $e", name: "onAuthFailed"),
    );
  }

  List<NLatLng> _parseCoordinates(String lineString) {
    final coordinates = lineString
        .replaceAll("LINESTRING(", "")
        .replaceAll(")", "")
        .split(",")
        .map((pair) {
      final latLng = pair.split(" ");
      return NLatLng(double.parse(latLng[1]), double.parse(latLng[0]));
    }).toList();
    print('coordinates: $coordinates');
    return coordinates;
  }

  @override
  Widget build(BuildContext context) {
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
              options: NaverMapViewOptions(
                initialCameraPosition: NCameraPosition(
                  target: _coordinates[(_coordinates.length / 2).toInt()],
                  zoom: 15, // Adjust the zoom level as needed
                ),
                locationButtonEnable: false, // 위치 버튼 표시 여부 설정
                consumeSymbolTapEvents: false, // 심볼 탭 이벤트 소비 여부 설정
                mapType: NMapType.basic,
                liteModeEnable: true,
              ),
              onMapReady: (controller) async {
                _mapControllerCompleter.complete(controller);
                log("onMapReady", name: "onMapReady");
                // Add polyline
                final polylineOverlay = NPolylineOverlay(
                  id: 'polyline',
                  coords: _coordinates,
                  color: const Color(0xff481C75),
                  width: 5,
                );
                controller.addOverlay(polylineOverlay);
              },
            ),
          );
        }
      },
    );
  }
}
