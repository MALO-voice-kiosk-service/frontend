import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:sparcs_2024_frontend/screens/community/comm_upload.dart';

class CommViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CommViewPageState();
}

class CommViewPageState extends State<CommViewPage> {

  static const data = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10']; // 받아온 data

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
              '게시판',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
                icon: const Icon(FeatherIcons.edit),
                color: Colors.black,
                onPressed: () {
                  Get.to(() => CommUploadPage());
                }
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return SingleChildScrollView(
                  child: Text(
                    data[index],
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
