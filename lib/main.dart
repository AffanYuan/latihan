import 'package:flutter/material.dart';
import 'package:latihan/Screen/Login/LoginPage.dart';
import 'package:latihan/Screen/Login/SignUp.dart';
import 'package:latihan/HomePage/home_page.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:latihan/global.dart' as global;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AFA',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
