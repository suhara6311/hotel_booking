import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_booking/authentication/create_account.dart';
import 'package:hotel_booking/authentication/log_in.dart';
import 'package:hotel_booking/authentication/sign_in.dart';
import 'package:hotel_booking/constants/color_page.dart';
import 'package:hotel_booking/constants/image_page.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
var userid;
class createInfo extends StatefulWidget {
  // final String email;
  const createInfo({super.key, required this.signin});
  final bool signin;

  @override
  State<createInfo> createState() => _createInfoState();
}

class _createInfoState extends State<createInfo> {
  TextEditingController Fullname_Controller = TextEditingController();
  TextEditingController Nickname_Controller = TextEditingController();
  TextEditingController Dateofbirth_Controller = TextEditingController();
  TextEditingController email_controller = TextEditingController();
  final email_validation =
      RegExp(r"^[a-z0-9.a-z0-9.!#$%&'*+-/=^_{|}~]+@[a-z0-9]+\.[a-z]+");
  TextEditingController password_controller = TextEditingController();
  final password_validation =
      RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}");
  bool password = false;
  TextEditingController number_controller = TextEditingController();
  final phone_validation = RegExp(r"[0-9]{10}");
  var countryCode;
  final formKey = GlobalKey<FormState>();
  String? dropdownvalue;
  var listItems = [
    "Male",
    "Female",
    "Others",
  ];
  bool tick = false;
  bool Gender = false;
  String imageUrl = "";
  bool loading = false;
  File? file;
  pickfile(ImageSource) async {
    final imagefile = await ImagePicker.platform.pickImage(source: ImageSource);
    file = File(imagefile!.path);
    if (mounted) {
      setState(() {
        file = File(imagefile!.path);
        Navigator.pop(context);
      });
      uploadFile();
    }
  }

  uploadFile() async {
    setState(() {
      loading = true;
    });
    var uploadTask = await FirebaseStorage.instance
        .ref('uploads')
        .child(DateTime.now().toString())
        .putFile(file!, SettableMetadata(contentType: "image/jpeg"));
    var getUrl = await uploadTask.ref.getDownloadURL();

    imageUrl = getUrl;
    loading = false;
    setState(() {});
  }

  @override
  void initState() {
    if (widget.signin == true) {
      email_controller.text = user!.email.toString();
      Fullname_Controller.text = user!.displayName.toString();
      imageUrl = user!.photoURL.toString();
    }
    // TODO: impement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPage.thirdColor,
      appBar: AppBar(
        backgroundColor: colorPage.thirdColor,
        elevation: 0,
        toolbarHeight: width * 0.25,
        leadingWidth: width * 0.5,
        leading: Row(
          children: [
            SizedBox(
              width: width * 0.02,
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: colorPage.secondaryColor,
              ),
            ),
            SizedBox(
              width: width * 0.02,
            ),
            Text(
              "Fill Your Profile",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: width * 0.06,
                  color: colorPage.secondaryColor),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(width * 0.03),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: width * 1.9,
                width: width * 1,
                // color: Colors.black,
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Center(
                        child: loading
                            ? CircularProgressIndicator()
                            : Container(
                                height: width * 0.4,
                                width: width * 0.4,
                                child: Stack(
                                  children: [
                                    CircleAvatar(
                                      radius: width * 0.18,
                                      backgroundImage: NetworkImage(imageUrl),
                                    ),
                                    Positioned(
                                      top: width * 0.28,
                                      left: width * 0.25,
                                      child: InkWell(
                                        onTap: () {
                                          showModalBottomSheet(
                                            backgroundColor: colorPage
                                                .secondaryColor
                                                .withOpacity(0),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(
                                                      width * 0.08),
                                                  topLeft: Radius.circular(
                                                      width * 0.08)),
                                            ),
                                            constraints: BoxConstraints(
                                                maxHeight: width * 0.7,
                                                maxWidth: width * 1),
                                            context: context,
                                            isDismissible: false,
                                            builder: (context) {
                                              return Container(
                                                height: width * 0.6,
                                                width: width * 1,
                                                // color: Colorpage.black.withOpacity(0),
                                                // margin: EdgeInsets.all(w*0.04),
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      height: width * 0.27,
                                                      width: width * 1,
                                                      margin: EdgeInsets.all(
                                                          width * 0.03),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      width *
                                                                          0.03),
                                                          color: colorPage
                                                              .thirdColor),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          InkWell(
                                                            onTap: () {
                                                              pickfile(
                                                                  ImageSource
                                                                      .gallery);
                                                            },
                                                            child: Text(
                                                              "Photo Gallery",
                                                              style: TextStyle(
                                                                  color: colorPage
                                                                      .ninthColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontSize:
                                                                      width *
                                                                          0.05),
                                                            ),
                                                          ),
                                                          Divider(
                                                            color: colorPage
                                                                .secondaryColor
                                                                .withOpacity(
                                                                    0.15),
                                                          ),
                                                          InkWell(
                                                            onTap: () {
                                                              pickfile(
                                                                  ImageSource
                                                                      .camera);
                                                            },
                                                            child: Text(
                                                              "Camera",
                                                              style: TextStyle(
                                                                fontSize:
                                                                    width *
                                                                        0.05,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: colorPage
                                                                    .ninthColor,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Container(
                                                        height: width * 0.15,
                                                        width: width * 1,
                                                        margin: EdgeInsets.all(
                                                            width * 0.03),
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        width *
                                                                            0.03),
                                                            color: colorPage
                                                                .thirdColor),
                                                        child: Center(
                                                          child: Text("Cancel",
                                                              style: TextStyle(
                                                                  color: colorPage
                                                                      .ninthColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize:
                                                                      width *
                                                                          0.05)),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        child: Container(
                                          height: width * 0.06,
                                          width: width * 0.06,
                                          // color: Colors.red,
                                          child: SvgPicture.asset(
                                              imagePage.pencil),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                      ),
                      TextFormField(
                        controller: Fullname_Controller,
                        // textCapitalization: TextCapitalization.sentences,
                        keyboardType: TextInputType.multiline,
                        textInputAction: TextInputAction.done,
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: width * 0.05),
                        decoration: InputDecoration(
                            fillColor: colorPage.sixteenth,
                            filled: true,
                            labelText: "Full Name",
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: width * 0.05,
                                color:
                                    colorPage.secondaryColor.withOpacity(0.4)),
                            hintText: "please enter your name",
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: width * 0.05),
                            // enabledBorder: OutlineInputBorder(
                            //   borderSide: BorderSide(
                            //     color: colorPage.forthColor
                            //   ),
                            //   borderRadius: BorderRadius.circular(width*0.03),
                            // ),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(width * 0.03),
                                borderSide:
                                    BorderSide(color: colorPage.forthColor)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(width * 0.03),
                                borderSide:
                                    BorderSide(color: colorPage.forthColor))),
                      ),
                      SizedBox(
                        height: width * 0.03,
                      ),
                      TextFormField(
                          controller: Nickname_Controller,
                          // textCapitalization: TextCapitalization.sentences,
                          keyboardType: TextInputType.multiline,
                          textInputAction: TextInputAction.done,
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: width * 0.05),
                          decoration: InputDecoration(
                              fillColor: colorPage.sixteenth,
                              filled: true,
                              labelText: "Nickname",
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: width * 0.05,
                                  color: colorPage.secondaryColor
                                      .withOpacity(0.4)),
                              hintText: "please enter your Nickname",
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: width * 0.05),
                              // enabledBorder: OutlineInputBorder(
                              //   borderSide: BorderSide(
                              //       color: colorPage.forthColor
                              //   ),
                              //   borderRadius: BorderRadius.circular(width*0.03),
                              // ),
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: colorPage.forthColor),
                                  borderRadius:
                                      BorderRadius.circular(width * 0.03)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(width * 0.03),
                                  borderSide: BorderSide(
                                      color: colorPage.forthColor)))),
                      SizedBox(
                        height: width * 0.03,
                      ),
                      TextFormField(
                        controller: Dateofbirth_Controller,
                        keyboardType: TextInputType.datetime,
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: width * 0.05,
                        ),
                        maxLength: 10,
                        decoration: InputDecoration(
                            fillColor: colorPage.sixteenth,
                            filled: true,
                            counterText: "",
                            suffixIcon: Image.asset(
                              imagePage.date,
                            ),
                            labelText: "Date of Birth",
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: width * 0.05,
                                color:
                                    colorPage.secondaryColor.withOpacity(0.4)),
                            hintText: "please enter your Date of Birth",
                            hintStyle: TextStyle(
                                fontSize: width * 0.05,
                                fontWeight: FontWeight.w500),
                            // enabledBorder: OutlineInputBorder(
                            //   borderSide: BorderSide(
                            //     color: colorPage.forthColor
                            //   ),
                            //   borderRadius: BorderRadius.circular(width*0.03),
                            // ),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(width * 0.03),
                                borderSide:
                                    BorderSide(color: colorPage.forthColor)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(width * 0.03),
                                borderSide:
                                    BorderSide(color: colorPage.forthColor))),
                      ),
                      SizedBox(
                        height: width * 0.03,
                      ),
                      TextFormField(
                        //initialValue: widget.email,
                        // readOnly: true,
                        controller: email_controller,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.done,
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: width * 0.05,
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        // validator: (value) {
                        //   if(!email_validation.hasMatch(value!))
                        //   {
                        //     return "please enter valid email address";
                        //   }
                        //   else{
                        //     return null;
                        //   }
                        // },
                        decoration: InputDecoration(
                            fillColor: colorPage.sixteenth,
                            filled: true,
                            suffixIcon: Image.asset(imagePage.Message),
                            labelText: "Email",
                            labelStyle: TextStyle(
                                color:
                                    colorPage.secondaryColor.withOpacity(0.4),
                                fontWeight: FontWeight.w500,
                                fontSize: width * 0.05),
                            hintText: "please enter your email",
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: width * 0.05),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(width * 0.03),
                                borderSide:
                                    BorderSide(color: colorPage.forthColor)),
                            // enabledBorder: OutlineInputBorder(
                            //     borderRadius: BorderRadius.circular(width*0.03),
                            //     borderSide: BorderSide(
                            //         color: colorPage.forthColor
                            //     )
                            // ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(width * 0.03),
                                borderSide:
                                    BorderSide(color: colorPage.forthColor))),
                      ),
                      SizedBox(
                        height: width * 0.03,
                      ),
                      TextFormField(
                        controller: password_controller,
                        obscureText: password ? false : true,
                        keyboardType: TextInputType.multiline,
                        textInputAction: TextInputAction.done,
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: width * 0.05,
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (!password_validation.hasMatch(value!)) {
                            return "password incorrect format";
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
                              child: Icon(password
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              highlightColor: colorPage.secondaryColor,
                            ),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: colorPage.forthColor),
                                borderRadius:
                                    BorderRadius.circular(width * 0.03)),
                            labelText: "Password",
                            labelStyle: TextStyle(
                                color:
                                    colorPage.secondaryColor.withOpacity(0.4),
                                fontWeight: FontWeight.w500,
                                fontSize: width * 0.05),
                            hintText: "please enter your email",
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: width * 0.05),
                            // enabledBorder: OutlineInputBorder(
                            //     borderRadius: BorderRadius.circular(width*0.03),
                            //     borderSide: BorderSide(
                            //         color: colorPage.forthColor
                            //     )
                            // ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(width * 0.03),
                                borderSide:
                                    BorderSide(color: colorPage.forthColor))),
                      ),
                      SizedBox(
                        height: width * 0.03,
                      ),
                      TextFormField(
                        controller: number_controller,
                        maxLength: 10,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: width * 0.05),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (!phone_validation.hasMatch(value!)) {
                            return "please enter valid number";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            fillColor: colorPage.sixteenth,
                            filled: true,
                            counterText: "",
                            prefixIcon: CountryCodePicker(
                              onChanged: (value) {
                                countryCode = value;
                              },
                              initialSelection: "+91",
                              onInit: (value) {
                                countryCode = value;
                              },
                              showOnlyCountryWhenClosed: true,
                              showDropDownButton: true,
                              hideMainText: true,
                            ),
                            labelText: "Phone Number",
                            labelStyle: TextStyle(
                                color:
                                    colorPage.secondaryColor.withOpacity(0.4),
                                fontSize: width * 0.05,
                                fontWeight: FontWeight.w500),
                            hintText: "please your number",
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: width * 0.05),
                            //
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: colorPage.forthColor),
                                borderRadius:
                                    BorderRadius.circular(width * 0.03)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: colorPage.forthColor),
                                borderRadius:
                                    BorderRadius.circular(width * 0.03))),
                      ),
                      SizedBox(
                        height: width * 0.03,
                      ),
                      Container(
                        height: width * 0.14,
                        width: width * 1,
                        padding: EdgeInsets.only(
                            left: width * 0.05, right: width * 0.05),
                        decoration: BoxDecoration(
                            color: colorPage.sixteenth,
                            borderRadius: BorderRadius.circular(width * 0.025),
                            border: Border.all(
                              color: Colors.grey.shade400,
                            )),
                        child: DropdownButton(
                          hint: Text("Gender"),
                          icon: SvgPicture.asset(imagePage.drop),
                          isExpanded: true,
                          underline: SizedBox(),
                          style: TextStyle(
                              color: colorPage.secondaryColor,
                              fontSize: width * 0.05,
                              fontWeight: FontWeight.w900),
                          value: dropdownvalue,
                          items: listItems.map((valueItem) {
                            return DropdownMenuItem(
                                value: valueItem, child: Text(valueItem));
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              dropdownvalue = newValue;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: width * 0.02,
              ),
              Padding(
                padding: EdgeInsets.all(width * 0.07),
                //
                child: InkWell(
                  onTap: () async {
                    if (Fullname_Controller.text != "" &&
                        Nickname_Controller.text != "" &&
                        Dateofbirth_Controller.text != "" &&
                        number_controller.text != "" &&
                        dropdownvalue != null &&
                        email_controller.text != "" &&
                        imageUrl != "" &&
                        password_controller.text != "" &&
                        formKey.currentState!.validate()) {
                      if(widget.signin == true){
                        FirebaseFirestore.instance.collection('users').add({
                          "image": imageUrl,
                          "name": Fullname_Controller.text,
                          "nickname": Nickname_Controller.text,
                          "dob": Dateofbirth_Controller.text,
                          "email": email_controller.text,
                          "password": password_controller.text,
                          "gender": dropdownvalue,
                          "phonenumber": "$countryCode${number_controller.text}",
                          "google": true,
                          "block" : false
                        }).then((value) {
                          value.update({"id": value.id});
                          userId=value.id;

                        });
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => createAccount(
                                email: email_controller.text,
                              ),
                            ));
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.setBool("login", true);
                        prefs.setString("name", userId!);
                      }else{
                        FirebaseAuth.instance.createUserWithEmailAndPassword(
                            email: email_controller.text,
                            password: password_controller.text).then((value) async {
                              FirebaseFirestore.instance.collection('users').add(
                                  {
                                    "image": imageUrl,
                                    "name": Fullname_Controller.text,
                                    "nickname": Nickname_Controller.text,
                                    "dob": Dateofbirth_Controller.text,
                                    "email": email_controller.text,
                                    "password": password_controller.text,
                                    "gender": dropdownvalue,
                                    "phonenumber": "$countryCode${number_controller.text}",
                                    "google": false,
                                    "block" : false
                                  }).then((value) {
                                value.update({"id": value.id});
                                userId=value.id;
                              });
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => createAccount(
                                      email: email_controller.text,
                                    ),
                                  ));
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              //prefs.setBool("login", true);
                              prefs.setString("name", userId!);
                        }).catchError((error) {
                          print(error.toString());
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(error.code)));
                        });
                      }
                    } else {
                      Fullname_Controller.text == ""
                          ? ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("please enter your Fullname!"),
                            ))
                          : Nickname_Controller.text == ""
                              ? ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                  content: Text("please enter your Nickname!"),
                                ))
                              : Dateofbirth_Controller.text == ""
                                  ? ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                      content: Text(
                                          "please enter your Date of birth!"),
                                    ))
                                  : number_controller.text == ""
                                      ? ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                          content:
                                              Text("please enter your number!"),
                                        ))
                                      : dropdownvalue == null
                                          ? ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content: Text(
                                                      "please select Gender")))
                                          : email_controller.text == ""
                                              ? ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                  content: Text(
                                                      "please enter your email!"),
                                                ))
                                              // : password_controller.text == ""
                                              //     ? ScaffoldMessenger.of(
                                              //             context)
                                              //         .showSnackBar(SnackBar(
                                              //             content: Text(
                                              //                 "please enter your password!")))
                                              : ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                  content: Text(
                                                      "please enter your valid details"),
                                                ));
                    }
                  },
                  child: Container(
                    height: width * 0.13,
                    width: width * 0.8,
                    // color: Colors.black,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width * 0.08),
                        color: colorPage.primaryColor),
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
            ],
          ),
        ),
      ),
    );
  }
}
