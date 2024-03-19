import 'package:flutter/material.dart';
import 'package:hotel_booking/constants/color_page.dart';

import '../main.dart';

class notification extends StatefulWidget {
  const notification({super.key});

  @override
  State<notification> createState() => _notificationState();
}

class _notificationState extends State<notification> {
  bool toggle=false;
  bool toggle1=false;
  bool toggle2=false;
  bool toggle3=false;
  bool toggle4=false;
  bool toggle5=false;
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
            Text("Notification",style: TextStyle(
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("General Notification", style:
                TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: width*0.046
                )),
                Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          toggle=!toggle;
                          setState(() {

                          });
                        },
                        child: Container(
                          height: width*0.07,
                          width: width*0.12,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(width*0.05),
                              color: toggle?Colors.green:Colors.grey[400]
                          ),

                        ),
                      ),
                      AnimatedPositioned(
                        duration: Duration(
                          milliseconds: 200,
                        ),
                        curve: Curves.easeIn,
                        left: toggle ? width*0.05 : 0,
                        right: toggle ? 0 : width*0.05,
                        child: InkWell(
                          onTap: () {
                            toggle=!toggle;
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Sound", style:
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Vibrate", style:
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("App Updates", style:
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("New Service Available", style:
                TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: width*0.046
                )),
                Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          toggle4=!toggle4;
                          setState(() {

                          });
                        },
                        child: Container(
                          height: width*0.07,
                          width: width*0.12,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(width*0.05),
                              color: toggle4?Colors.green:Colors.grey[400]
                          ),

                        ),
                      ),
                      AnimatedPositioned(
                        duration: Duration(
                          milliseconds: 200,
                        ),
                        curve: Curves.easeIn,
                        left: toggle4 ? width*0.05 : 0,
                        right: toggle4 ? 0 : width*0.05,
                        child: InkWell(
                          onTap: () {
                            toggle4=!toggle4;
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("New tips available", style:
                TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: width*0.046
                )),
                Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          toggle5=!toggle5;
                          setState(() {

                          });
                        },
                        child: Container(
                          height: width*0.07,
                          width: width*0.12,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(width*0.05),
                              color: toggle5?Colors.green:Colors.grey[400]
                          ),

                        ),
                      ),
                      AnimatedPositioned(
                        duration: Duration(
                          milliseconds: 200,
                        ),
                        curve: Curves.easeIn,
                        left: toggle5 ? width*0.05 : 0,
                        right: toggle5 ? 0 : width*0.05,
                        child: InkWell(
                          onTap: () {
                            toggle5=!toggle5;
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
            SizedBox(height: width*0.2,),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: width*0.13,
                width: width*0.8,
                // color: Colors.black,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(width*0.08),
                    color: colorPage.primaryColor,
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 0,
                          blurRadius: 5,
                          offset: Offset(0, 4),
                          color: colorPage.secondaryColor.withOpacity(0.25)
                      )
                    ]

                ),
                child: Padding(
                  padding: EdgeInsets.all(width*0.035),
                  child: Text("Update",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: width*0.039,
                          color: colorPage.thirdColor,
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
