import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_booking/constants/color_page.dart';
import 'package:hotel_booking/constants/image_page.dart';
import 'package:hotel_booking/forgot_password/page2.dart';

import '../main.dart';

class page1 extends StatefulWidget {
  const page1({super.key});

  @override
  State<page1> createState() => _page1State();
}

class _page1State extends State<page1> {


  bool a=false;
  bool b=false;

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
      body: Padding(
        padding: EdgeInsets.only(left: width*0.1,right: width*0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: width*0.6,
              width: width*1,
              // color: Colors.red,
              child: Image.asset(imagePage.Padlock),
            ),
            Text("Select which contact details should we use to reset your password",
            style: TextStyle(
              color: colorPage.eighteenth,
              fontSize: width*0.04,
              fontWeight: FontWeight.w500
            ),),
            InkWell(
              onTap: () {
                a=true;
                b=false;
                setState(() {

                });
              },
              child: Container(
                height: width*0.3,
                width: width*0.8,
                padding: EdgeInsets.all(width*0.03),
                // color: Colors.red,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: colorPage.primaryColor,
                    width: a==true? width*0.006 : width*0.003,
                  )
                ),
                child: Row(
                  children: [
                    CircleAvatar(

                      child: SvgPicture.asset(imagePage.sms),
                      radius: width*0.08,
                      backgroundColor: colorPage.nineteenth,
                    ),
                     SizedBox(width: width*0.025,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("via SMS:",style:
                          TextStyle(
                            color: colorPage.twenty,
                            fontWeight: FontWeight.w400,
                            fontSize: width*0.045
                          ),),
                        Text(" +234111******99",
                          style: TextStyle(
                              fontSize: width*0.045,
                              fontWeight: FontWeight.w600,
                              color: colorPage.secondaryColor
                          ),)
                      ],
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                b=true;
                a=false;
                setState(() {

                });
              },
              child: Container(
                height: width*0.3,
                width: width*0.8,
                padding: EdgeInsets.all(width*0.03),
                // color: Colors.red,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: colorPage.primaryColor,
                      width: b==true? width*0.006 : width*0.003,
                    )
                ),
                child: Row(
                  children: [
                    CircleAvatar(

                      child: SvgPicture.asset(imagePage.email),
                      radius: width*0.08,
                      backgroundColor: colorPage.nineteenth,
                    ),
                    SizedBox(width: width*0.025,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("via Email:",style:
                        TextStyle(
                            color: colorPage.twenty,
                            fontWeight: FontWeight.w400,
                            fontSize: width*0.045
                        ),),
                        Text("kez***9@your domain.com",
                          style: TextStyle(
                              fontSize: width*0.045,
                              fontWeight: FontWeight.w600,
                              color: colorPage.secondaryColor
                          ),)
                      ],
                    ),
                  ],
                ),
              ),
            ),
           InkWell(
             onTap: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) => page2(),));
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
           )
          ],
        ),
      ),
    );
  }
}
