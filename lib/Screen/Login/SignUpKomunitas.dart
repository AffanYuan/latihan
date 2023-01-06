import 'package:flutter/material.dart';
import 'package:latihan/main.dart';

class SignUpKomunitas extends StatefulWidget {
  const SignUpKomunitas({Key? key}) : super(key: key);

  @override
  _SignUpKomunitasState createState() => _SignUpKomunitasState();
}

class _SignUpKomunitasState extends State<SignUpKomunitas> {
  @override
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = new TextEditingController();
  final TextEditingController komunitasController = new TextEditingController();

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

    //E-mail
    final komunitas = TextFormField(
      autofocus: false,
      controller: komunitasController,
      keyboardType: TextInputType.name,
      //validator
      onSaved: (value) {
        komunitasController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: 'example@email.com',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    name,
                    SizedBox(
                      height: 20,
                    ),
                    komunitas,
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
