import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:latihan/global.dart' as global;
import 'package:latihan/HomePage/home_page.dart';
import 'package:latihan/Setting/Icon.dart';
import 'package:latihan/Setting/Teks.dart';
import 'package:latihan/Setting/Warna.dart';

class SettingPage extends StatefulWidget {
  // const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool valNotify1 = true;
  bool valNotify2 = false;
  bool valNotify3 = false;

  onChangeFunction1(bool newValue1) {
    setState(() {
      valNotify1 = newValue1;
    });
  }

  onChangeFunction2(bool newValue2) {
    setState(() {
      valNotify2 = newValue2;
    });
  }

  onChangeFunction3(bool newValue3) {
    setState(() {
      valNotify3 = newValue3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Setting", style: TextStyle(fontSize: 22)),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            SizedBox(height: getProportionateScreenHeight(40)),
            Row(
              children: [
                Icon(
                  Icons.settings,
                  color: Colors.blue,
                ),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                  width: getProportionateScreenWidth(10),
                ),
                Text(
                  "Tema",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                )
              ],
            ),
            Divider(
              height: getProportionateScreenHeight(20),
              thickness: 1,
            ),
            SizedBox(height: getProportionateScreenHeight(10)),
            buildOption(context, "Warna", () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Warna()));
            }),
            SizedBox(height: getProportionateScreenHeight(10)),
            buildOption(context, "Icon", () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => iconPage()));
            }),
            SizedBox(height: getProportionateScreenHeight(10)),
            buildOption(context, "Teks", () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Teks()));
            }),
            SizedBox(height: MediaQuery.of(context).size.shortestSide),
            // buildToggle("Tampil Saldo", valNotify2, onChangeFunction2),
            SimpanSetting()
          ],
        ),
      ),
    );
  }
}

Padding buildToggle(String title, bool value, Function onChangeMethod) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600]),
        ),
        Transform.scale(
          scale: 0.7,
          child: CupertinoSwitch(
              activeColor: Colors.blue,
              trackColor: Colors.grey,
              value: value,
              onChanged: (bool newValue) {
                onChangeMethod(newValue);
              }),
        )
      ],
    ),
  );
}

GestureDetector buildOption(
    BuildContext context, String title, GestureTapCallback press) {
  return GestureDetector(
    onTap: press,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[700]),
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey,
          )
        ],
      ),
    ),
  );
}

Future ubahWarna(String namaWarnaLatar) async {
  final bodyJSON = jsonEncode({
    // "nohape": selectedWarna,
    "warna_tombol": global.warnaLatar,
  });

  Map<String, String> headerJSON = {
    "Content-Type": "application/json",
  };

  final response = await http.post(
      Uri.parse("https://pkl.pembelajaran.my.id/api/setting"),
      headers: headerJSON,
      body: bodyJSON);
}

Widget SimpanSetting() {
  return Padding(
    padding: const EdgeInsets.all(0),
    child: GestureDetector(
      onTap: () async {
        // String? response = await ubahWarna(namaWarnaLatar);
        // if (kodeWarnaLatar != "" && kodeWarnaTeks != "") {

        // } else {
        //   await Alert(
        //     type: AlertType.error,
        //     context: context,
        //     title: "Semua wajib diisi",
        //     // desc: "Periksa kembali Email & Password anda",
        //   ).show();
        // }
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
            "Save",
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
