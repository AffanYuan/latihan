import 'package:flutter/material.dart';

import 'package:latihan/HomePage/home_page.dart';
import 'package:latihan/HomePage/icon_btn_with_counter.dart';
import 'package:latihan/Setting/setting.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconBtnWithCounter(svgSrc: "assets/icons/User.svg", press: () {}
              //Navigator.pushNamed(context, CartScreen.routeName),
              ),
          Container(
            width: SizeConfig.screenWidth * 0.6,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 208, 208, 208),
              borderRadius: BorderRadius.circular(15),
            ),
            child: TextField(
              onChanged: (value) => print(value),
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20),
                      vertical: getProportionateScreenWidth(15)),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  hintText: "Search product",
                  prefixIcon: Icon(Icons.search)),
            ),
          ),
          IconBtnWithCounter(
              svgSrc: "assets/icons/Settings.svg",
              press: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingPage()));
              }
              //Navigator.pushNamed(context, CartScreen.routeName),
              ),
          // IconBtnWithCounter(
          //   svgSrc: "assets/icons/Bell.svg",
          //   numOfitem: 3,
          //   press: () {},
          // ),
        ],
      ),
    );
  }
}
