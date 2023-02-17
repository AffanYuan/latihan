import 'dart:convert';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/material.dart';
import 'package:latihan/HomePage/home_page.dart';
import 'package:latihan/Screen/Login/SignUp.dart';
import 'package:latihan/components/my_textfield.dart';
import 'package:latihan/components/my_button.dart';
import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:latihan/global.dart' as global;
// import 'package:shared_preferences/shared_preferences.dart';

/*=========================================================*/
/*=========================================================*/
/*=========================================================*/

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // User user;
  String idUser = "";
  String usernameUser = "";
  String passwordUser = "";
  late String alamatUser;
  late bool sudahVerifikasi = false;
  int idAktor = 0;
  bool apakahPunyaToko = false;

//
  late String pinTransaksi;

//NO HP beneran (bukan ID Login(usernameUser))
  late String nohapeAktif;

  String namaKomunitas = '....';
  late int idKomunitas;
  late int idGrup;
  late String alamatKomunitas;
  late String teleponKomunitas;
  Map dataBank = {'namaBank': null, 'norekBank': null, 'atasNama': null};

  late List listTagihan;

  int statusAuth = 0;

  String nama = '.....';

  late String norek;

  late int balance;
//
  int statusPayLater = 0;
  int statusPayLaterUser = 0;
  int limitPayLater = 0;
  int saldoPayLaterSekarang = 0;
  int penggunaanPayLater = 0;
  String isMinyak = "";

  late int balanceEmas;
  String formatedBalanceEmas = "emas";

  late int balanceSpp;
  String formatedBalanceSpp = "Plafon Spp";

  String token = "";

  late String duhur;
// ini authValue64 untuk header json bagian authnya
  late String authVaue64;

//List<contactsList> listContacts = [];

  List formulaPembagianMarketPlace = [];

  bool isLoading = false;

  Map<String, String> headerJSON = {
    "Content-Type": "application/json",
  };

  Map<String, String> userMap = {"saldo": "0"};

