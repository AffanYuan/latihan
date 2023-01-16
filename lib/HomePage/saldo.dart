import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:latihan/Screen/Login/LoginPage.dart';
import 'package:latihan/HomePage/home_page.dart';

class Saldo extends StatelessWidget {
  const Saldo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 90,
      width: double.infinity,
      margin: EdgeInsets.all(getProportionateScreenWidth(20)),
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
        vertical: getProportionateScreenWidth(15),
      ),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 109, 0, 218),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text.rich(
        TextSpan(
          style: TextStyle(color: Colors.white),
          children: [
            TextSpan(text: "Sisa saldo Anda\n\n"),
            TextSpan(
              text: "Rp ",
              style: TextStyle(
                fontSize: getProportionateScreenWidth(24),
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: formatedBalance,
              // text: "0",
              style: TextStyle(
                fontSize: getProportionateScreenWidth(24),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
    // return Padding(
    //   padding: EdgeInsets.fromLTRB(15, 19, 15, 0),
    //   child: Container(
    //     width: 301,
    //     height: 57,
    //     decoration: BoxDecoration(
    //         //  color: WarnaPrimary,
    //         color: Color.fromARGB(255, 18, 218, 0),
    //         shape: BoxShape.rectangle,
    //         borderRadius: BorderRadius.all(Radius.circular(11))),
    //     child: Row(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: <Widget>[
    //         //Image.asset('assets/pembayaran.png'),

    //         SizedBox(
    //           width: 10,
    //         ),
    //         Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           // crossAxisAlignment: CrossAxisAlignment.start,
    //           children: <Widget>[
    //             Padding(
    //               padding: const EdgeInsets.only(top: 0),
    //               child: Text(
    //                 'Saldo',
    //                 style: TextStyle(fontSize: 14, color: Colors.white),
    //               ),
    //             ),
    //             Row(
    //               children: <Widget>[
    //                 Text(
    //                   //rupiah(model.formatedBalance),
    //                   'jok',
    //                   style: TextStyle(fontSize: 24, color: Colors.white),
    //                 ),
    //               ],
    //             ),
    //           ],
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }
}

// Future<void> refreshApi() async {
//   Map<String, String> headerJSON = {
//     "Content-Type": "application/json",
//   };

//   final response = await http.post(
//     Uri.parse("https://test.edimu.live/api/base_info"),
//     headers: headerJSON,
//   );

//   var data = json.decode(response.body);

//   var status;

//   if (response.statusCode == 203) {
//     formatedBalance = data['saldo'];
//     formatedBalance = formatedBalance.substring(0, formatedBalance.length - 3);
//   } else {
//     status = 0;
//     return status;
//   }

//   // notifyListeners();
// }
