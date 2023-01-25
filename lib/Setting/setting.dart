import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:latihan/HomePage/home_page.dart';
import 'package:latihan/Setting/Warna.dart';

class SettingPage extends StatefulWidget {
  // const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
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
            buildOption(context, "Icon", () {}),
            SizedBox(height: getProportionateScreenHeight(10)),
            buildOption(context, "Logo", () {}),
            SizedBox(height: getProportionateScreenHeight(20)),
            buildToggle("Tampil Saldo", valNotify2, onChangeFunction2),
          ],
        ),
      ),
    );
  }
}

bool valNotify1 = true;
bool valNotify2 = false;
bool valNotify3 = false;

onChangeFunction1(bool newValue1) {
  // setState(() {
  valNotify1 = newValue1;
  // });
}

onChangeFunction2(bool newValue2) {
  // setState(() {
  valNotify2 = newValue2;
  // });
}

onChangeFunction3(bool newValue3) {
  // setState(() {
  valNotify3 = newValue3;
  // });
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
          Text(
            title,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.grey[700]),
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
