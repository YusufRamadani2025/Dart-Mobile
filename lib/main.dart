import 'package:flutter/material.dart';
import 'package:fluttersliccing/boardingpage.dart';
import 'package:fluttersliccing/home_screen.dart';


void main() {
  runApp(const HouseMateApp());
}

class HouseMateApp extends StatelessWidget {
  const HouseMateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HouseMate',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: Boarding_page(),
    );
  }
}
  