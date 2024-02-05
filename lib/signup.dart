import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/wrapper.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController rePassword = TextEditingController();
  String error = "";

  signUp() async {
    if (rePassword.text == password.text && _isPasswordValid(password.text)) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text, password: password.text);
      Get.offAll(Wrapper());
    } else {
      setState(() {
        error = "Password requied: 8 characters, alphanumericals";
      });
    }
  }

  bool _isPasswordValid(String password) {
    return password.length >= 8 &&
        RegExp(r'[a-zA-Z]').hasMatch(password) &&
        RegExp(r'[0-9]').hasMatch(password);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          "Sign-Up",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(children: [
            _signUpImage(
                imgAsset: './lib/assets/img.png',
                size: size,
                text: "hello rookies"),
            TextField(
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(color: Colors.white),
              controller: email,
              decoration: InputDecoration(
                  hintText: "Enter Email",
                  hintStyle: TextStyle(color: Colors.grey)),
            ),
            TextField(
              controller: password,
              style: TextStyle(color: Colors.white),
              obscureText: true,
              decoration: InputDecoration(
                  hintText: "Enter Password",
                  hintStyle: TextStyle(color: Colors.grey)),
            ),
            Text(
              error,
              style: TextStyle(color: Colors.red),
            ),
            TextField(
              style: TextStyle(color: Colors.white),
              controller: rePassword,
              obscureText: true,
              decoration: InputDecoration(
                  hintText: "Re-Enter Password",
                  hintStyle: TextStyle(color: Colors.grey)),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            SizedBox(
              width: size.width * 0.8,
              child: ElevatedButton(
                onPressed: (() => signUp()),
                child: Text("Sign-up"),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(208, 253, 62, 1)),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

Widget _signUpImage(
    {required String imgAsset, required size, required String text}) {
  return Stack(
    children: [
      Image.asset(
        imgAsset,
        height: size.height * 0.55,
        fit: BoxFit.cover,
      ),
      Positioned(
        bottom: 0,
        top: size.height * 0.4,
        child: Container(
          height: size.height * 0.4,
          width: size.width,
          child: Text(
            text.toUpperCase(),
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 40),
            textAlign: TextAlign.left,
          ),
        ),
      ),
    ],
  );
}
