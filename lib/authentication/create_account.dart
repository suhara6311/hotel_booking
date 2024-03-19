import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_booking/authentication/create_info.dart';
import 'package:hotel_booking/authentication/sign_in.dart';
import 'package:hotel_booking/constants/color_page.dart';
import 'package:hotel_booking/constants/image_page.dart';
import 'package:hotel_booking/navigation/navigation_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

String? name;
String? email;
String? password;
String? image;
String? userId;
String? currentUsersStatus;

class createAccount extends StatefulWidget {
  const createAccount({
    super.key,
    required this.email,
  });
  final String email;

  @override
  State<createAccount> createState() => _createAccountState();
}

class _createAccountState extends State<createAccount> {
  TextEditingController email_controller = TextEditingController();
  final email_validation =
      RegExp(r"^[a-z0-9.a-z0-9.!#$%&'*+-/=^_{|}~]+@[a-z0-9]+\.[a-z]+");
  TextEditingController password_controller = TextEditingController();
  final password_validation =
      RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}");
  bool password = false;
  final formKey = GlobalKey<FormState>();
  bool tick = false;
  @override
  void initState() {
    email_controller.text = widget.email;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPage.thirdColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colorPage.thirdColor,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: colorPage.secondaryColor,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(width * 0.05),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(width * 0.09),
                  child: Container(
                    height: width * 0.5,
                    width: width * 1,
                    // color: Colors.red,
                    child: Text(
                      "Create your Account",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontWeight: FontWeight.w700, fontSize: width * 0.12),
                    ),
                  ),
                ),
                TextFormField(
                  controller: email_controller,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,
                  readOnly: true,
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: width * 0.05,
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (!email_validation.hasMatch(value!)) {
                      return "please enter valid email address";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                      fillColor: colorPage.sixteenth,
                      filled: true,
                      prefixIcon: Image.asset(imagePage.Message),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(width * 0.03),
                          borderSide: BorderSide(color: colorPage.forthColor)),
                      labelText: "Email",
                      labelStyle: TextStyle(
                          color: colorPage.secondaryColor.withOpacity(0.4),
                          fontWeight: FontWeight.w500,
                          fontSize: width * 0.05),
                      hintText: "please enter your email",
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: width * 0.05),
                      // enabledBorder: OutlineInputBorder(
                      //     borderRadius: BorderRadius.circular(width*0.03),
                      //     borderSide: BorderSide(
                      //         color: colorPage.forthColor
                      //     )
                      // ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(width * 0.03),
                          borderSide: BorderSide(color: colorPage.forthColor))),
                ),
                SizedBox(
                  height: width * 0.06,
                ),
                TextFormField(
                  controller: password_controller,
                  obscureText: password ? false : true,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: width * 0.05,
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (!password_validation.hasMatch(value!)) {
                      return "password incorrect format\n"
                          "your password must contain\n"
                          "one capitel letter and one small letter\n"
                          "one number and a symbol\n"
                          "contain 8 character";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                      fillColor: colorPage.sixteenth,
                      filled: true,
                      prefixIcon: InkWell(
                        onTap: () {
                          password = !password;
                          setState(() {});
                        },
                        child: Icon(
                            password ? Icons.visibility : Icons.visibility_off),
                        highlightColor: colorPage.secondaryColor,
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: colorPage.forthColor,
                          ),
                          borderRadius: BorderRadius.circular(width * 0.03)),
                      labelText: "Password",
                      labelStyle: TextStyle(
                          color: colorPage.secondaryColor.withOpacity(0.4),
                          fontWeight: FontWeight.w500,
                          fontSize: width * 0.05),
                      hintText: "please enter your password",
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: width * 0.05),
                      // enabledBorder: OutlineInputBorder(
                      //     borderRadius: BorderRadius.circular(width*0.03),
                      //     borderSide: BorderSide(
                      //         color: colorPage.forthColor
                      //     )
                      // ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(width * 0.03),
                          borderSide: BorderSide(color: colorPage.forthColor))),
                ),
                SizedBox(
                  height: width * 0.06,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //    Checkbox(
                //      activeColor: colorPage.primaryColor,
                //        shape: RoundedRectangleBorder(
                //          borderRadius: BorderRadius.circular(width*0.015),
                //          side: BorderSide(
                //            color: colorPage.primaryColor
                //          )
                //        ),
                //        value: tick,
                //        onChanged: (value) {
                //          setState(() {
                //            tick=value!;
                //          });
                //        },),
                //     Text("Remember me",
                //     style: TextStyle(
                //       color: colorPage.secondaryColor,
                //       fontSize: width*0.045,
                //       fontWeight: FontWeight.w900
                //     ),)
                //   ],
                // ),
                SizedBox(
                  height: width * 0.12,
                ),
                InkWell(
                  onTap: () async {
                    if (password_controller.text != ""
                        // formKey.currentState!.validate()
                        ) {
                      var data = await FirebaseFirestore.instance
                          .collection('users')
                          .where('email', isEqualTo: email_controller.text)
                          .get();
                      if(data.docs.isNotEmpty){
                        userId=data.docs[0]["id"];
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        prefs.setString("loginUserId", data.docs[0]["id"]);
                      }
                      if (data.docs[0]['google'] == true) {
                        if (data.docs[0]['password'] ==
                            password_controller.text) {
                          if(data.docs[0]['block']==true){
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text("This email has blocked",style: TextStyle(
                                    fontSize: width*0.05,
                                    fontWeight: FontWeight.w600
                                )),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("Ok",style:
                                      TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: width*0.05
                                      ),))
                                ],
                              ),);
                            return;
                          }else{
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => navigationPage(),
                                ),
                                    (route) => false);
                          }
                        }else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Incorrect Password :(")));
                        }
                      }else{
                        FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                            email: email_controller.text,
                            password: password_controller.text)
                            .then((value) async {
                              if(
                              data.docs.isEmpty
                              ){
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text("No user found")));
                              }else{
                                String password = data.docs[0]['password'];
                                if(
                                password_controller.text == password
                                ){
                                  SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                                  prefs.setString("loginUserId", data.docs[0]['id']);
                                  // prefs.setString("image", data.docs[0]['image']);
                                  // prefs.setString("email", data.docs[0]['email']);
                                  // prefs.setString("password", data.docs[0]['password']);
                                  prefs.setString("id", data.docs[0]['id']);
                                  prefs.setBool("login", true);
                                  name = data.docs[0]['name'];
                                  email = data.docs[0]['email'];
                                  password = data.docs[0]['password'];
                                  image = data.docs[0]['image'];
                                  if(data.docs[0]['block']==true){
                                    showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          title: Text("This email has blocked",style: TextStyle(
                                            fontSize: width*0.05,
                                            fontWeight: FontWeight.w600
                                          )),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text("Ok",style:
                                                  TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: width*0.05
                                                  ),))
                                          ],
                                        ),);
                                    return;
                                  }
                                  else{
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => navigationPage(),
                                        ));
                                  }
                                }else{
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text("Incorrect password")));
                                }
                              }
                        }).catchError((error) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text(error.code)));
                        });
                      }
                    } else {
                      // email_controller.text == ""
                      //     ? ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      //         content: Text("please enter your email!"),
                      //       ))
                      //     : password_controller.text == ""
                      //         ? ScaffoldMessenger.of(context).showSnackBar(
                      //             SnackBar(
                      //                 content:
                      //                     Text("please enter your password!")))
                      //         : ScaffoldMessenger.of(context)
                      //             .showSnackBar(SnackBar(
                      //             content:
                      //                 Text("please enter your valid details"),
                      //           ));
                      email_controller.text.isEmpty
                          ? ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("please enter username")))
                          : ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("please enter password")));
                    }
                  },
                  child: Container(
                    height: width * 0.14,
                    width: width * 0.76,
                    // color: Colors.red,
                    child: Padding(
                      padding: EdgeInsets.all(width * 0.03),
                      child: Text("Sign up",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: colorPage.thirdColor,
                              fontWeight: FontWeight.w700,
                              fontSize: width * 0.049)),
                    ),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: colorPage.secondaryColor.withOpacity(0.25),
                              blurRadius: 5,
                              spreadRadius: 0,
                              offset: Offset(0, 4))
                        ],
                        borderRadius: BorderRadius.circular(width * 0.07),
                        color: colorPage.primaryColor),
                  ),
                ),
                SizedBox(
                  height: width * 0.1,
                ),
                // Row(children: <Widget>[
                //   Expanded(
                //       child: Divider(
                //     indent: width * 0.03,
                //     endIndent: width * 0.03,
                //     thickness: width * 0.0038,
                //     color: colorPage.forthColor,
                //   )),
                //   Text("or continue with",
                //       style: TextStyle(
                //           color: colorPage.seveteenth,
                //           fontWeight: FontWeight.w600,
                //           fontSize: 16)),
                //   Expanded(
                //     child: Divider(
                //       indent: width * 0.03,
                //       endIndent: width * 0.03,
                //       color: colorPage.forthColor,
                //       thickness: width * 0.0038,
                //     ),
                //   ),
                // ]),
                // SizedBox(
                //   height: width * 0.06,
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [
                //     Container(
                //         height: width * 0.14,
                //         width: width * 0.2,
                //         decoration: BoxDecoration(
                //             color: colorPage.thirdColor,
                //             border: Border.all(color: colorPage.eighthColor),
                //             borderRadius: BorderRadius.circular(width * 0.04)),
                //         // color: Colors.red,
                //         child: Image.asset(imagePage.Facebk)),
                //     Container(
                //         height: width * 0.14,
                //         width: width * 0.2,
                //         // color: Colors.red,
                //         decoration: BoxDecoration(
                //             color: colorPage.thirdColor,
                //             border: Border.all(color: colorPage.eighthColor),
                //             borderRadius: BorderRadius.circular(width * 0.04)),
                //         child: Image.asset(imagePage.Google)),
                //     Container(
                //       height: width * 0.14,
                //       width: width * 0.2,
                //       // color: Colors.red,
                //       decoration: BoxDecoration(
                //           color: colorPage.thirdColor,
                //           border: Border.all(color: colorPage.eighthColor),
                //           borderRadius: BorderRadius.circular(width * 0.04)),
                //       child: Center(
                //         child: SvgPicture.asset(
                //           imagePage.vector,
                //           height: width * 0.08,
                //           width: width * 0.08,
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                // SizedBox(
                //   height: width * 0.03,
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Text("Don’t have an account?",
                //         textAlign: TextAlign.center,
                //         style: TextStyle(
                //             fontWeight: FontWeight.w500,
                //             fontSize: width*0.034,
                //             color: colorPage.fifteenth
                //         )),
                //     SizedBox(height: width*0.09,),
                //     Text("Sign up",
                //       textAlign: TextAlign.center,
                //       style: TextStyle(
                //           fontWeight: FontWeight.w600,
                //           fontSize: width*0.038,
                //           color: colorPage.primaryColor
                //       ),)
                //   ],
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
