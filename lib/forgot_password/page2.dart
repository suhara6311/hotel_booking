import 'package:flutter/material.dart';
import 'package:hotel_booking/constants/color_page.dart';
import 'package:hotel_booking/constants/image_page.dart';
import 'package:hotel_booking/forgot_password/page3.dart';
import 'package:pinput/pinput.dart';
import 'package:timer_count_down/timer_count_down.dart';

import '../main.dart';

class page2 extends StatefulWidget {
  const page2({super.key});

  @override
  State<page2> createState() => _page2State();
}

class _page2State extends State<page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPage.thirdColor,
      appBar: AppBar(
        backgroundColor: colorPage.thirdColor,
        elevation: 0,
        toolbarHeight: width*0.25,
        leadingWidth: width*0.6,
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
            Text("Forgot Password",style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: width*0.06,
                color: colorPage.secondaryColor
            ),),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: width*0.1,right: width*0.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  height: width*1.15,
                  width: width*1,
                  // color: Colors.red,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(imagePage.Protect),
                      Text("Code has been sent to +234111******99",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: colorPage.eighteenth
                        ),),
                      FractionallySizedBox(
                        child: Pinput(
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          closeKeyboardWhenCompleted: true,
                          defaultPinTheme: PinTheme(
                            constraints: BoxConstraints(
                              minWidth: width*0.16,
                              minHeight: width*0.15,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: colorPage.primaryColor
                              ),
                              borderRadius: BorderRadius.circular(width*0.03),
                              color: colorPage.forthColor.withOpacity(0.15)
                            )
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Resend code in "),
                          Countdown(
                            seconds: 60,
                            build: (p0, p1) {
                              return Text("$p1");
                            },),
                          Text("s"),
                        ],
                      ),
                    ],
                  ),
                ),
              SizedBox(height: width*0.45,),

              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => page3(),));
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
                    child: Text("Verify",
                    style: TextStyle(
                      color: colorPage.thirdColor,
                      fontWeight: FontWeight.w600,
                      fontSize: width*0.045,
                    )),
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
