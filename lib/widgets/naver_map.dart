import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:developer';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import '../service/api.dart';

class NaverMapWidget extends StatefulWidget {
  final bool isDetailedMap;
  final String lineString;

  NaverMapWidget({Key? key, required this.isDetailedMap, required this.lineString}) : super(key: key);

  @override
  State<StatefulWidget> createState() => NaverMapWidgetState();
}

class NaverMapWidgetState extends State<NaverMapWidget> {
  Future<void>? _initializeFuture;
  Completer<NaverMapController> _mapControllerCompleter = Completer();

  late String _lineString = widget.lineString;
  late bool isDetailedMap = widget.isDetailedMap;
  late List<NLatLng> _coordinates;
  final NLatLng _detailedCoordinate = NLatLng(37.520708636788, 126.943499323195); // 표시할 좌표

  @override
  void initState() {
    super.initState();
    _initializeFuture = _initialize();
    _coordinates = _parseCoordinates(_lineString);
    print('lineString: $_lineString');
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

                // If isDetailedMap is true, add a marker at the specific coordinate
                if (isDetailedMap) {
                  final markerOverlay = NMarker(
                    id: 'detailed_markerf',
                    position: _detailedCoordinate,
                  );
                  controller.addOverlay(markerOverlay);
                }
              },
            ),
          );
        }
      },
    );
  }
}

class PinnedMapPage extends StatefulWidget {
  final bool isDetailedMap;
  final String lineString;
  final int pinTag;

  PinnedMapPage({Key? key, required this.isDetailedMap, required this.lineString, required this.pinTag}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PinnedMapPageState();
}

class PinnedMapPageState extends State<PinnedMapPage> {
  Future<void>? _initializeFuture;
  Completer<NaverMapController> _mapControllerCompleter = Completer();
  NaverMapController? _mapController;

  late String _lineString = widget.lineString;
  late bool isDetailedMap = widget.isDetailedMap;
  late int pinTag = widget.pinTag;
  late List<NLatLng> _coordinates;
  late List<NLatLng> pinCoordinates = [];
  Map<String, dynamic>? apiResult;
  final newMarkers = <NMarker>[];

  @override
  void initState() {
    super.initState();
    _initializeFuture = _initialize();
    _coordinates = _parseCoordinates(_lineString);
    fetchPinData();
  }

  @override
  void didUpdateWidget(PinnedMapPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.pinTag != oldWidget.pinTag) {
      pinTag = widget.pinTag;
      fetchPinData(); // Fetch new pin data when pinTag changes
    }
  }

  Future<void> fetchPinData() async {
    final result = await httpGet(path: '/api/location?category=$pinTag');
    setState(() {
      apiResult = result;
      print('pin api result: $apiResult');
      // Update _coordinates with API result
      pinCoordinates = _parseApiCoordinates(apiResult!['data']);
      print('pinCoordinates: $pinCoordinates');

      // Update map with new pinCoordinates
      _updateMapMarkers();
    });
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

  List<NLatLng> _parseApiCoordinates(List<dynamic> data) {
    return data.map((location) {
      final double latitude = double.tryParse(location['cot_COORD_Y'].toString()) ?? 0.0;
      final double longitude = double.tryParse(location['cot_COORD_X'].toString()) ?? 0.0;
      return NLatLng(latitude, longitude);
    }).toList();
  }

  Future<void> _updateMapMarkers() async {
    if (_mapController != null) {
      // Remove all existing markers
      for (var marker in newMarkers) {
        await _mapController!.deleteOverlay(marker.info);
      }
      newMarkers.clear();

      // Add new markers
      if (isDetailedMap) {
        for (var coordinate in pinCoordinates) {
          final markerOverlay = NMarker(
            id: 'marker_${coordinate.hashCode}', // Ensure unique ID for each marker
            position: coordinate,
          );
          await _mapController!.addOverlay(markerOverlay);
          newMarkers.add(markerOverlay);
        }
      }
    }
    print('Markers: $newMarkers');
  }

  @override
  Widget build(BuildContext context) {
    print('pinnedMap built with $pinTag');
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
                locationButtonEnable: false,
                // 위치 버튼 표시 여부 설정
                consumeSymbolTapEvents: false,
                // 심볼 탭 이벤트 소비 여부 설정
                mapType: NMapType.basic,
                liteModeEnable: true,
              ),
              onMapReady: (controller) async {
                _mapControllerCompleter.complete(controller);
                _mapController = controller;
                log("onMapReady", name: "onMapReady");

                // Add polyline
                final polylineOverlay = NPolylineOverlay(
                  id: 'polyline',
                  coords: _coordinates,
                  color: const Color(0xff481C75),
                  width: 5,
                );
                controller.addOverlay(polylineOverlay);

                // Initial marker setup if detailed map
                if (isDetailedMap) {
                  await _updateMapMarkers();
                }
              },
            ),
          );
        }
      },
    );
  }
}