// text editing control
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  Widget childLoginButton = textLogin();

  static Widget textLogin() {
    return Text(
      "MASUK",
      style: TextStyle(
          color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700),
    );
  }

  //sign user method
  void signUserIn() {}

  Future<Null> login({
    required String username,
    required String password,
  }) async {
    // String credentials = "$username:$password";
    // Codec<String, String> stringToBase64 = utf8.fuse(base64);
    // String encoded = stringToBase64.encode(credentials);
    // String authValue = "Basic $encoded";
    // authVaue64 = authValue;

    final response = await http
        .get(Uri.parse("https://pkl.pembelajaran.my.id/api/pengaturan"));
    var dataWarna = json.decode(response.body);
    var data1 = dataWarna["data"];
    debugPrint("isi data Warna :");
    debugPrint(dataWarna.toString());
    debugPrint("isi data :");
    debugPrint(data1.toString());

    global.warnaLatar = data1[0]["warna_background"].toString();
    global.warnaTeks = data1[0]["warna_text"].toString();
    global.text_fitur1 = data1[0]["text_fitur1"].toString();
    global.text_fitur2 = data1[0]["text_fitur2"].toString();
    global.text_fitur3 = data1[0]["text_fitur3"].toString();
    global.text_fitur4 = data1[0]["text_fitur4"].toString();
    global.text_fitur5 = data1[0]["text_fitur5"].toString();
    global.text_fitur6 = data1[0]["text_fitur6"].toString();
    global.text_fitur7 = data1[0]["text_fitur7"].toString();
    global.text_fitur8 = data1[0]["text_fitur8"].toString();
    global.text_fitur9 = data1[0]["text_fitur9"].toString();

    usernameUser = username;
    passwordUser = password;

    final bodyJSON = jsonEncode({'id': usernameUser, 'password': passwordUser});

    var responseLogin;

    responseLogin = await http.post(
      Uri.parse("https://test.edimu.live/api/login"),
      headers: headerJSON,
      body: bodyJSON,
    );

    //debugPrint('1 step sebelum decode response');

    var data = json.decode(responseLogin.body);

    debugPrint("isi response login :");
    debugPrint(data.toString());

    if (responseLogin.statusCode == 200) {
      // 200 = belum verif
      statusAuth = 200;
      sudahVerifikasi = false;

      // statusAuth = 203;

      //debugPrint('login sukses');
      // final User usernya = User(
      //   id: int.parse(data['user_id']),
      //   email: data['email'],
      //   name: data['name'],
      // );

      usernameUser = data['user_id'];

      // user = usernya;
      idUser = data['user_id'];
      global.formatedBalance = data['saldo'];
      global.formatedBalance = global.formatedBalance
          .substring(0, global.formatedBalance.length - 3);
      nama = data['name'];
      norek = data['no_rekening'].toString();
      alamatUser = data['alamat_nasabah'];
      nohapeAktif = data['nohape'];

      idKomunitas = data['komunitas_id'];
      idGrup = data['grup_id'];
      idAktor = data['aktor_id'];

      namaKomunitas = data['nama_komunitas'];
      alamatKomunitas = data['alamat'];
      teleponKomunitas = data['telepon'];

      statusPayLater = data['status_paylater'];
      statusPayLaterUser = data['status_paylater_user'];
      limitPayLater = data['limit_paylater'];
      // limitPayLater = limitPayLater.substring(0, limitPayLater.length - 3);
      saldoPayLaterSekarang = data['saldo_sekarang'];
      // saldoPayLaterSekarang =
      //     saldoPayLaterSekarang.substring(0, saldoPayLaterSekarang.length - 3);
      penggunaanPayLater = limitPayLater - saldoPayLaterSekarang;
      isMinyak = data["isMinyak"];

      token = data["authorisation"]["token"];
      headerJSON = {
        // "Authorization": authVaue64,
        "Accept": "application/json",
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      };

      dataBank['namaBank'] = data['nama_bank'];
      dataBank['norekBank'] = data['norek_bank'];
      dataBank['atasNama'] = data['rekening_atas_nama'];

      if (data['id_toko'] != null) {
        apakahPunyaToko = true;
      }

      // if (idGrup == 2) {
      //   getTagihanBaru();
      // }
      setState(() {});

      // notifyListeners();
    } else if (responseLogin.statusCode == 201) {
      statusAuth = 201;
    } else if (responseLogin.statusCode == 202) {
      statusAuth = 202;
      // simpanLogin(token);
    } else if (responseLogin.statusCode == 203) {
      //
      //
      // 203 = Verified User
      //
      //
      statusAuth = 203;
      //debugPrint('login sukses');
      // final User usernya = User(
      //   id: int.parse(data['user_id']),
      //   email: data['email'],
      //   name: data['name'],
      // );

      pinTransaksi = data['pin_transaksi'];

      usernameUser = data['user_id'];

      // user = usernya;
      idUser = data['user_id'];
      global.formatedBalance = data['saldo'];
      global.formatedBalance = global.formatedBalance
          .substring(0, global.formatedBalance.length - 3);
      nama = data['name'];
      norek = data['no_rekening'].toString();
      alamatUser = data['alamat_nasabah'];
      nohapeAktif = data['nohape'];

      sudahVerifikasi = true;

      idKomunitas = data['komunitas_id'];
      idGrup = data['grup_id'];
      idAktor = data['aktor_id'];

      namaKomunitas = data['nama_komunitas'];
      alamatKomunitas = data['alamat'];
      teleponKomunitas = data['telepon'];

      statusPayLater = data['status_paylater'];
      statusPayLaterUser = data['status_paylater_user'];
      limitPayLater = data['limit_paylater'];
      // limitPayLater = limitPayLater.substring(0, limitPayLater.length - 3);
      saldoPayLaterSekarang = data['saldo_sekarang'];
      // saldoPayLaterSekarang =
      //     saldoPayLaterSekarang.substring(0, saldoPayLaterSekarang.length - 3);
      penggunaanPayLater = limitPayLater - saldoPayLaterSekarang;
      isMinyak = data["isMinyak"];

      token = data["authorisation"]["token"];
      headerJSON = {
        // "Authorization": authVaue64,
        "Accept": "application/json",
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      };

      dataBank['namaBank'] = data['nama_bank'];
      dataBank['norekBank'] = data['norek_bank'];
      dataBank['atasNama'] = data['rekening_atas_nama'];

      if (data['id_toko'] != null) {
        apakahPunyaToko = true;
      }
      setState(() {});

      // if (idGrup == 2) {
      //   getTagihanBaru();
      // }

      //debugPrint(
      // 'nilai formatedBalance adalah = ${formatedBalance.toString()}');

      //debugPrint("======id user $idUser ==========");

      //debugPrint("idAktor adalah = $idAktor");

      // notifyListeners();

    } else {
      setState(() {
        statusAuth = 0;
      });
      //debugPrint('LOGIN Edimu GAGAL');
      // //debugPrint(data.toString());
    }

    // ambilLogin() async {
    //   bool sudahLogin;
    //   SharedPreferences prefs = await SharedPreferences.getInstance();
    //   // widget.model.usernameUser = prefs.getString('noHape');
    //   // widget.model.passwordUser = prefs.getString('password');
    //   widget.model.token = prefs.getString('login');
    //   widget.model.statusAuth = prefs.getInt('statusAuth');

    //   //debugPrint(
    //   // "isi model.usernameUser = ${widget.model.usernameUser.toString()}");
    //   //debugPrint(
    //   // "isi model.passwordUser = ${widget.model.passwordUser.toString()}");
    //   // await Future.delayed(Duration(milliseconds: 1501));

    //   if (widget.model.token == null) {
    //     sudahLogin = false;
    //     Navigator.pushReplacement(
    //       context,
    //       MaterialPageRoute(builder: (context) => loginPage()),
    //     );
    //   } else if (widget.model.statusAuth == 203 ||
    //       widget.model.statusAuth == 200) {
    //     await widget.model.login(tokenroot: widget.model.token);
    //     await widget.model.getLapakLokal(1);
    //     // await widget.model.getDataMinyak();
    //     Navigator.pushReplacement(
    //       context,
    //       MaterialPageRoute(builder: (context) => homePage(widget.model)),
    //     );
    //   }
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.blueAccent,
                  Colors.white,
                ],
              ),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),

                SizedBox(
                  child: Image.asset(
                    'assets/logo.png',
                    fit: BoxFit.contain,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  'Welcome Back You',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),

                const SizedBox(height: 25),

                //username textfield
                MyTextField(
                  controller: usernameController,
                  hintText: 'Username',
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                //password textfield
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),

                const SizedBox(height: 10),

                //forgot password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                // sign in button
                MyButton(
                  onTap: (() async {
                    debugPrint(
                        "============================================================");
                    await login(
                        username: usernameController.text,
                        password: passwordController.text);
//                      Navigator.push(context,
//                          MaterialPageRoute(builder: (context) => root(model)));
                    // if (model.statusAuth == 200) {
                    //   Navigator.pushReplacement(
                    //       context,
                    //       MaterialPageRoute(
                    //           builder: (context) => Pra_Nasabah_Page(model)));
                    //   setState(() {
                    //     childLoginButton = textLogin();
                    //   });
                    // } else
                    debugPrint(
                        "============== fungsi login berhasil dijalankan ================");
                    if (statusAuth == 203 || statusAuth == 200) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    } else {
                      Alert(
                              type: AlertType.error,
                              context: context,
                              title: "Gagal login",
                              desc:
                                  "Masukkan nomor handphone & password yang benar")
                          .show();

                      //debugPrint('sebelum muncul pop-up');

                      // CONTOH DIALOG BAWAAN
                      // showDialog(
                      //     context: context,
                      //     barrierDismissible: true,
                      //     builder: (_) => AlertDialog(
                      //           title: Text('Gagal login'),
                      //           content: Text(
                      //               'Masukkan Nomor handphone & password yang benar'),
                      //         ));
                    }
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => HomePage()));
                  }),
                ),

                const SizedBox(height: 30),

                // sign up
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Don't Have an Account?"),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignUp()));
                      },
                      child: Text(
                        "  Sign Up",
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
