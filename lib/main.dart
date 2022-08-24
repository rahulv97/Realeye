import 'package:flutter/material.dart';
import 'package:realeye_india/AddNew.dart';
import 'package:realeye_india/DashBoard.dart';
import 'package:realeye_india/LoginPage.dart';
import 'package:realeye_india/RegisterPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}
