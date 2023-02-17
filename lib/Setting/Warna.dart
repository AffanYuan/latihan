import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:latihan/Setting/setting.dart';
<<<<<<< HEAD

List _dataWarna = [];
String kodeWarnaLatar = "0xffffffff";
// int finalKodeLatar = 15;
String namaWarnaLatar = "";
String kodeWarnaTeks = "";
String namaWarnaTeks = "";
=======
import 'package:latihan/global.dart' as global;
import 'package:latihan/HomePage/home_page.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
>>>>>>> d9fb74828a13cbd05a624e1a28371711e09100b2

class Warna extends StatefulWidget {
  const Warna({super.key});

  @override
  State<Warna> createState() => _WarnaState();
}

class _WarnaState extends State<Warna> {
  List _dataWarna = [];
  List _dataWarnaSimpan = [];
  String kodeWarnaLatar = "";
  String namaWarnaLatar = "";
  String kodeWarnaTeks = "";
  String namaWarnaTeks = "";

  void getListWarna() async {
    final response =
        await http.get(Uri.parse("https://pkl.pembelajaran.my.id/api/warna"));
    var listData = json.decode(response.body);
    // debugPrint(listData);
    // debugPrint('isi dari var listData = ${listData['komunitas'].toString()}');

    setState(() {
      _dataWarna = listData["data"];
    });
    //debugPrint('=========================================');
    //debugPrint('isi dari var _dataWarna = ${_dataWarna.toString()}');
  }

  // void getWarnaSimpan() async {
  //   final response = await http
  //       .get(Uri.parse("https://pkl.pembelajaran.my.id/api/pengaturan"));
  //   var data = json.decode(response.body);
  //   // debugPrint(listData);
  //   // debugPrint('isi dari var listData = ${listData['komunitas'].toString()}');

  //   setState(() {
  //     _dataWarnaSimpan = data["data"];
  //     global.color = _dataWarnaSimpan[7];
  //     kodeWarnaA = _dataWarnaSimpan[7];
  //   });

  //   //debugPri;nt('=========================================');
  //   //debugPrint('isi dari var _dataWarna = ${_dataWarna.toString()}');
  // }

  // Future ubahWarna(String namaWarnaLatar) async {
  //   final bodyJSON = jsonEncode({
  //     // "nohape": selectedWarna,
  //     "warna_tombol": kodeWarnaLatar,
  //   });

  //   Map<String, String> headerJSON = {
  //     "Content-Type": "application/json",
  //   };

  //   final response = await http.post(
  //       Uri.parse("https://pkl.pembelajaran.my.id/api/setting"),
  //       headers: headerJSON,
  //       body: bodyJSON);
  // }

  @override
  void initState() {
    super.initState();
    getListWarna();
  }

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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Text("Warna Latar",
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.left),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    dropdownWarna("latar"),
                    SizedBox(
                      height: getProportionateScreenHeight(30),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Text("Warna Teks",
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.left),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    dropdownWarna("teks"),
                    SizedBox(
                      height: getProportionateScreenHeight(250),
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

  Widget dropdownWarna(String pilihWarna) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(Icons.color_lens, color: Colors.grey),
        SizedBox(width: 15),
        Container(
          width: MediaQuery.of(context).size.width * 0.75,
          child: DropdownButton(
            // icon: Icon(Icons.account_balance),

            isExpanded: true,
            hint: pilihWarna == "latar"
                ? Text(namaWarnaLatar == "" ? "Pilih Warna" : namaWarnaLatar,
                    style: TextStyle(fontWeight: FontWeight.bold))
                : Text(namaWarnaTeks == "" ? "Pilih Warna" : namaWarnaTeks,
                    style: TextStyle(fontWeight: FontWeight.bold)),

            items: _dataWarna.map((item) {
              return DropdownMenuItem(
                child: Text(item['nama']),
                value: item['kode_warna'],
                onTap: () {
                  if (pilihWarna == "latar") {
                    setState(() {
                      namaWarnaLatar = item['nama'];
                      kodeWarnaLatar = item['kode_warna'];
                      setState(() {});
                    });
                  } else {
                    setState(() {
                      namaWarnaTeks = item['nama'];
                      kodeWarnaTeks = item['kode_warna'];
                      setState(() {});
                    });
                  }
                },
              );
            }).toList(),
            onChanged: (value) {},
          ),
        )
      ],
    );
  }

  Widget apply() {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: GestureDetector(
        onTap: () async {
          // String? response = await ubahWarna(namaWarnaLatar);
          if (kodeWarnaLatar != "" && kodeWarnaTeks == "") {
            setState(() {
              global.warnaLatar = kodeWarnaLatar;
            });
            Navigator.pop(context);
            Navigator.pop(context);
            Navigator.pop(context);
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          } else if (kodeWarnaLatar == "" && kodeWarnaTeks != "") {
            setState(() {
              global.warnaTeks = kodeWarnaTeks;
            });
            Navigator.pop(context);
            Navigator.pop(context);
            Navigator.pop(context);
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          } else if (kodeWarnaLatar != "" && kodeWarnaTeks != "") {
            setState(() {
              global.warnaLatar = kodeWarnaLatar;
              global.warnaTeks = kodeWarnaTeks;
            });
            Navigator.pop(context);
            Navigator.pop(context);
            Navigator.pop(context);
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          } else {
            await Alert(
              type: AlertType.error,
              context: context,
              title: "Semua wajib diisi",
              // desc: "Periksa kembali Email & Password anda",
            ).show();
          }
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

int hexColor(String color) {
  String newColor = color;
  int finalColor = int.parse(newColor);
  return finalColor;
}
