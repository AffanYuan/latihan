import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:latihan/HomePage/home_page.dart';
import 'package:latihan/Setting/Warna.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

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
            buildOption(context, "Logo", () {})
          ],
        ),
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
}
