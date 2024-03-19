import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_booking/authentication/log_in.dart';
import 'package:hotel_booking/authentication/sign_in.dart';
import 'package:hotel_booking/constants/color_page.dart';
import 'package:hotel_booking/constants/image_page.dart';
import 'package:hotel_booking/navigation/navigation_page.dart';

import '../main.dart';

class page3 extends StatefulWidget {
  const page3({super.key});

  @override
  State<page3> createState() => _page3State();
}

class _page3State extends State<page3> {
  TextEditingController password_controller=TextEditingController();
  final password_validation=RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}");
  TextEditingController newpassword_controller=TextEditingController();
  // final newpassword_validation=RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}");
  bool password1=false;
  bool password2=false;
  final formKey=GlobalKey<FormState>();
  bool tick=false;
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
        // InkWell(
        //   onTap: () {
        //     Navigator.pop(context);
        //   },
        //   child: Icon(Icons.arrow_back,
        //     color: colorPage.secondaryColor,),
        // ),
        SizedBox(width: width*0.02,),
         Text("Create New Password",
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: width*0.065,
                color: colorPage.secondaryColor
            )),
        ]
      ),
    ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: width*1.5,
                width: width*1,
                 padding: EdgeInsets.all(width*0.08),
                 // color: Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Create Your New Password",
                    style: TextStyle(
                      fontSize: width*0.04,
                       fontWeight: FontWeight.w500,
                      color: colorPage.seveteenth
                    )),
                    SizedBox(height: width*0.05,),
                    TextFormField(
                      controller: password_controller,
                      obscureText: password1?true:false,
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      style:  TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: width*0.05,
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if(!password_validation.hasMatch(value!)){
                          return "password incorrect format";
                        }
                        else{
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          fillColor: colorPage.sixteenth,
                          filled: true,
                          prefixIcon: InkWell(
                            onTap: () {
                              password1=!password1;
                              setState(() {

                              });
                            },
                              child: Image.asset(password1?imagePage.Message:imagePage.Message)),
                          labelText: "Password",
                          labelStyle: TextStyle(
                              color: colorPage.secondaryColor,
                              fontWeight: FontWeight.w500,
                              fontSize: width*0.05
                          ),
                          hintText: "please enter your password",
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: width*0.05
                          ),
                          // enabledBorder: OutlineInputBorder(
                          //     borderRadius: BorderRadius.circular(width*0.03),
                          //     borderSide: BorderSide(
                          //         color: colorPage.forthColor
                          //     )
                          // ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(width*0.03),
                            borderSide: BorderSide(
                              color: colorPage.forthColor
                            )
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(width*0.03),
                              borderSide: BorderSide(
                                  color: colorPage.forthColor
                              )
                          )
                      ),
                    ),
                    SizedBox(height: width*0.05,),
                    TextFormField(
                      controller: newpassword_controller,
                      obscureText: password2?true:false,
                      keyboardType: TextInputType.multiline,
                      textInputAction: TextInputAction.done,
                      style:  TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: width*0.05,
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if(value!=password_controller.text){
                          return "password incorrect format";
                        }
                        else{
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          fillColor: colorPage.sixteenth,
                          filled: true,
                          prefixIcon: SizedBox(),
                          labelText: "New Password",
                          labelStyle: TextStyle(
                              color: colorPage.secondaryColor,
                              fontWeight: FontWeight.w500,
                              fontSize: width*0.05
                          ),
                          hintText: "please enter your newpassword",
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: width*0.05
                          ),
                          // enabledBorder: OutlineInputBorder(
                          //     borderRadius: BorderRadius.circular(width*0.03),
                          //     borderSide: BorderSide(
                          //         color: colorPage.forthColor
                          //     )
                          // ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: colorPage.forthColor
                            ),
                            borderRadius: BorderRadius.circular(width*0.03)
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(width*0.03),
                              borderSide: BorderSide(
                                  color: colorPage.forthColor
                              )
                          )
                      ),
                    ),
                    SizedBox(height: width*0.05,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                          activeColor: colorPage.primaryColor,
                          side: BorderSide(
                            color: colorPage.primaryColor,
                            width: width*0.006
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(width*0.015)
                          ),
                          value: tick,
                          onChanged: (value) {
                            setState(() {
                              tick=value!;
                            });
                          },),
                        Text("Remember me",
                          style: TextStyle(
                              color: colorPage.secondaryColor,
                              fontSize: width*0.045,
                              fontWeight: FontWeight.w900
                          ),)
                      ],
                    ),
                    SizedBox(height: width*0.05,),


                  ],
                ),


              ),
              SizedBox(height: width*0.06,),
              InkWell(
                onTap: () {
                  if(
                  password_controller.text!=""&&
                  newpassword_controller.text!=""&&
                      // password_controller.text==newpassword_controller.text &&
                      formKey.currentState!.validate()
                  ) {
                    Navigator.pushAndRemoveUntil(context,
                        MaterialPageRoute(builder: (context) => signIn(),), (
                            route) => false);
                  }else{
                    password_controller.text==""?ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("please enter your password!"))):
                    newpassword_controller.text==""?ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("please enter your newpassword!"))) :
                        // newpassword_controller.text!=password_controller.text ? ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        //   content: Text("Entered passwords do not match"),
                        // )):
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
                          color: colorPage.secondaryColor.withOpacity(0.25),
                          spreadRadius: 0,
                          offset: Offset(0, 4)
                      ),
                    ],
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
            ],
          ),
        ),
      ),
    );
  }
}
