import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_booking/constants/color_page.dart';
import 'package:hotel_booking/constants/image_page.dart';
import 'package:hotel_booking/forgot_password/page3.dart';

import '../main.dart';

class security extends StatefulWidget {
  const security({super.key});

  @override
  State<security> createState() => _securityState();
}

class _securityState extends State<security> {
  bool toggle1=false;
  bool toggle2=true;
  bool toggle3=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPage.thirdColor,
      appBar: AppBar(
        backgroundColor: colorPage.thirdColor,
        elevation: 0,
        toolbarHeight: width*0.25,
        leadingWidth: width*0.5,
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
            Text("Security",style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: width*0.06,
                color: colorPage.secondaryColor
            ),),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(width*0.04),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Face ID", style:
                TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: width*0.046
                )),
                Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          toggle1=!toggle1;
                          setState(() {

                          });
                        },
                        child: Container(
                          height: width*0.07,
                          width: width*0.12,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(width*0.05),
                              color: toggle1?Colors.green:Colors.grey[400]
                          ),

                        ),
                      ),
                      AnimatedPositioned(
                        duration: Duration(
                          milliseconds: 200,
                        ),
                        curve: Curves.easeIn,
                        left: toggle1 ? width*0.05 : 0,
                        right: toggle1 ? 0 : width*0.05,
                        child: InkWell(
                          onTap: () {
                            toggle1=!toggle1;
                            setState(() {

                            });
                          },
                          child: AnimatedContainer(
                            duration: Duration(
                              milliseconds: 200,
                            ),
                            height: width*0.07,
                            width: width*0.07,
                            curve: Curves.easeIn,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle
                            ),
                          ),
                        ),
                      ),
                    ]
                ),
              ],
            ),
            SizedBox(height: width*0.06,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Remember me", style:
                TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: width*0.046
                )),
                Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          toggle2=!toggle2;
                          setState(() {
                          });
                        },
                        child: Container(
                          height: width*0.07,
                          width: width*0.12,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(width*0.05),
                              color: toggle2?Colors.green:Colors.grey[400]
                          ),

                        ),
                      ),
                      AnimatedPositioned(
                        duration: Duration(
                          milliseconds: 200,
                        ),
                        curve: Curves.easeIn,
                        left: toggle2 ? width*0.05 : 0,
                        right: toggle2 ? 0 : width*0.05,
                        child: InkWell(
                          onTap: () {
                            toggle2=!toggle2;
                            setState(() {

                            });
                          },
                          child: AnimatedContainer(
                            duration: Duration(
                              milliseconds: 200,
                            ),
                            height: width*0.07,
                            width: width*0.07,
                            curve: Curves.easeIn,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle
                            ),
                          ),
                        ),
                      ),
                    ]
                ),
              ],
            ),
            SizedBox(height: width*0.06,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Touch ID", style:
                TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: width*0.046
                )),
                Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          toggle3=!toggle3;
                          setState(() {
                          });
                        },
                        child: Container(
                          height: width*0.07,
                          width: width*0.12,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(width*0.05),
                              color: toggle3?Colors.green:Colors.grey[400]
                          ),

                        ),
                      ),
                      AnimatedPositioned(
                        duration: Duration(
                          milliseconds: 200,
                        ),
                        curve: Curves.easeIn,
                        left: toggle3 ? width*0.05 : 0,
                        right: toggle3 ? 0 : width*0.05,
                        child: InkWell(
                          onTap: () {
                            toggle3=!toggle3;
                            setState(() {

                            });
                          },
                          child: AnimatedContainer(
                            duration: Duration(
                              milliseconds: 200,
                            ),
                            height: width*0.07,
                            width: width*0.07,
                            curve: Curves.easeIn,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle
                            ),
                          ),
                        ),
                      ),
                    ]
                ),
              ],
            ),
            SizedBox(height: width*0.06,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Google Authenticator", style:
                TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: width*0.046
                )),
                SvgPicture.asset(imagePage.arr)
              ],
            ),
            SizedBox(height: width*0.15,),
            InkWell(
              onTap: () {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => page3(),), (route) => false);
              },
              child: Container(
                height: width*0.13,
                width: width*0.8,
                // color: Colors.black,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(width*0.08),
                    color: colorPage.sixthColor,
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 0,
                          blurRadius: 5,
                          offset: Offset(0, 4),
                          color: colorPage.sixthColor.withOpacity(0.25)
                      )
                    ]

                ),
                child: Padding(
                  padding: EdgeInsets.all(width*0.035),
                  child: Text("Change Password",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: width*0.039,
                          color: colorPage.primaryColor,
                          fontWeight: FontWeight.w600
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
