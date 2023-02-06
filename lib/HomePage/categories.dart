import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:latihan/HomePage/icon_btn_with_counter.dart';
import 'package:latihan/HomePage/home_page.dart';
import 'package:latihan/Setting/Warna.dart';
import 'package:latihan/global.dart' as global;

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"icon": "assets/icons/Flash Icon.svg", "text": "Diskon"},
      {"icon": "assets/icons/Bill Icon.svg", "text": "Tagihan"},
      {"icon": "assets/icons/Game Icon.svg", "text": "Game"},
      {"icon": "assets/icons/Gift Icon.svg", "text": "Hadiah"},
      {"icon": "assets/icons/Discover.svg", "text": "Lainnya"},
    ];
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          categories.length,
          (index) => CategoryCard(
            icon: categories[index]["icon"],
            text: categories[index]["text"],
            press: () {},
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String? icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(55),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(15)),
              height: getProportionateScreenWidth(55),
              width: getProportionateScreenWidth(55),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 197, 223, 252),
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(icon!),
            ),
            SizedBox(height: 5),
            Text(text!, textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}

/*============================================================================================*/

double tinggiTombolIcon = 99;
double lebarTombolIcon = 99;
Widget iconContainer() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5.0),
    child: Column(
      children: <Widget>[
        Container(
          // margin: EdgeInsets.only(left: 13, right: 13),
          margin: EdgeInsets.symmetric(horizontal: 5),
          // Deretan Icon baris ke-1
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                iconTarikTunai(),
                iconTopup(),
                iconTransfer(),
              ]
//
              ),
        ),
        //
        SizedBox(
          height: 5,
        ),
        //
        Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(0),
                child: GestureDetector(
                  child: Container(
                    height: tinggiTombolIcon,
                    width: lebarTombolIcon,
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          //Image.asset('assets/transfer.png'),
                          SvgPicture.asset(
                            "assets/icons/Flash Icon.svg",
                            width: 50,
                            height: 50,
                          ),
                          // Icon(Icons.send),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            global.text_fitur4,
                            style: TextStyle(
                                color: Color(hexColor(global.warnaTeks)),
                                fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => PulsaDanPLN(widget.model)));
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(0),
                child: GestureDetector(
                  child: Container(
                      height: tinggiTombolIcon,
                      width: lebarTombolIcon,
                      child: Center(
                          child: Column(
                        children: <Widget>[
                          //Image.asset('assets/transfer.png'),
                          SvgPicture.asset(
                            "assets/icons/Phone.svg",
                            width: 50,
                            height: 50,
                          ),
                          // Icon(Icons.send),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            global.text_fitur5,
                            style: TextStyle(
                                color: Color(hexColor(global.warnaTeks)),
                                fontSize: 14),
                          ),
                        ],
                      ))),
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => PulsaDanPLN(widget.model)));
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(0),
                child: GestureDetector(
                  child: Container(
                      height: tinggiTombolIcon,
                      width: lebarTombolIcon,
                      child: Center(
                          child: Column(
                        children: <Widget>[
                          //Image.asset('assets/transfer.png'),
                          SvgPicture.asset(
                            "assets/icons/Bill Icon.svg",
                            width: 50,
                            height: 50,
                          ),
                          // Icon(Icons.send),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            global.text_fitur6,
                            style: TextStyle(
                                color: Color(hexColor(global.warnaTeks)),
                                fontSize: 14),
                          ),
                          Text(
                            '',
                            style: TextStyle(
                                color: Color(hexColor(global.warnaTeks)),
                                fontSize: 14),
                          )
                        ],
                      ))),
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => MenuTagihan(widget.model)));
                  },
                ),
              ),
            ],
          ),
        ),
        // jarak antara saf icon 2 & 3
        SizedBox(
          height: 5,
        ),
        //
        // icon saf ke-3
        Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(0),
                child: GestureDetector(
                  child: Container(
                      // color: Colors.green,
                      height: tinggiTombolIcon,
                      width: lebarTombolIcon,
                      child: Center(
                          child: Column(
                        children: <Widget>[
                          //Image.asset('assets/transfer.png'),
                          SvgPicture.asset(
                            "assets/icons/Shop Icon.svg",
                            width: 50,
                            height: 50,
                          ),
                          // Icon(Icons.send),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            global.text_fitur7,
                            style: TextStyle(
                                color: Color(hexColor(global.warnaTeks)),
                                fontSize: 14),
                          ),
                        ],
                      ))),
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) =>
                    //           MarketPlace_Lokal_Page(widget.model)),
                    // );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(0),
                child: GestureDetector(
                  child: Container(
                      height: tinggiTombolIcon,
                      width: lebarTombolIcon,
                      child: Center(
                          child: Column(
                        children: <Widget>[
                          //Image.asset('assets/transfer.png'),
                          SvgPicture.asset(
                            "assets/icons/Sekolah.svg",
                            width: 50,
                            height: 50,
                          ),
                          // Icon(Icons.send),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            global.text_fitur8,
                            style: TextStyle(
                                color: Color(hexColor(global.warnaTeks)),
                                fontSize: 14),
                          )
                        ],
                      ))),
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) =>
                    //           marketPlacePage(widget.model)),
                    // );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(0),
                child: GestureDetector(
                  child: Container(
                      height: tinggiTombolIcon,
                      width: lebarTombolIcon,
                      child: Center(
                          child: Column(
                        children: <Widget>[
                          //Image.asset('assets/transfer.png'),
                          SvgPicture.asset(
                            "assets/icons/Koperasi.svg",
                            width: 50,
                            height: 50,
                          ),
                          // Icon(Icons.send),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            global.text_fitur9,
                            style: TextStyle(
                                color: Color(hexColor(global.warnaTeks)),
                                fontSize: 14),
                          )
                        ],
                      ))),
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) =>
                    //             marketPlacePage(widget.model)));
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget iconTransfer() {
  return Padding(
    padding: const EdgeInsets.all(0),
    child: GestureDetector(
      child: Container(
          width: lebarTombolIcon,
          height: tinggiTombolIcon,
          child: Center(
              child: Column(
            children: <Widget>[
              //Image.asset('assets/transfer.png'),
              SvgPicture.asset(
                "assets/icons/Transfer.svg",
                width: 50,
                height: 50,
              ),
              // Icon(Icons.send),
              SizedBox(
                height: 10,
              ),
              Text(
                global.text_fitur3,
                style: TextStyle(
                    color: Color(hexColor(global.warnaTeks)),
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                ' ',
                style: TextStyle(
                    color: Color(hexColor(global.warnaTeks)),
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              )
            ],
          ))),
      onTap: () {
        // if (widget.model.sudahVerifikasi) {
        //   Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => transferPage(widget.model)),
        //   );
        // } else {
        //   popupSilahkanVerif();
        // }
      },
    ),
  );
}

Widget iconTopup() {
  return Padding(
    padding: const EdgeInsets.all(0),
    child: GestureDetector(
      child: Container(
          width: lebarTombolIcon,
          height: tinggiTombolIcon,
          child: Center(
              child: Column(
            children: <Widget>[
              //Image.asset('assets/send.png'),
              //Icon(Icons.attach_money),
              SvgPicture.asset(
                "assets/icons/Plus Icon.svg",
                width: 50,
                height: 50,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                global.text_fitur2,
                style: TextStyle(
                    color: Color(hexColor(global.warnaTeks)),
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ))),
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => topUpPage(widget.model)),
        // );
      },
    ),
  );
}

Widget iconTarikTunai() {
  // debugPrint("isi idKomunitas adalah :");
  // debugPrint(widget.model.idKomunitas.toString());
  return Padding(
    padding: const EdgeInsets.all(0),
    child: GestureDetector(
      child: Container(
        width: lebarTombolIcon,
        height: tinggiTombolIcon,
        child: Center(
          child: Column(
            children: <Widget>[
              //Image.asset('assets/transfer.png'),
              SvgPicture.asset(
                "assets/icons/Cash.svg",
                width: 50,
                height: 50,
              ),
              // Icon(Icons.send),
              SizedBox(
                height: 10,
              ),
              Text(
                global.text_fitur1,
                style: TextStyle(
                    color: Color(hexColor(global.warnaTeks)),
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              // Text(
              //   'Tunai',
              //   style: TextStyle(
              //       color: Color(hexColor(global.warnaTeks)),
              //       fontSize: 14,
              //       fontWeight: FontWeight.w500),
              // )
            ],
          ),
        ),
      ),
      onTap: () {
        // if (widget.model.sudahVerifikasi) {
        //   Navigator.push(
        //     context,
        //     MaterialPageRoute(builder: (context) => TarikTunai(widget.model)),
        //   );
        // } else {
        //   popupSilahkanVerif();
        // }
      },
    ),
  );
}
