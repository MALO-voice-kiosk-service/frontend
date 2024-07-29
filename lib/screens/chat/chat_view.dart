import 'package:flutter/material.dart';
import 'package:sparcs_2024_frontend/utils/button.dart';

class ChatMainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ChatMainPageState();
}

class ChatMainPageState extends State<ChatMainPage> {
  bool isAllSelected = true;

  static const data = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 50,
        automaticallyImplyLeading: false,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '채팅',
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
            Row(
              children: [
                ElevatedButton(
                  onPressed: (){
                    setState(() {
                      isAllSelected = true;
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
                      if(isAllSelected){
                        return Colors.black;
                      }
                      return Colors.grey;
                    }),
                  ),
                  child: const Text(
                    '전체',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 10,),
                ElevatedButton(
                  onPressed: (){
                    setState(() {
                      isAllSelected = false;
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
                      if(!isAllSelected){
                        return Colors.black;
                      }
                      return Colors.grey;
                    }),
                  ),
                  child: const Text(
                    '안 읽은 채팅방',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
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
      )
    );
  }
}