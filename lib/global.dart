import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

String warnaLatar = "";
String warnaTeks = "";
String formatedBalance = "";
String text_fitur1 = "";
String text_fitur2 = "";
String text_fitur3 = "";
String text_fitur4 = "";
String text_fitur5 = "";
String text_fitur6 = "";
String text_fitur7 = "";
String text_fitur8 = "";
String text_fitur9 = "";

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
