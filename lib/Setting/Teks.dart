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
  final TextEditingController _text_fitur1 = new TextEditingController();

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
                      child: Text("Warna Teks",
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.left),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
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

  Widget apply() {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: GestureDetector(
        onTap: () async {
          // String? response = await ubahWarna(namaWarnaLatar);
          if (_text_fitur1 != "") {
            global.text_fitur1 = _text_fitur1.text;
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
