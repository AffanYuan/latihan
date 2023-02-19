import 'package:flutter/material.dart';

class Warna {
  static Color primary = Color(0xFF1B63DE);
  static Color accent = Colors.blueAccent;

  // warna background halaman
  // static String warnaHome_db = "";
  // static Color warnaHome = Color(hexColor(warnaHome_db));
  static Color warnaHome;

  // static Color warnaTunai = Color(hexColor(warnaHome_db));
  static Color warnaTunai;
  static Color warnaTeks;

  static Color warnaNavBar = Color(0xFFFFCB8C);
  //
  static Color hijauBG = Color(0xffE3FFEE);
  static Color hijauBG2 = Color(0xfff7fffa);
  static Color kuningTombol = Color(0xffffea00);
  //
  static BoxDecoration bgGradient(Color warna) {
    return BoxDecoration(
      gradient: LinearGradient(
        tileMode: TileMode.mirror,
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          warna,
          Color(0xFFFFFFFF),
        ],
        stops: [
          0,
          1,
        ],
      ),
      backgroundBlendMode: BlendMode.srcOver,
    );
  }
}

class Teks {
  static String fitur1 = '';
  static String fitur2 = '';
  static String fitur3 = '';
  static String fitur4 = '';
  static String fitur5 = '';
  static String fitur6 = '';
  static String fitur7 = "";
  static String fitur8 = "";
  static String fitur9 = "";
  static String navbar1 = 'Beranda';
  static String navbar2 = 'Kontak';
  static String navbar3 = 'Transaksi';
  static String navbar4 = 'Profil';
}

Color hijauMain = Warna.primary;
Color hijauBG = Warna.hijauBG;

class AsetLokal {
  static String iconGoogleMap = 'lib/assets/icon_map.png';
  static String kartuFikri = 'lib/assets/card.png';
  static String icon_fitur1 = "lib/assets/tariktunai.png";
  static String icon_fitur2 = "lib/assets/topup.png";
  static String icon_fitur3 = "lib/assets/transfer.png";
  static String icon_fitur4 = "lib/assets/PPOB/pembayaran emoney.png";
  static String icon_fitur5 = "lib/assets/PPOB/pembayaran pulsa.png";
  static String icon_fitur6 = "lib/assets/PPOB/pembayaran multifinance.png";
  static String icon_fitur7 = "lib/assets/marketplacelokal.png";
  static String icon_fitur8 = "lib/assets/marketplacekomunitas.png";
  static String icon_fitur9 = "lib/assets/marketplacekomoditas.png";
}

String rapiin(String s) {
  return s.splitMapJoin(
    RegExp(r'^', multiLine: true),
    onMatch: (_) => '\n',
    onNonMatch: (n) => n.trim(),
  );
}

int hexColor(String color) {
  String newColor = color;
  newColor = newColor.replaceAll("#", "");
  int finalColor = int.parse(newColor);
  return finalColor;
}
