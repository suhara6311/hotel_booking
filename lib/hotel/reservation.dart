import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking/constants/color_page.dart';
import 'package:hotel_booking/constants/image_page.dart';
import 'package:hotel_booking/hotel/payment1.dart';

import '../Modal/Booking_Modal.dart';
import '../main.dart';

class reservation extends StatefulWidget {
  const reservation({super.key, required this.bookingModal});
  final BookingModal bookingModal;

  @override
  State<reservation> createState() => _reservationState();
}

class _reservationState extends State<reservation> {
  TextEditingController Fullname_Controller=TextEditingController();
  TextEditingController Nickname_Controller=TextEditingController();
  TextEditingController Dateofbirth_Controller=TextEditingController();
  TextEditingController email_controller=TextEditingController();
  final email_validation=RegExp(r"^[a-z0-9.a-z0-9.!#$%&'*+-/=^_{|}~]+@[a-z0-9]+\.[a-z]+");
  TextEditingController number_controller=TextEditingController();
  final phone_validation=RegExp(r"[0-9]{10}");
  final formKey=GlobalKey<FormState>();


  bool mr=false;
  bool mrs=false;
  bool ms=false;

  BookingModal? bookingModal;
@override
  void initState() {

  bookingModal=widget.bookingModal;
  print(bookingModal!.guest.toString());
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
        toolbarHeight: width*0.25,
        leadingWidth: width*0.9,
        leading: Row(
          children: [
            SizedBox(width: width*0.02,),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back,
                color: colorPage.secondaryColor,),
            ),
            SizedBox(width: width*0.02,),
            Text("Name of Reservation",style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: width*0.07,
                color: colorPage.secondaryColor
            ),),
          ],
        ),

      ),
      body: DefaultTabController(
        length: 3,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(width*0.05),
            child: Column(
              children: [
                Material(
                  child: Container(
                    height: width*0.2,
                    color: colorPage.thirdColor,
                    child: TabBar(
                      physics: ClampingScrollPhysics(),
                      padding: EdgeInsets.all(width*0.02),
                      unselectedLabelColor: colorPage.primaryColor,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(width*0.05),
                        // color: colorPage.primaryColor
                      ),
                      tabs: [
                        Tab(
                          child: InkWell(
                            onTap: () {
                              mr=true;
                              mrs=false;
                              ms=false;
                              setState(() {

                              });
                            },
                            child: Container(
                              height: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(width*0.06),
                                color: mr ? colorPage.primaryColor : colorPage.thirdColor,
                                border: Border.all(
                                  color: colorPage.primaryColor
                                ),
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text("Mr.",style: TextStyle(
                                  color: mr ? colorPage.thirdColor : colorPage.primaryColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: width*0.04
                                )
                                ),
                              ),
                            ),
                          ),
                        ),
                        Tab(
                          child: InkWell(
                            onTap: () {
                              mr=false;
                              mrs=true;
                              ms=false;
                              setState(() {

                              });
                            },
                            child: Container(
                              height: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(width*0.06),
                                color: mrs ? colorPage.primaryColor : colorPage.thirdColor,
                                border: Border.all(
                                  color: colorPage.primaryColor
                                ),
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text("Mrs.",style: TextStyle(
                                    color: mrs ? colorPage.thirdColor : colorPage.primaryColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: width*0.04
                                )),
                              ),
                            ),
                          ),
                        ),
                        Tab(
                          child: InkWell(
                            onTap: () {
                              mr=false;
                              mrs=false;
                              ms=true;
                              setState(() {

                              });
                            },
                            child: Container(
                              height: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(width*0.06),
                                color: ms ? colorPage.primaryColor : colorPage.thirdColor,
                                border: Border.all(
                                  color: colorPage.primaryColor
                                ),
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text("Ms.",style: TextStyle(
                                    color: ms ? colorPage.thirdColor : colorPage.primaryColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: width*0.04
                                )),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                      Container(
                        height: width*1.4,
                        width: width*1,
                         // color: Colors.black,
                        child: Form(
                        key: formKey,
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextFormField(
                                  controller: Fullname_Controller,
                                  // textCapitalization: TextCapitalization.sentences,
                                  // keyboardType: TextInputType.multiline,
                                  textInputAction: TextInputAction.done,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: width*0.05
                                ),
                                  decoration: InputDecoration(
                                      fillColor: colorPage.sixteenth,
                                      filled: true,
                                      labelText: "Full Name",
                                      labelStyle: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: width*0.05,
                                          color: colorPage.secondaryColor
                                      ),
                                      hintText: "please your name",
                                      hintStyle: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: width*0.05
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: colorPage.forthColor
                                        ),
                                        borderRadius: BorderRadius.circular(width*0.03),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(width*0.03),
                                          borderSide: BorderSide(
                                              color: colorPage.ninthColor
                                          )
                                      )
                                  ),
                                ),
                                SizedBox(height: width*0.03,),
                                TextFormField(
                                    controller: Nickname_Controller,
                                    // textCapitalization: TextCapitalization.sentences,
                                    keyboardType: TextInputType.multiline,
                                    textInputAction: TextInputAction.done,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: width*0.05
                                    ),
                                    decoration: InputDecoration(
                                        fillColor: colorPage.sixteenth,
                                        filled: true,
                                        labelText: "Nickname",
                                        labelStyle: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: width*0.05,
                                            color: colorPage.secondaryColor
                                        ),
                                        hintText: "please your Nickname",
                                        hintStyle: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: width*0.05
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: colorPage.forthColor
                                          ),
                                          borderRadius: BorderRadius.circular(width*0.03),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(width*0.03),
                              borderSide: BorderSide(
                                  color: colorPage.ninthColor
                              )
                                        )
                                    )
                                ),
                                SizedBox(height: width*0.03,),
                                TextFormField(
                                  controller: Dateofbirth_Controller,
                                  keyboardType: TextInputType.datetime,
                                  maxLength: 10,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: width*0.05,
                                  ),
                                  decoration: InputDecoration(
                                      fillColor: colorPage.sixteenth,
                                      filled: true,
                                      counterText: "",
                                      suffixIcon: Image.asset(imagePage.date,
                                      ),
                                      labelText: "Date of Birth",
                                      labelStyle: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: width*0.05,
                                          color: colorPage.secondaryColor
                                      ),
                                      hintText: "please your Date of Birth",
                                      hintStyle: TextStyle(
                                          fontSize: width*0.05,
                                          fontWeight: FontWeight.w500
                                      ) ,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: colorPage.forthColor
                                        ),
                                        borderRadius: BorderRadius.circular(width*0.03),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(width*0.03),
                                          borderSide: BorderSide(
                                              color: colorPage.ninthColor
                                          )
                                      )
                                  ),
                                ),
                                SizedBox(height: width*0.03,),
                                TextFormField(
                                  controller: email_controller,
                                  keyboardType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.done,
                                  style:  TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: width*0.05,
                                  ),
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  validator: (value) {
                                    if(!email_validation.hasMatch(value!))
                                    {
                                      return "please enter valid email address";
                                    }
                                    else{
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
                                          fontSize: width*0.05
                                      ),
                                      hintText: "please enter your email",
                                      hintStyle: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: width*0.05
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(width*0.03),
                                          borderSide: BorderSide(
                                              color: colorPage.forthColor
                                          )
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(width*0.03),
                                          borderSide: BorderSide(
                                              color: colorPage.ninthColor
                                          )
                                      )
                                  ),
                                ),
                                SizedBox(height: width*0.03,),
                                TextFormField(
                                  controller: number_controller,
                                  maxLength: 10,
                                  keyboardType: TextInputType.number,
                                  textInputAction: TextInputAction.done,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: width*0.05
                                  ),
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  validator: (value) {
                                    if(!phone_validation.hasMatch(value!)) {
                                      return "please enter valid number";
                                    } else{
                                      return null;
                                    }
                                    },
                                  decoration: InputDecoration(
                                      fillColor: colorPage.sixteenth,
                                      filled: true,
                                      counterText: "",
                                      prefixIcon: CountryCodePicker(
                                        initialSelection: "Nigeria",
                                        showOnlyCountryWhenClosed: true,
                                        showDropDownButton: true,
                                        hideMainText: true,
                                      ),
                                      labelText: "Phone Number",
                                      labelStyle: TextStyle(
                                          color: colorPage.secondaryColor,
                                          fontSize: width*0.05,
                                          fontWeight: FontWeight.w500
                                      ),
                                      hintText: "please your number",
                                      hintStyle: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: width*0.05
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(width*0.03),
                                          borderSide: BorderSide(
                                              color: colorPage.forthColor
                                          )
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: colorPage.ninthColor
                                          ),
                                          borderRadius: BorderRadius.circular(width*0.03)
                                      )
                                  ),
                                ),
                                SizedBox(height: width*0.2,),
                                Padding(
                                  padding: EdgeInsets.all(width*0.04),
                                  child: InkWell(
                                    onTap: () {
                                      if(
                                      Fullname_Controller.text!=""&&
                                          Nickname_Controller.text!=""&&
                                          Dateofbirth_Controller.text!=""&&
                                          number_controller.text!=""&&
                                          email_controller.text!=""&&
                                          formKey.currentState!.validate()
                                      ){

                                        Navigator.push(context,
                                            MaterialPageRoute(builder: (context) => payment1(
                                               bookingModal: bookingModal!.copyWith(
                                                 customername: Fullname_Controller.text,
                                                 customernickname: Nickname_Controller.text,
                                                 dob: Dateofbirth_Controller.text,
                                                 email: email_controller.text,
                                                 phonenumber: number_controller.text,
                                               ),
                                            ),));
                                      }
                                      else{
                                      Fullname_Controller.text==""?ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                      content: Text("please enter your Fullname!"),)):
                                      Nickname_Controller.text==""?ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                      content: Text("please enter your Nickname!"),)):
                                      Dateofbirth_Controller.text==""?ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                      content: Text("please enter your Date of birth!"),)):
                                      number_controller.text==""?ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                      content: Text("please enter your number!"),)):
                                      email_controller.text==""?ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                      content: Text("please enter your email!"),)):
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                      content: Text("please enter your valid details"),
                                      ));
                                      }
                                    },
                                    child: Container(
                                      height: width*0.13,
                                      width: width*0.8,
                                      // color: Colors.red,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(width*0.08),
                                          color: colorPage.primaryColor,
                                          boxShadow: [
                                            BoxShadow(
                                                blurRadius: 5,
                                                spreadRadius: 0,
                                                offset: Offset(0, 4),
                                                color: colorPage.secondaryColor.withOpacity(0.25)
                                            )
                                          ]
                                      ),
                                      child: Center(
                                        child: Text("Continue",
                                            style: TextStyle(
                                                color: colorPage.thirdColor,
                                                fontWeight: FontWeight.w600,
                                                fontSize: width*0.045
                                            )),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                      ]
            ),
          ),
        )
      )
    );
  }
}
