import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_booking/authentication/create_account.dart';
import 'package:hotel_booking/constants/color_page.dart';
import 'package:hotel_booking/constants/image_page.dart';
import 'package:hotel_booking/navigation/navigation_page.dart';

import '../main.dart';

class editProfile extends StatefulWidget {
  const editProfile(
      {super.key,
      required this.id,
      required this.name,
      required this.nickname,
      required this.dob,
      required this.email,
      required this.phonenumber,
      required this.gender});
  final String id;
  final String name;
  final String nickname;
  final String dob;
  final String email;
  final String phonenumber;
  final String gender;

  @override
  State<editProfile> createState() => _editProfileState();
}

class _editProfileState extends State<editProfile> {
  TextEditingController Fullname_Controller = TextEditingController();
  TextEditingController Nickname_Controller = TextEditingController();
  TextEditingController Dateofbirth_Controller = TextEditingController();
  TextEditingController email_controller = TextEditingController();
  final email_validation =
      RegExp(r"^[a-z0-9.a-z0-9.!#$%&'*+-/=^_{|}~]+@[a-z0-9]+\.[a-z]+");
  TextEditingController number_controller = TextEditingController();
  final phone_validation = RegExp(r"[0-9]{10}");
  final formKey = GlobalKey<FormState>();
  String? dropdownvalue;
  var listItems = [
    "Male",
    "Female",
    "Others",
  ];
  bool tick = false;
  var countryCode;
  @override
  void initState() {
    Fullname_Controller.text=widget.name;
    Nickname_Controller.text=widget.nickname;
    Dateofbirth_Controller.text=widget.dob;
    email_controller.text=widget.email;
    if(widget.phonenumber.length == 13){
      number_controller.text=widget.phonenumber.substring(3,13);
    }
    dropdownvalue=widget.gender;
    // TODO: implement initState
    super.initState();
  }
  @override
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
              "Edit Profile",
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: width * 1.52,
                width: width * 1,
                // color: Colors.black,
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextFormField(
                        controller: Fullname_Controller,
                        // textCapitalization: TextCapitalization.sentences,
                        keyboardType: TextInputType.multiline,
                        textInputAction: TextInputAction.done,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: width * 0.05),
                        decoration: InputDecoration(
                            fillColor: colorPage.sixteenth,
                            filled: true,
                            labelText: "Full Name",
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: width * 0.05,
                                color: colorPage.secondaryColor),
                            hintText: "please your name",
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: width * 0.05),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: colorPage.forthColor),
                              borderRadius: BorderRadius.circular(width * 0.03),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(width * 0.03),
                                borderSide:
                                    BorderSide(color: colorPage.ninthColor))),
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
                              fontWeight: FontWeight.w500,
                              fontSize: width * 0.05),
                          decoration: InputDecoration(
                              fillColor: colorPage.sixteenth,
                              filled: true,
                              labelText: "Nickname",
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: width * 0.05,
                                  color: colorPage.secondaryColor),
                              hintText: "please your Nickname",
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: width * 0.05),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: colorPage.forthColor),
                                borderRadius:
                                    BorderRadius.circular(width * 0.03),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(width * 0.03),
                                  borderSide: BorderSide(
                                      color: colorPage.ninthColor)))),
                      SizedBox(
                        height: width * 0.03,
                      ),
                      TextFormField(
                        controller: Dateofbirth_Controller,
                        keyboardType: TextInputType.datetime,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: width * 0.05,
                        ),
                        decoration: InputDecoration(
                            fillColor: colorPage.sixteenth,
                            filled: true,
                            suffixIcon: Image.asset(
                              imagePage.date,
                            ),
                            labelText: "Date of Birth",
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: width * 0.05,
                                color: colorPage.secondaryColor),
                            hintText: "please your Date of Birth",
                            hintStyle: TextStyle(
                                fontSize: width * 0.05,
                                fontWeight: FontWeight.w500),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: colorPage.forthColor),
                              borderRadius: BorderRadius.circular(width * 0.03),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(width * 0.03),
                                borderSide:
                                    BorderSide(color: colorPage.ninthColor))),
                      ),
                      SizedBox(
                        height: width * 0.03,
                      ),
                      TextFormField(
                        controller: email_controller,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.done,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
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
                            suffixIcon: Image.asset(imagePage.Message),
                            labelText: "Email",
                            labelStyle: TextStyle(
                                color: colorPage.secondaryColor,
                                fontWeight: FontWeight.w500,
                                fontSize: width * 0.05),
                            hintText: "please enter your email",
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: width * 0.05),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(width * 0.03),
                                borderSide:
                                    BorderSide(color: colorPage.forthColor)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(width * 0.03),
                                borderSide:
                                    BorderSide(color: colorPage.ninthColor))),
                      ),
                      SizedBox(
                        height: width * 0.03,
                      ),
                      TextFormField(
                        controller: number_controller,
                        // maxLength: 10,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
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
                            prefixIcon: CountryCodePicker(
                              onChanged: (value) {
                                countryCode = value;
                              },
                              initialSelection: widget.phonenumber.toString().substring(0,3),
                              onInit: (value) {
                                countryCode = value;
                              },
                              showOnlyCountryWhenClosed: true,
                              showDropDownButton: true,
                              hideMainText: true,
                            ),
                            labelText: "Phone Number",
                            labelStyle: TextStyle(
                                color: colorPage.secondaryColor,
                                fontSize: width * 0.05,
                                fontWeight: FontWeight.w500),
                            hintText: "please your number",
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: width * 0.05),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(width * 0.03),
                                borderSide:
                                    BorderSide(color: colorPage.forthColor)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: colorPage.ninthColor),
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
                              fontWeight: FontWeight.w400),
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
                height: width * 0.2,
              ),
              Padding(
                padding: EdgeInsets.all(width * 0.07),
                //
                child: InkWell(
                  onTap: () {
                    if (Fullname_Controller.text != "" &&
                        Nickname_Controller.text != "" &&
                        Dateofbirth_Controller.text != "" &&
                        number_controller.text != "" &&
                        email_controller.text != "" &&
                        formKey.currentState!.validate()) {
                      FirebaseFirestore.instance.collection("users").doc(widget.id).update({
                        "dob" : Dateofbirth_Controller.text,
                        "email" : email_controller.text,
                        "name" : Fullname_Controller.text,
                        "nickname" : Nickname_Controller.text,
                        "gender" : dropdownvalue,
                        "phonenumber" : countryCode.toString()+number_controller.text,
                      });
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => navigationPage(),), (route) => false);
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
                                      : email_controller.text == ""
                                          ? ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                              content: Text(
                                                  "please enter your email!"),
                                            ))
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
                        color: colorPage.primaryColor,
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 0,
                              blurRadius: 5,
                              offset: Offset(0, 4),
                              color: colorPage.secondaryColor.withOpacity(0.25))
                        ]),
                    child: Padding(
                      padding: EdgeInsets.all(width * 0.035),
                      child: Text("Update",
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
