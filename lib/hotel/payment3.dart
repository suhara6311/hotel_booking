import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_booking/Modal/Booking_Modal.dart';
import 'package:hotel_booking/constants/color_page.dart';
import 'package:hotel_booking/constants/image_page.dart';
import 'package:hotel_booking/hotel/ticket.dart';
import 'package:lottie/lottie.dart';

import '../main.dart';

class payment3 extends StatefulWidget {
  const payment3({super.key, required this.cardNumber, required this.bookingModal});
  final BookingModal bookingModal;
  final String cardNumber;
  @override
  State<payment3> createState() => _payment3State();
}
class _payment3State extends State<payment3> {
  BookingModal? bookingModal;
  void initState() {
    bookingModal=widget.bookingModal;
    // print(bookingModal!.guest.toString());
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
            Text("Payment",style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: width*0.07,
                color: colorPage.secondaryColor
            ),),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance.collection('hotel').doc(bookingModal!.hotelId).snapshots(),
              builder: (context, snapshot) {
                return Container(
                  height: height*0.7,
                  width: width*1,
                  color: colorPage.sixthColor,
                  child: Column(
                    children: [
                    Container(
                    height: width*0.35,
                    width: width*1,
                      margin: EdgeInsets.all(width*0.04),
                    // color: Colors.red,
                    decoration: BoxDecoration(
                      color: colorPage.thirdColor,
                      borderRadius: BorderRadius.circular(width*0.03),
                    ),
                    child: Row(
                      children: [
                        Container(
                            height: width*0.25,
                            width: width*0.25,
                            // color: Colors.red,
                            margin: EdgeInsets.all(width*0.03),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(width*0.03),
                                image: DecorationImage(image: NetworkImage(snapshot.data!['image']))
                            )
                        ),
                        Container(
                          width: width*0.45,
                          // color: Colors.red,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(snapshot.data!['title'],
                                  style: TextStyle(
                                      color: colorPage.secondaryColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: width*0.042
                                  )),
                              SizedBox(height: width*0.03,),
                              Text(snapshot.data!["place"],
                                style: TextStyle(
                                    fontSize: width*0.035,
                                    fontWeight: FontWeight.w400
                                ),),
                              SizedBox(height: width*0.03,),
                              Row(
                                children: [
                                  Image(image: AssetImage(imagePage.star),
                                    color: colorPage.twentyone,),
                                  Text(snapshot.data!['rating'],style: TextStyle(
                                      color: colorPage.primaryColor,
                                      fontSize: width*0.03,
                                      fontWeight: FontWeight.w600
                                  ),),
                                  Text("  (4,345 reviews)",
                                    style: TextStyle(
                                        fontSize: width*0.03,
                                        fontWeight: FontWeight.w600,
                                        color: colorPage.twentytwo
                                    ),)
                                ],
                              )
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,

                          children: [
                            Text("\$${snapshot.data!['amount']}",
                              style: TextStyle(
                                  color: colorPage.primaryColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: width*0.049
                              ),),
                            Text("/night"),
                            SizedBox(height: width*0.1,),

                          ],
                        )

                      ],
                    ),
                  ),
                      Container(
                        height: width*0.35,
                        width: width*1,
                        margin: EdgeInsets.all(width*0.04),
                        padding: EdgeInsets.all(width*0.04),
                        // color: Colors.red,
                        decoration: BoxDecoration(
                          color: colorPage.thirdColor,
                          borderRadius: BorderRadius.circular(width*0.03),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Check in"),
                                Text(widget.bookingModal.fromdate,style: TextStyle(
                                  fontWeight: FontWeight.w600
                                ),)
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Check out"),
                                Text(widget.bookingModal.todate,style: TextStyle(
                                  fontWeight: FontWeight.w600
                                ),)
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Guest"),
                                Text(widget.bookingModal.guest,style: TextStyle(
                                  fontWeight: FontWeight.w600
                                ),)
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: width*0.35,
                        width: width*1,
                        margin: EdgeInsets.all(width*0.04),
                        padding: EdgeInsets.all(width*0.04),
                        // color: Colors.red,
                        decoration: BoxDecoration(
                          color: colorPage.thirdColor,
                          borderRadius: BorderRadius.circular(width*0.03),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("5 Nights"),
                                Text(widget.bookingModal.price.toString(),style: TextStyle(
                                  fontWeight: FontWeight.w600
                                ),)
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Taxes & Fees(10%)"),
                                Text(widget.bookingModal.price.toString(),style: TextStyle(
                                  fontWeight: FontWeight.w600
                                ),)
                              ],
                            ),
                            Divider(
                              color: colorPage.fifthColor,
                              endIndent: width*0.03,
                              indent: width*0.03,

                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Total"),
                                Text(widget.bookingModal.price.toString(),style: TextStyle(
                                  fontWeight: FontWeight.w600
                                ),)
                              ],
                            ),
                          ],
                        ),
                      ),
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
                          title: Text(widget.cardNumber,style: TextStyle(
                              fontSize: width*0.045,
                              fontWeight: FontWeight.w600
                          )),
                          trailing: Text("Change",style: TextStyle(
                            color: colorPage.primaryColor
                          ),
                          )
                        ),
                      ),
                    ],
                  ),

                );
              }
            ),

            InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(width*0.06),
                        ),
                        content: Container(
                          height: height*0.45,
                          width: width*1,
                          margin: EdgeInsets.all(width*0.03),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Lottie.asset(imagePage.lottie1,
                              ),
                              Text("Payment Successfull!",style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: width*0.05,
                                color: colorPage.primaryColor
                              ),),
                              Text("Successfully made payment and hotel booking",
                              textAlign: TextAlign.center,
                              style:  TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: width*0.04
                              ),),
                              InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => ticket(),));
                                },
                                child: Container(
                                  height: width*0.13,
                                  width: width*0.6,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(width*0.07),
                                    color: colorPage.primaryColor
                                  ),
                                  child: Center(
                                    child: Text("View Ticket",
                                    style: TextStyle(
                                      color: colorPage.thirdColor,
                                      fontSize: width*0.04,
                                      fontWeight: FontWeight.w600
                                    )),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  height: width*0.13,
                                  width: width*0.6,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(width*0.07),
                                    color: colorPage.sixthColor
                                  ),
                                  child: Center(
                                    child: Text("Cancel",
                                    style: TextStyle(
                                      color: colorPage.primaryColor,
                                      fontSize: width*0.04,
                                      fontWeight: FontWeight.w600
                                    )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                );
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
