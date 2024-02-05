import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Forgot extends StatefulWidget {
  const Forgot({super.key});

  @override
  State<Forgot> createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {
  TextEditingController email = TextEditingController();
  reset() async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email.text);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        // title: Text("Forgot Password"),
        backgroundColor: Colors.transparent,
      ),
      // body: Padding(
      //   padding: const EdgeInsets.all(20.0),
      //   child: Column(children: [
      //     TextField(
      //       controller: email,
      //       decoration: InputDecoration(hintText: "Enter Email"),
      //     ),
      //     ElevatedButton(onPressed: (() => reset()), child: Text("Send Link"))
      //   ]),
      // ),

      body: Container(
        width: size.width,
        height: size.height,
        padding: EdgeInsets.only(
          top: size.height * 0.06,
          left: size.width * 0.03,
          right: size.width * 0.05,
          bottom: size.height * 0.03,
        ),
        child: Column(
          children: [
            Text(
              'Forgot Password?'.toUpperCase(),
              style: TextStyle(
                color: Colors.white,
                fontSize: size.width * 0.07,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Text(
              'Enter your email address below or \n login with another account',
              style: TextStyle(
                color: Colors.white,
                fontSize: size.width * 0.04,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Email',
                  hintStyle: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: size.width * 0.04,
                  ),
                  fillColor: Colors.grey.shade800,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.grey.shade800,
                    ),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Spacer(),
            SizedBox(
              height: size.height * 0.02,
            ),
            Container(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: (() => reset()),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(208, 253, 62, 1),
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.3,
                    vertical: size.height * 0.02,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: Text(
                  'Send',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: size.width * 0.04,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
