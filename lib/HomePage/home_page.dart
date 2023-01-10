import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:latihan/main.dart';
import 'package:latihan/HomePage/icon_btn_with_counter.dart';
import 'package:latihan/HomePage/home_header.dart';
import 'package:latihan/HomePage/categories.dart';
import 'package:latihan/HomePage/special_offers.dart';
import 'package:latihan/HomePage/saldo.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: getProportionateScreenHeight(20)),
              HomeHeader(),
              SizedBox(height: getProportionateScreenWidth(10)),
              Saldo(),
              SpecialOffers(),
              SizedBox(height: getProportionateScreenWidth(30)),
              iconContainer(),
              SizedBox(height: getProportionateScreenWidth(30)),
              //PopularProducts(),
              SizedBox(height: getProportionateScreenWidth(30)),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.mail), label: "Pesan"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil")
        ],
      ),
    );
  }
}

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth = 375;
  static late double screenHeight = 812;
  static double? defaultSize;
  static Orientation? orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
}

// Get the proportionate height as per screen size
double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  // 812 is the layout height that designer use
  return (inputHeight / 812.0) * screenHeight;
}

// Get the proportionate height as per screen size
double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  // 375 is the layout width that designer use
  return (inputWidth / 375.0) * screenWidth;
}

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key,
    required this.title,
    required this.press,
  }) : super(key: key);

  final String title;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(18),
            color: Colors.black,
          ),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            "See More",
            style: TextStyle(color: Color(0xFFBBBBBB)),
          ),
        ),
      ],
    );
  }
}
