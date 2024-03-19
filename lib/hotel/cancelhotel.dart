import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_booking/constants/color_page.dart';
import 'package:hotel_booking/constants/image_page.dart';
import 'package:hotel_booking/navigation/navigation_page.dart';

import '../main.dart';

class cancelhotel extends StatefulWidget {
  const cancelhotel({super.key});

  @override
  State<cancelhotel> createState() => _cancelhotelState();
}

class _cancelhotelState extends State<cancelhotel> {
  int selectedOption=0;
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
            Text("Cancel Hotel Booking",style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: width*0.07,
                color: colorPage.secondaryColor
            ),),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(width*0.04),
              child: Text("Please select a payment refund method (only 80% will be refunded)",style: TextStyle(
                  fontSize: width*0.045,
                  fontWeight: FontWeight.w400,
                  color: colorPage.secondaryColor
              ),),
            ),
            SizedBox(height: width*0.04,),
            Container(
              height: height*0.55,
              width: width*1,
              color: colorPage.sixthColor,
              child: Padding(
                padding: EdgeInsets.all(width*0.066),
                child: Column(
                  children: [
                    Container(
                      height: width*0.18,
                      width: width*0.95,
                      // color: colorPage.thirdColor,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(width*0.03),
                          color: colorPage.thirdColor
                      ),
                      child: ListTile(
                        leading:  SvgPicture.asset(imagePage.paypal),
                        title: Text("Paypal",style: TextStyle(
                            fontSize: width*0.045,
                            fontWeight: FontWeight.w600
                        )),
                        trailing: Radio(
                          fillColor: MaterialStateProperty.all(colorPage.primaryColor),
                          activeColor: colorPage.primaryColor,
                          value: 1,
                          groupValue: selectedOption,
                          onChanged: (value) {
                            setState(() {
                              selectedOption=value!;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: width*0.04,),
                    Container(
                      height: width*0.18,
                      width: width*0.95,
                      // color: colorPage.thirdColor,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(width*0.03),
                          color: colorPage.thirdColor
                      ),
                      child: ListTile(
                        leading: Image.asset(imagePage.Google),
                        title: Text("Google Pay",style: TextStyle(
                            fontSize: width*0.045,
                            fontWeight: FontWeight.w600
                        )),
                        trailing: Radio(
                          fillColor: MaterialStateProperty.all(colorPage.primaryColor),
                          activeColor: colorPage.primaryColor,
                          value: 2,
                          groupValue: selectedOption,
                          onChanged: (value) {
                            setState(() {
                              selectedOption=value!;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: width*0.04,),
                    Container(
                      height: 67,
                      width: 347,
                      // color: colorPage.thirdColor,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(width*0.03),
                          color: colorPage.thirdColor
                      ),
                      child: ListTile(
                        leading: SvgPicture.asset(imagePage.vector),
                        title: Text("Apple Pay",style: TextStyle(
                            fontSize: width*0.045,
                            fontWeight: FontWeight.w600
                        )),
                        trailing: Radio(
                          fillColor: MaterialStateProperty.all(colorPage.primaryColor),
                          activeColor: colorPage.primaryColor,
                          value: 3,
                          groupValue: selectedOption,
                          onChanged: (value) {
                            setState(() {
                              selectedOption=value!;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: width*0.04,),
                    Row(
                      children: [
                        Text("Pay with Debit/Credit Card",style:
                        TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: width*0.05
                        )),
                      ],
                    ),
                    SizedBox(height: width*0.04,),
                    Container(
                      height: width*0.18,
                      width: width*0.95,
                      // color: colorPage.thirdColor,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(width*0.03),
                          color: colorPage.thirdColor
                      ),
                      child: ListTile(
                        leading: Container(
                            color: colorPage.secondaryColor,
                            child: SvgPicture.asset(imagePage.logo)),
                        title: Text("**** **** **** ****4679",style: TextStyle(
                            fontSize: width*0.045,
                            fontWeight: FontWeight.w600
                        )),
                        trailing: Radio(
                          fillColor: MaterialStateProperty.all(colorPage.primaryColor),
                          activeColor: colorPage.primaryColor,
                          value: 4,
                          groupValue: selectedOption,
                          onChanged: (value) {
                            setState(() {
                              selectedOption=value!;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: width*0.2,),
            InkWell(
              onTap: () {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => navigationPage(),), (route) => false);
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
          ],
        ),
      ),
    );
  }
}
