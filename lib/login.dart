import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/forgot.dart';
import 'package:login/signup.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  signIn() async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email.text, password: password.text);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(children: [
              _loginImage(imgAsset: "./lib/assets/img.png", size: size),
              TextField(
                controller: email,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    hintText: "Email",
                    hintStyle: TextStyle(color: Colors.grey)),
                style: TextStyle(color: Colors.white),
              ),
              TextField(
                controller: password,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: TextStyle(color: Colors.grey),
                ),
                style: TextStyle(color: Colors.white),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 200),
                child: TextButton(
                  onPressed: (() => Get.to(Forgot())),
                  child: const Text(
                    "forgot password?",
                    style: TextStyle(color: Color.fromRGBO(208, 253, 62, 1)),
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
              SizedBox(
                width: size.width * 0.8,
                child: ElevatedButton(
                  onPressed: (() => signIn()),
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(208, 253, 62, 1)),
                ),
              ),
              Text(
                "or",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                width: size.width * 0.8,
                child: ElevatedButton(
                  onPressed: (() => Get.to(Signup())),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(208, 253, 62, 1)),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

Widget _loginImage({required String imgAsset, required size}) {
  return Stack(
    children: [
      Image.asset(
        imgAsset,
        height: size.height * 0.6,
        fit: BoxFit.cover,
      ),
    ],
  );
}
