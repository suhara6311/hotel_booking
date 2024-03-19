import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hotel_booking/authentication/create_account.dart';
import 'package:hotel_booking/authentication/create_info.dart';
import 'package:hotel_booking/authentication/log_in.dart';
import 'package:hotel_booking/constants/color_page.dart';
import 'package:hotel_booking/constants/image_page.dart';
import 'package:hotel_booking/navigation/home_page.dart';
import 'package:hotel_booking/navigation/navigation_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class signIn extends StatefulWidget {
  const signIn({super.key});

  @override
  State<signIn> createState() => _signInState();
}


User? user;

class _signInState extends State<signIn> {
  signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    user = userCredential.user!;
    email = user!.email!;
    name = user!.displayName;
    image = user!.photoURL;
    var data = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: email)
        .get();
    if (data.docs.isEmpty) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => createInfo(
              signin: true,
            ),
          ));
    } else {
      if (data.docs[0]['block'] == true) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("This email has blocked",
                style: TextStyle(
                    fontSize: width * 0.05, fontWeight: FontWeight.w600)),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Ok",
                    style: TextStyle(
                        fontWeight: FontWeight.w600, fontSize: width * 0.05),
                  ))
            ],
          ),
        );
        return;
      } else {
        Navigator.pushAndRemoveUntil(
            context,
            CupertinoPageRoute(
              builder: (context) => navigationPage(),
            ),
            (route) => false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPage.thirdColor,
      appBar: AppBar(
        backgroundColor: colorPage.thirdColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: () {
                GoogleSignIn().signOut();
              },
              child: Container(
                height: width * 0.4,
                width: width * 1,
                // color: Colors.red,
                child: Text("Let’s you in",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: colorPage.secondaryColor,
                        fontWeight: FontWeight.w700,
                        fontSize: width * 0.12)),
              ),
            ),
            SizedBox(
              height: width * 0.17,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: width * 0.13,
                  width: width * 0.8,
                  // color: Colors.black,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width * 0.02),
                      border: Border.all(color: colorPage.forthColor)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(imagePage.Facebk),
                      SizedBox(
                        width: width * 0.03,
                      ),
                      Text(
                        "Continue with Facebook",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: colorPage.secondaryColor,
                            fontWeight: FontWeight.w800,
                            fontSize: width * 0.037),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: width * 0.04,
                ),
                InkWell(
                  onTap: () {
                    signInWithGoogle();
                  },
                  child: Container(
                    height: width * 0.13,
                    width: width * 0.8,
                    // color: Colors.black,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width * 0.02),
                        border: Border.all(color: colorPage.forthColor)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(imagePage.Google),
                        SizedBox(
                          width: width * 0.03,
                        ),
                        Text(
                          "Continue with Google",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: colorPage.secondaryColor,
                              fontWeight: FontWeight.w800,
                              fontSize: width * 0.037),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: width * 0.05,
                ),
                Container(
                  height: width * 0.13,
                  width: width * 0.8,
                  // color: Colors.black,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width * 0.02),
                      border: Border.all(color: colorPage.forthColor)),
                  child: Padding(
                    padding: EdgeInsets.all(width * 0.025),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(imagePage.vector),
                        SizedBox(
                          width: width * 0.03,
                        ),
                        Text(
                          "Continue with Apple",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: colorPage.secondaryColor,
                              fontWeight: FontWeight.w800,
                              fontSize: width * 0.037),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: width * 0.09,
                ),
                Row(children: <Widget>[
                  Expanded(
                      child: Divider(
                    indent: width * 0.03,
                    endIndent: width * 0.03,
                    thickness: width * 0.0038,
                    color: colorPage.forthColor,
                  )),
                  Text("or",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: colorPage.seveteenth)),
                  Expanded(
                    child: Divider(
                      indent: width * 0.03,
                      endIndent: width * 0.03,
                      color: colorPage.forthColor,
                      thickness: width * 0.0038,
                    ),
                  ),
                ]),
                SizedBox(
                  height: width * 0.07,
                ),
                Padding(
                  padding: EdgeInsets.all(width * 0.07),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => logIn()));
                    },
                    child: Container(
                      height: width * 0.13,
                      width: width * 0.8,
                      // color: Colors.black,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width * 0.08),
                        color: colorPage.primaryColor,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 5,
                              color: colorPage.secondaryColor.withOpacity(0.25),
                              spreadRadius: 0,
                              offset: Offset(0, 4)),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(width * 0.035),
                        child: Text("Sign in with password",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: width * 0.039,
                                color: colorPage.thirdColor,
                                fontWeight: FontWeight.w600)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: width * 0.01,
                ),
                Padding(
                  padding: EdgeInsets.all(width * 0.09),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don’t have an account?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: width * 0.034,
                              color: colorPage.fifteenth)),
                      SizedBox(
                        height: width * 0.09,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => createInfo(signin: false),
                              ));
                        },
                        child: Text(
                          " Sign up",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: width * 0.038,
                              color: colorPage.primaryColor),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
