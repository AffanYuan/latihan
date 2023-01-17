import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:latihan/HomePage/home_page.dart';

class Warna extends StatefulWidget {
  const Warna({super.key});

  @override
  State<Warna> createState() => _WarnaState();
}

class _WarnaState extends State<Warna> {
  List _dataWarna = [];
  String selectedWarna = "";
  String selectedNamaWarna = "";
  late String selectedAlamatKomunitas;
  late String selectedTeleponKomunitas;

  void getKomunitas() async {
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

  @override
  void initState() {
    super.initState();
    getKomunitas();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Warna", style: TextStyle(fontSize: 22)),
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
                    height: getProportionateScreenHeight(20),
                  ),
                  dropdownWarna(),
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget dropdownWarna() {
    if (_dataWarna != null) {
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
              hint: Text(
                  selectedNamaWarna == "" ? "Pilih Warna" : selectedNamaWarna,
                  style: TextStyle(fontWeight: FontWeight.bold)),
              items: _dataWarna.map((item) {
                return DropdownMenuItem(
                  child: Text(item['nama']),
                  value: item['kode_warna'],
                  onTap: () {
                    setState(() {
                      selectedNamaWarna = item['nama'];
                      selectedWarna = item['kode_warna'];
                      setState(() {});
                    });
                  },
                );
              }).toList(),
              onChanged: (value) {},
              // onChanged: (value) {
              //   setState(() {
              //     selectedWarna = value;
              //   });
              //   //debugPrint("ID yang dipilih adalah ${value.toString()}");
              // },
            ),
          )
        ],
      );
    } else {
      return Container(
        width: double.infinity,
        child: Center(child: Text('Data Komunitas belum di-muat')),
      );
    }
  }
}
