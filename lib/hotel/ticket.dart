import 'package:flutter/material.dart';
import 'package:hotel_booking/constants/color_page.dart';
import 'package:hotel_booking/constants/image_page.dart';

import '../main.dart';

class ticket extends StatefulWidget {
  const ticket({super.key});

  @override
  State<ticket> createState() => _ticketState();
}

class _ticketState extends State<ticket> {
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
            Text("Ticket",style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: width*0.07,
                color: colorPage.secondaryColor
            ),),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            height: height*0.71,
            width: width*1,
            // color: Colors.red,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(imagePage.outline))
            ),
            child: Padding(
              padding: EdgeInsets.all(width*0.05),
              child: Column(
                children: [
                  Text("Intercontinental Hotel",style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: width*0.05
                  ),),
                  SizedBox(height: width*0.03,),
                  Image.asset(imagePage.qrcode),
                  SizedBox(height: width*0.25,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Name",style: TextStyle(
                              fontSize: width*0.045,
                              fontWeight: FontWeight.w500
                          )),
                          Text("Kezia Williams",style: TextStyle(
                              fontSize: width*0.04,
                              fontWeight: FontWeight.w700
                          )),
                          SizedBox(height: width*0.07,),
                          Text("Check in",style: TextStyle(
                              fontSize: width*0.045,
                              fontWeight: FontWeight.w500
                          )),
                          Text("Dec 16, 2024",style: TextStyle(
                              fontSize: width*0.04,
                              fontWeight: FontWeight.w700
                          )),
                          SizedBox(height: width*0.07,),
                          Text("Hotel",style: TextStyle(
                              fontSize: width*0.045,
                              fontWeight: FontWeight.w500
                          )),
                          Text("Intercontinental Hotel",style: TextStyle(
                              fontSize: width*0.04,
                              fontWeight: FontWeight.w700
                          )),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Phone Number",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: width*0.045
                            ),),
                          Text("+234 702 2347 642",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: width*0.04
                            ),),
                          SizedBox(height: width*0.07,),
                          Text("Check out",style: TextStyle(
                              fontSize: width*0.045,
                              fontWeight: FontWeight.w500
                          )),
                          Text("Dec 18, 2024",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: width*0.04
                            ),),
                          SizedBox(height: width*0.07,),
                          Text("Guest",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: width*0.045
                            ),),
                          Text("3",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: width*0.04
                            ),),

                        ],
                      ),
                    ],
                  ),
                  // Column(
                  //   children: [
                  //     SizedBox(height: width*0.07,),
                  //     Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //       children: [
                  //
                  //
                  //       ],
                  //     ),
                  //
                  //   ],
                  // )
                ],
              ),
            ),
          ),
          SizedBox(height: width*0.04,),
          Container(
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
              child: Text("Download Ticket",
                  style: TextStyle(
                      color: colorPage.thirdColor,
                      fontWeight: FontWeight.w600,
                      fontSize: width*0.045
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
