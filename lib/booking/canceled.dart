import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_booking/constants/color_page.dart';
import 'package:hotel_booking/constants/image_page.dart';
import 'package:hotel_booking/navigation/booking_page.dart';
import 'package:hotel_booking/booking/completed.dart';
import 'package:hotel_booking/hotel/hotelclass.dart';

import '../main.dart';

class canceled extends StatefulWidget {
  const canceled({super.key});

  @override
  State<canceled> createState() => _canceledState();
}

class _canceledState extends State<canceled> {
  List name=[
    "Ongoing",
    "Completed",
    "Canceled",
  ];
  bool a=false;
  bool b=false;
  int selectindex=2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPage.sixthColor,
      appBar:  AppBar(
        elevation: 0,
        titleSpacing: width*0.01,
        toolbarHeight: width*0.3,
        backgroundColor: colorPage.thirdColor,
        leading: Padding(
          padding: EdgeInsets.all(width*0.03),
          child: SvgPicture.asset(imagePage.b),
        ),
        title: Text("My Booking",
            style: TextStyle(
                color: colorPage.secondaryColor,
                fontWeight: FontWeight.w700,
                fontSize: width*0.065
            )),
        actions: [
          SvgPicture.asset(imagePage.search),
          SizedBox(width: width*0.05,)
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(width*0.03),
          child: Column(
            children: [
              Container(
                height:width*0.15,
                width: width*1,
                color: colorPage.thirdColor,

                child: ListView.builder(
                  itemCount: name.length,
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return  InkWell(
                      onTap: () {
                        selectindex=index;
                        selectindex==1? Navigator.push(context, MaterialPageRoute(builder: (context) => completed(),)):null;
                        selectindex==0? Navigator.push(context, MaterialPageRoute(builder: (context) => bookingPage(),)):null;
                        setState(() {

                        });
                      },
                      child: Container(
                          height: width*0.1,
                          width: width*0.35,
                          // color: Colors.red,
                          // padding: EdgeInsets.only(left: width*0.02,right: width*0.02),
                          margin: EdgeInsets.all(width*0.02),
                          decoration: BoxDecoration(
                              color: selectindex==index?colorPage.primaryColor:
                              colorPage.thirdColor,
                              border: Border.all(
                                  color: colorPage.primaryColor
                              ),
                              borderRadius: BorderRadius.circular(width*0.05)
                          ),
                          child:
                          Center(child: Text(name[index],
                            style: TextStyle(
                                color:selectindex==index?colorPage.thirdColor: colorPage.primaryColor
                            ),
                          ))

                      ),
                    );
                  },

                ),
              ),
              Padding(
                padding: EdgeInsets.all(width*0.04),
                child: Column(
                  children: [
                    Container(
                      height: width*1.5,
                      width: width*1,
                      color: colorPage.sixthColor,
                      child:  Expanded(
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: details.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              height: width*0.55,
                              width: width*1,
                              // color: Colors.red,
                              decoration: BoxDecoration(
                                color: colorPage.thirdColor,
                                borderRadius: BorderRadius.circular(width*0.03),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                          height: width*0.25,
                                          width: width*0.25,
                                          // color: Colors.red,
                                          margin: EdgeInsets.all(width*0.03),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(width*0.03),
                                              image: DecorationImage(image: AssetImage(details[index].image))
                                          )
                                      ),
                                      Container(
                                        width: width*0.45,
                                        // color: Colors.red,
                                        child: Padding(
                                          padding: EdgeInsets.all(width*0.03),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(details[index].title,
                                                  style: TextStyle(
                                                      color: colorPage.secondaryColor,
                                                      fontWeight: FontWeight.w700,
                                                      fontSize: width*0.047
                                                  )),
                                              SizedBox(height: width*0.03,),
                                              Text(details[index].place,
                                                style: TextStyle(
                                                    fontSize: width*0.038,
                                                    fontWeight: FontWeight.w400
                                                ),),
                                              SizedBox(height: width*0.03,),
                                              Container(
                                                height: width*0.06,
                                                width: width*0.35,
                                                // color: Colors.red,
                                                decoration: BoxDecoration(
                                                    color: colorPage.twentyfive,
                                                    borderRadius: BorderRadius.circular(width*0.02)
                                                ),
                                                alignment: Alignment.center,
                                                child: Text("Canceled & Refunded",
                                                    style: TextStyle(
                                                        color: colorPage.twentyfour,
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: width*0.033
                                                    )),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    height: width*0.0006,
                                    indent: width*0.07,
                                    endIndent: width*0.07,
                                    thickness: width*0.0038,
                                    color: colorPage.forthColor,
                                  ),
                                  // Row(
                                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  //   children: [
                                  //     InkWell(
                                  //       onTap:() {
                                  //         a=true;
                                  //         b=false;
                                  //         setState(() {
                                  //
                                  //         });
                                  //       },
                                  //       child: Container(
                                  //         padding: EdgeInsets.only(left: width*0.02,right: width*0.02),
                                  //         height: width*0.08,
                                  //         // width: width*0.3,
                                  //         // color: Colors.red,
                                  //         decoration: BoxDecoration(
                                  //             borderRadius: BorderRadius.circular(width*0.04),
                                  //             border: Border.all(
                                  //                 color: colorPage.primaryColor
                                  //             ),
                                  //             color: a==true?colorPage.primaryColor:colorPage.thirdColor
                                  //         ),
                                  //         child: Center(
                                  //           child: Text("Cancel Booking",
                                  //               style: TextStyle(
                                  //                   color: a==true?colorPage.thirdColor:colorPage.primaryColor,
                                  //                   fontSize: width*0.038,
                                  //                   fontWeight: FontWeight.w600
                                  //               )),
                                  //         ),
                                  //       ),
                                  //     ),
                                  //     InkWell(
                                  //       onTap: () {
                                  //         b=true;
                                  //         a=false;
                                  //         setState(() {
                                  //
                                  //         });
                                  //       },
                                  //       child: Container(
                                  //         padding: EdgeInsets.only(left: width*0.02,right: width*0.02),
                                  //         height: width*0.08,
                                  //         // width: width*0.3,
                                  //         // color: Colors.red,
                                  //         decoration: BoxDecoration(
                                  //             borderRadius: BorderRadius.circular(width*0.04),
                                  //             border: Border.all(
                                  //                 color: colorPage.primaryColor
                                  //             ),
                                  //             color: b==true?colorPage.primaryColor:colorPage.thirdColor
                                  //         ),
                                  //         child: Center(
                                  //           child: Text("View Ticket",style:
                                  //           TextStyle(
                                  //               fontWeight: FontWeight.w600,
                                  //               fontSize: width*0.038,
                                  //               color: b==true?colorPage.thirdColor:colorPage.primaryColor
                                  //           )),
                                  //         ),
                                  //       ),
                                  //     ),
                                  //   ],
                                  // ),
                                  Container(
                                    margin: EdgeInsets.all(width*0.04),
                                    height: width*0.08,
                                    width: width*1,
                                    decoration: BoxDecoration(
                                        color:colorPage.twentyfive,
                                        borderRadius: BorderRadius.circular(width*0.02)
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(left: width*0.1),
                                          height: width*0.045,
                                          width: width*0.045,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(width*0.02),
                                              color: colorPage.twentyfour
                                          ),
                                        ),
                                        SizedBox(width: width*0.015,),
                                        Text("You cancelled this hotel booking.",
                                          style: TextStyle(
                                              color: colorPage.twentyfour,
                                              fontWeight: FontWeight.w400,
                                              fontSize: width*0.033
                                          ),)
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(height: width*0.03,);
                          },
                        ),
                      ),
                    )
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
