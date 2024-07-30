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
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 50,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              '산책로 세부정보 페이지',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              Container(
                  alignment: Alignment.bottomRight,
                  margin: EdgeInsets.fromLTRB((MediaQuery.of(context).size.width)*(1/5), 0, (MediaQuery.of(context).size.width)*(1/5), 0),
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      Get.to(() => TrailUsePage());
                    },
                    style: ElevatedButton.styleFrom(
                        foregroundColor: const Color(0xff481C75),
                        padding: EdgeInsets.symmetric(vertical: 15), // 버튼 높이 조정
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // 모서리를 둥글게 설정
                        )
                    ),
                    child: const Text('사용페이지이동(임시)',
                      style: TextStyle(
                        fontSize: 20,
                      ),),
                  )
              ),
            ],
          )
      ),
    );
  }

}