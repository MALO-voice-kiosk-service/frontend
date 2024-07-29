import 'package:flutter/material.dart';
import 'package:sparcs_2024_frontend/screens/loading.dart';

void main(){
  runApp(NeuruApp());
}

class NeuruApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoadingPage(),
    );
  }

}