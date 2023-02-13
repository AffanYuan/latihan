import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:http/http.dart' as http;
import 'package:latihan/Setting/setting.dart';
import 'package:latihan/global.dart' as global;
import 'package:latihan/HomePage/home_page.dart';
import 'package:latihan/components/my_textfield.dart';

class Teks extends StatefulWidget {
  const Teks({super.key});

  @override
  State<Teks> createState() => _TeksState();
}

class _TeksState extends State<Teks> {
  final _text_fitur1 = TextEditingController();
  final _text_fitur2 = TextEditingController();
  final _text_fitur3 = TextEditingController();
  final _text_fitur4 = TextEditingController();
  final _text_fitur5 = TextEditingController();
  final _text_fitur6 = TextEditingController();
  final _text_fitur7 = TextEditingController();
  final _text_fitur8 = TextEditingController();
  final _text_fitur9 = TextEditingController();
  String text_fitur1 = "";
  String text_fitur2 = "";
  String text_fitur3 = "";
  String text_fitur4 = "";
  String text_fitur5 = "";
  String text_fitur6 = "";
  String text_fitur7 = "";
  String text_fitur8 = "";
  String text_fitur9 = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Setting Warna", style: TextStyle(fontSize: 22)),
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Text("Teks Fitur 1",
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.left),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    MyTextField(
                        controller: _text_fitur1,
                        hintText: global.text_fitur1,
                        obscureText: false),
                    SizedBox(
                      height: getProportionateScreenHeight(30),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Text("Teks Fitur 2",
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.left),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    MyTextField(
                        controller: _text_fitur2,
                        hintText: global.text_fitur2,
                        obscureText: false),
                    SizedBox(
                      height: getProportionateScreenHeight(30),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Text("Teks Fitur 3",
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.left),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    MyTextField(
                        controller: _text_fitur3,
                        hintText: global.text_fitur3,
                        obscureText: false),
                    SizedBox(
                      height: getProportionateScreenHeight(30),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Text("Teks Fitur 4",
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.left),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    MyTextField(
                        controller: _text_fitur4,
                        hintText: global.text_fitur4,
                        obscureText: false),
                    SizedBox(
                      height: getProportionateScreenHeight(30),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Text("Teks Fitur 5",
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.left),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    MyTextField(
                        controller: _text_fitur5,
                        hintText: global.text_fitur5,
                        obscureText: false),
                    SizedBox(
                      height: getProportionateScreenHeight(30),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Text("Teks Fitur 6",
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.left),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    MyTextField(
                        controller: _text_fitur6,
                        hintText: global.text_fitur6,
                        obscureText: false),
                    SizedBox(
                      height: getProportionateScreenHeight(30),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Text("Teks Fitur 7",
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.left),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    MyTextField(
                        controller: _text_fitur7,
                        hintText: global.text_fitur7,
                        obscureText: false),
                    SizedBox(
                      height: getProportionateScreenHeight(30),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Text("Teks Fitur 8",
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.left),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    MyTextField(
                        controller: _text_fitur8,
                        hintText: global.text_fitur8,
                        obscureText: false),
                    SizedBox(
                      height: getProportionateScreenHeight(30),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Text("Teks Fitur 9",
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.left),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    MyTextField(
                        controller: _text_fitur9,
                        hintText: global.text_fitur9,
                        obscureText: false),
                    SizedBox(
                      height: getProportionateScreenHeight(50),
                    ),
                    apply(),
                    // buildToggle("Theme Dark", valNotify1, onChangeFunction1),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  Widget apply() {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: GestureDetector(
        onTap: () async {
          //
          // String? response = await ubahWarna(namaWarnaLatar);
          text_fitur1 = _text_fitur1.text;
          if (text_fitur1 != "") {
            global.text_fitur1 = text_fitur1;
            debugPrint(text_fitur1);
          }
          text_fitur2 = _text_fitur2.text;
          if (text_fitur2 != "") {
            global.text_fitur2 = text_fitur2;
          }
          text_fitur3 = _text_fitur3.text;
          if (text_fitur3 != "") {
            global.text_fitur3 = text_fitur3;
          }
          text_fitur4 = _text_fitur4.text;
          if (text_fitur4 != "") {
            global.text_fitur4 = text_fitur4;
          }
          text_fitur5 = _text_fitur5.text;
          if (text_fitur5 != "") {
            global.text_fitur5 = text_fitur5;
          }
          text_fitur6 = _text_fitur6.text;
          if (text_fitur6 != "") {
            global.text_fitur6 = text_fitur6;
          }
          text_fitur7 = _text_fitur7.text;
          if (text_fitur7 != "") {
            global.text_fitur7 = text_fitur7;
          }
          text_fitur8 = _text_fitur8.text;
          if (text_fitur8 != "") {
            global.text_fitur8 = text_fitur8;
          }
          text_fitur9 = _text_fitur9.text;
          if (text_fitur9 != "") {
            global.text_fitur9 = text_fitur9;
          }
          Navigator.pop(context);
          Navigator.pop(context);
          Navigator.pop(context);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        },
        child: Container(
          padding: const EdgeInsets.all(25),
          margin: const EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(
            color: Colors.blue[400],
            borderRadius: BorderRadius.circular(40),
          ),
          child: const Center(
            child: Text(
              "Apply",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
