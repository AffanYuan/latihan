import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

String color = "0xffffffff";
String formatedBalance = "";

// void getWarnaSimpan() async {
//   final response = await http
//       .get(Uri.parse("https://pkl.pembelajaran.my.id/api/pengaturan"));
//   var data = json.decode(response.body);
//   // debugPrint(listData);
//   // debugPrint('isi dari var listData = ${listData['komunitas'].toString()}');

//   // setState(() {
//   color = data["warna_tombol"];
//   // });

//   //debugPri;nt('=========================================');
//   //debugPrint('isi dari var _dataWarna = ${_dataWarna.toString()}');
// }
