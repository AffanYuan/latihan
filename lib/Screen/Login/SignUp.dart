import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:latihan/Screen/Login/KonfirmasiSignUp.dart';
import 'package:flutter/services.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:http/http.dart' as http;

class SignUp extends StatefulWidget {
  String name = "";
  String email = "";
  String nomor = "";
  String password = "";

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  List _dataKomunitas = [];
  int selectedKomunitas = 0;
  String selectedNamaKomunitas = "";
  late String selectedAlamatKomunitas;
  late String selectedTeleponKomunitas;

  void getKomunitas() async {
    final response =
        await http.get(Uri.parse("https://test.edimu.live/api/pradaftar"));
    var listData = json.decode(response.body);
    // debugPrint(listData);
    debugPrint('isi dari var listData = ${listData['komunitas'].toString()}');

    setState(() {
      _dataKomunitas = listData["komunitas"];
    });
    //debugPrint('=========================================');
    //debugPrint('isi dari var _dataKomunitas = ${_dataKomunitas.toString()}');
  }

  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = new TextEditingController();
  final TextEditingController nomorController = new TextEditingController();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController confrimPasswordController =
      new TextEditingController();

  int idGrup = 1;
  bool passwordVisibility = true;

  @override
  void initState() {
    super.initState();
    getKomunitas();
  }

  Widget build(BuildContext context) {
    //nama
    final name = TextFormField(
      autofocus: false,
      controller: nameController,
      keyboardType: TextInputType.name,
      //validator
      onSaved: (value) {
        nameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.account_circle),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Name ex : John Doe',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );

    //Nomor Hp
    final nomor = TextFormField(
      autofocus: false,
      controller: nomorController,
      keyboardType: TextInputType.name,
      //validator
      onSaved: (value) {
        nomorController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.local_phone_rounded),
        contentPadding: EdgeInsets.fromLTRB(50, 15, 50, 15),
        hintText: '0812***',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );

    //E-mail
    final email = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.name,
      //validator
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.mail_rounded),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'example@email.com',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );

    //Password
    final password = TextFormField(
      autofocus: false,
      controller: passwordController,
      obscureText: passwordVisibility,
      keyboardType: TextInputType.name,
      //validator
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key_rounded),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Password',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );

    //ConfirmPassword
    final confirmPassword = TextFormField(
      autofocus: false,
      controller: confrimPasswordController,
      obscureText: passwordVisibility,
      keyboardType: TextInputType.name,
      //validator
      onSaved: (value) {
        confrimPasswordController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key_rounded),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Confrim Password',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );

    //Tombol SignIn
    final signUpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(38),
      color: Colors.black,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        child: Text(
          'Sign Up',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        onPressed: () async {
          if (selectedKomunitas != 0 &&
              emailController.text.isNotEmpty &&
              nameController.text.isNotEmpty &&
              nomorController.text.length > 9 &&
              passwordController.text.length > 7 &&
              passwordController.text == confrimPasswordController.text) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => KonfirmasiSignUp(
                      nomorController.text,
                      nameController.text,
                      emailController.text,
                      passwordController.text,
                      idGrup,
                      selectedKomunitas,
                      selectedNamaKomunitas,
                      selectedAlamatKomunitas,
                      selectedTeleponKomunitas)),
            );
          } else if (nomorController.text.length < 10) {
            Alert(
                    type: AlertType.error,
                    context: context,
                    title: "Masukkan Nomor HP dengan Benar",
                    desc: "Nomor HP tidak valid, Minimal 10 digit")
                .show();
            nomorController.clear();
          } else if (passwordController.text.length < 7) {
            Alert(
                    type: AlertType.error,
                    context: context,
                    title: "Password tidak valid",
                    desc:
                        "Password paling sedikit berisi 8 karakter, silahkan buat password baru")
                .show();
            passwordController.clear();
            confrimPasswordController.clear();
          } else if (passwordController.text !=
              confrimPasswordController.text) {
            Alert(
                    type: AlertType.error,
                    context: context,
                    title: "Password tidak sesuai",
                    desc:
                        'Pastikan "password" dengan "konfirmasi password" yang Anda masukkan sama')
                .show();
            passwordController.clear();
            confrimPasswordController.clear();
          } else {
            Alert(
                    type: AlertType.error,
                    context: context,
                    title: "Pendaftaran Gagal",
                    desc: "Silahkan isi data dengan lengkap")
                .show();
          }
        },
      ),
    );

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
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
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      child: Image.asset(
                        'assets/logo.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    name,
                    SizedBox(
                      height: 20,
                    ),
                    nomor,
                    SizedBox(
                      height: 20,
                    ),
                    email,
                    SizedBox(
                      height: 20,
                    ),
                    password,
                    SizedBox(
                      height: 20,
                    ),
                    confirmPassword,
                    SizedBox(
                      height: 20,
                    ),
                    dropdownKomunitas(),
                    SizedBox(
                      height: 20,
                    ),
                    ToggleSwitch(
                      minWidth: 150.0,
                      cornerRadius: 20.0,
                      activeBgColors: [
                        [Colors.green[800]!],
                        [Colors.red[800]!]
                      ],
                      activeFgColor: Colors.white,
                      inactiveBgColor: Colors.grey,
                      inactiveFgColor: Colors.white,
                      initialLabelIndex: 1,
                      totalSwitches: 2,
                      labels: ['Nasabah Umum', 'Wali Murid'],
                      radiusStyle: true,
                      onToggle: (index) {
                        if (index == 0) {
                          idGrup = 1;
                          //debugPrint(
                          // 'isi idGrup saat ini adalah = ${idGrup.toString()}');
                          //debugPrint(
                          // "isi index adalah = ${index.toString()}");
                        } else if (index == 1) {
                          idGrup = 2;
                          //debugPrint(
                          // 'isi idGrup saat ini adalah = ${idGrup.toString()}');
                          //debugPrint(
                          // "isi index adalah = ${index.toString()}");
                        }
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    signUpButton,
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget dropdownKomunitas() {
    if (_dataKomunitas != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(Icons.account_balance, color: Colors.grey),
          SizedBox(width: 15),
          Container(
            width: MediaQuery.of(context).size.width * 0.75,
            child: DropdownButton(
              // icon: Icon(Icons.account_balance),

              isExpanded: true,
              hint: Text(
                  selectedNamaKomunitas == ""
                      ? "Pilih Komunitas"
                      : selectedAlamatKomunitas,
                  style: TextStyle(fontWeight: FontWeight.bold)),
              items: _dataKomunitas.map((item) {
                return DropdownMenuItem(
                  child: Text(item['nama_komunitas']),
                  value: item['id'],
                  onTap: () {
                    setState(() {
                      selectedNamaKomunitas = item['nama_komunitas'];
                      selectedKomunitas = item['id'];
                      selectedAlamatKomunitas = item['alamat'];
                      selectedTeleponKomunitas = item['telepon'];
                      setState(() {});
                    });
                  },
                );
              }).toList(),
              onChanged: (value) {},
              // onChanged: (value) {
              //   setState(() {
              //     selectedKomunitas = value;
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
