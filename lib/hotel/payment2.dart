import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_booking/Modal/Booking_Modal.dart';
import 'package:hotel_booking/constants/color_page.dart';
import 'package:hotel_booking/constants/image_page.dart';
import 'package:hotel_booking/hotel/payment3.dart';

import '../main.dart';

class payment2 extends StatefulWidget {
  const payment2({super.key,required this.cardNumber, required this.bookingModal});
  final BookingModal bookingModal;
final String cardNumber;
  @override
  State<payment2> createState() => _payment2State();
}

class _payment2State extends State<payment2> {
  int selectedOption=0;
  BookingModal? bookingModal;
  void initState() {
    bookingModal=widget.bookingModal;
    // print(bookingModal!.guest.toString());
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
          children: [
            Padding(
              padding: EdgeInsets.all(width*0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Payment Methods",style: TextStyle(
                      fontSize: width*0.045,
                      fontWeight: FontWeight.w700,
                      color: colorPage.secondaryColor
                  ),),
                  Text("Add New Card",style:
                  TextStyle(
                    color: colorPage.primaryColor,
                    fontWeight: FontWeight.w700,
                    fontSize: width*0.045,
                  ),)
                ],
              ),
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
                        title: Text(widget.cardNumber,style: TextStyle(
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => payment3(
                  bookingModal: widget.bookingModal,
                  cardNumber: widget.cardNumber,
                ),));
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
