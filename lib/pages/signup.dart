import 'package:chatapp/widgets/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../authentication.dart';
import '../home.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController email = TextEditingController();
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              Positioned(
                  child: Image.asset(
                'assets/images/signup_top.png',
                width: MediaQuery.of(context).size.width * 0.3,
              )),
              Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset(
                  "assets/images/login_bottom.png",
                  width: MediaQuery.of(context).size.width * 0.3,
                ),
              ),
              Positioned(
                  bottom: 0,
                  left: 0,
                  child: Image.asset(
                    "assets/images/main_bottom.png",
                    width: MediaQuery.of(context).size.width * 0.3,
                  )),
              SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        "Sign Up",
                        style: TextStyle(
                          letterSpacing: 1.2,
                          fontSize: MediaQuery.textScaleFactorOf(context) * 23,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Image.asset(
                        "assets/images/signup.png",
                        width: size.width,
                        fit: BoxFit.scaleDown,
                        height: size.height * 0.4,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.08,
                          // vertical: size.width * 0.05
                        ),
                        child: Column(
                          children: [
                            InputField(
                              controller: username,
                              lable: "User Name",
                              myicon: Icons.account_circle_outlined,
                            ),
                            SizedBox(
                              height: size.height * 0.025,
                            ),
                            InputField(
                                controller: email,
                                lable: "Email",
                                myicon: Icons.account_circle),
                            SizedBox(
                              height: size.height * 0.025,
                            ),
                            InputField(
                              myicon: Icons.lock,
                              controller: password,
                              lable: "Password",
                            ),
                            SizedBox(
                              height: size.height * 0.025,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(32.0)),
                                  fixedSize: Size(
                                      size.width - size.width * 0.08,
                                      size.height * 0.07)),
                              onPressed: () {
                                signup(email.text, password.text, context);
                                if (FirebaseAuth.instance.currentUser != null) {
                                  // wrong call in wrong place!
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) => Home()));
                                }
                              },
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize:
                                      MediaQuery.of(context).textScaleFactor *
                                          19,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.025,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Do not have an Account?",
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: MediaQuery.of(context)
                                                .textScaleFactor *
                                            15)),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute<void>(
                                            builder: (BuildContext context) =>
                                                SignUpPage(),
                                          ));
                                    },
                                    child: Text("Sign Up",
                                        style: TextStyle(
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontSize: MediaQuery.of(context)
                                                    .textScaleFactor *
                                                17)))
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
