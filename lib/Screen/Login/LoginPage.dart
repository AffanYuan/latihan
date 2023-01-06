import 'package:flutter/material.dart';
import 'package:latihan/components/my_textfield.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  // text editing control
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 50,
              ),

              SizedBox(
                child: Image.asset(
                  'assets/logo.png',
                  fit: BoxFit.contain,
                ),
              ),

              const SizedBox(height: 50),

              //welcome back
              Text(
                'Welcome Back you',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 25),

              //username textfield
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.grey[600]),
                    )
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // or continue
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Or continue with',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ),

                    const SizedBox(height: 25),

                    //username
                    // MyTextField(
                    //   controller:usernameController,
                    //   hintText: 'Username',
                    //   obscureText: false,
                    // ),

                    // const SizedBox(height: 10),

                    // MyTextField(
                    //   controller: passwordController,
                    //   hintText: 'Password',
                    //   obscureText: true,
                    // ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
