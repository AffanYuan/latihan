import 'package:flutter/material.dart';
import 'package:latihan/main.dart';
import 'package:latihan/Screen/Login/LoginPage.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = new TextEditingController();
  final TextEditingController nomorController = new TextEditingController();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController confrimPasswordController =
      new TextEditingController();
  // final TextEditingController usernameController = new TextEditingValue();

  bool passwordVisibility = true;

  @override
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
        emailController.text = value!;
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
        emailController.text = value!;
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
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginPage()));
        },
        child: Text(
          'Sign Up',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
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
}
