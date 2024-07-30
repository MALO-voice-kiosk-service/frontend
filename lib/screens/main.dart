import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sparcs_2024_frontend/screens/chat/chat_view.dart';
import 'package:sparcs_2024_frontend/screens/community/comm_view.dart';
import 'package:sparcs_2024_frontend/screens/loading.dart';
import 'package:sparcs_2024_frontend/screens/mypage/mypage_view.dart';
import 'package:sparcs_2024_frontend/screens/trail/trail_main.dart';
import 'package:sparcs_2024_frontend/screens/trail/trail_view.dart';

void main(){
  runApp(NeuruApp());
}

class NeuruApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: LoadingPage(),
      theme: ThemeData(
        splashFactory: NoSplash.splashFactory,
      ),
    );
  }

}

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> _pages = [TrailMainPage(), CommViewPage(), ProfileMainPage()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.nature),
            label: '산책',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: '커뮤니티',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '나의 느루',
          ),
        ],
        showUnselectedLabels: true,
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xff481C75),
        unselectedItemColor: Colors.black38,
        onTap: _onItemTapped,
      ),
    );
  }
}