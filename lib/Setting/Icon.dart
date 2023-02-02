import 'package:flutter/material.dart';
import 'package:latihan/HomePage/home_page.dart';

class iconPage extends StatefulWidget {
  const iconPage({super.key});

  @override
  State<iconPage> createState() => _iconPageState();
}

class _iconPageState extends State<iconPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text("Setting Icon", style: TextStyle(fontSize: 22))),
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
                    child: Text("Icon Tarik Tunai",
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.left),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
                  dropdownIcon("latar"),
                  SizedBox(
                    height: getProportionateScreenHeight(30),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text("Icon Isi Saldo",
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.left),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
                  dropdownIcon("teks"),
                  SizedBox(
                    height: getProportionateScreenHeight(30),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      "Icon Transfer",
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  dropdownIcon("teks"),
                  SizedBox(
                    height: getProportionateScreenHeight(30),
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
      ),
    );
  }

  Widget dropdownIcon(String pilihWarna) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(Icons.image, color: Colors.grey),
        SizedBox(width: 15),
        Container(
          width: MediaQuery.of(context).size.width * 0.75,
          // child: DropdownButton(
          //   // icon: Icon(Icons.account_balance),

          //   isExpanded: true,
          //   hint: pilihWarna == "latar"
          //       ? Text(namaWarnaLatar == "" ? "Pilih Warna" : namaWarnaLatar,
          //           style: TextStyle(fontWeight: FontWeight.bold))
          //       : Text(namaWarnaTeks == "" ? "Pilih Warna" : namaWarnaTeks,
          //           style: TextStyle(fontWeight: FontWeight.bold)),

          //   items: _dataWarna.map((item) {
          //     return DropdownMenuItem(
          //       child: Text(item['nama']),
          //       value: item['kode_warna'],
          //       onTap: () {
          //         if (pilihWarna == "latar") {
          //           setState(() {
          //             namaWarnaLatar = item['nama'];
          //             kodeWarnaLatar = item['kode_warna'];
          //             global.color = kodeWarnaLatar;

          //             setState(() {});
          //           });
          //         } else {
          //           setState(() {
          //             namaWarnaTeks = item['nama'];
          //             kodeWarnaTeks = item['kode_warna'];
          //             setState(() {});
          //           });
          //         }
          //       },
          //     );
          //   }).toList(),
          //   onChanged: (value) {},
          // ),
        )
      ],
    );
  }

  Widget apply() {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: GestureDetector(
        // onTap: () async {
        //   // String? response = await ubahWarna(namaWarnaLatar);
        //   if (kodeWarnaLatar != null) {
        //     setState(() {
        //       global.color = kodeWarnaLatar;
        //       print(global.color);
        //     });
        //     Navigator.pop(context);
        //     Navigator.pop(context);
        //     Navigator.pop(context);
        //     Navigator.push(
        //         context, MaterialPageRoute(builder: (context) => HomePage()));
        //   } else {}
        // },
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
