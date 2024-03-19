import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_booking/constants/color_page.dart';
import 'package:hotel_booking/constants/image_page.dart';
import 'package:hotel_booking/hotel/reservation.dart';
import 'package:intl/intl.dart';

import '../Modal/Booking_Modal.dart';
import '../main.dart';
import 'hotel.dart';

class calender extends StatefulWidget {
  const calender({super.key, required this.bookingModal, required this.price});
  final BookingModal bookingModal;
  final String price;
  @override
  State<calender> createState() => _calenderState();
}

class _calenderState extends State<calender> {


  int count = 1;
  List<DateTime?> date = [];

  int guest = 1;
  double amount = 205;
  int days = 0;
  int a = 1;
  int total = 0;
  BookingModal? bookingModal;


  String fromdate='';


  @override
  void initState() {
    bookingModal = widget.bookingModal;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    total = date.isEmpty ? 0 : date.last!.difference(date.first!).inDays;
    return Scaffold(
        backgroundColor: colorPage.thirdColor,
        appBar: AppBar(
          backgroundColor: colorPage.thirdColor,
          elevation: 0,
          toolbarHeight: width * 0.25,
          leadingWidth: width * 0.6,
          leading: Row(
            children: [
              SizedBox(
                width: width * 0.02,
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: colorPage.secondaryColor,
                ),
              ),
              SizedBox(
                width: width * 0.02,
              ),
              Text(
                "Select Date",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: width * 0.06,
                    color: colorPage.secondaryColor),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(width * 0.04),
          child: Column(children: [
            Container(
              height: width * 0.65,
              decoration: BoxDecoration(
                color: colorPage.sixthColor,
              ),
              child: CalendarDatePicker2(
                config: CalendarDatePicker2Config(
                    calendarType: CalendarDatePicker2Type.range,
                    disableModePicker: true,
                    selectedRangeHighlightColor: colorPage.twentysix,
                    selectedDayHighlightColor: colorPage.primaryColor),
                value: date,
                onValueChanged: (dates) {
                  date = dates;
                  print(date);
                  setState(() {});
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Check in",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: width * 0.05),
                      ),
                      SizedBox(
                        height: width * 0.03,
                      ),
                      Container(
                        height: width * 0.18,
                        width: width * 0.4,
                        decoration: BoxDecoration(color: colorPage.twentyseven),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              date.isEmpty || date.length == 1
                                  ? ""
                                  : DateFormat.MMMd()
                                      .format(date.first!)
                                      .toString(),
                              style: TextStyle(
                                fontSize: width * 0.04,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Container(
                                width: width * 0.08,
                                height: width * 0.05,
                                child: SvgPicture.asset(imagePage.calender)),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: width * 0.06),
                    child: SvgPicture.asset(imagePage.right)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Check out",
                      style: TextStyle(
                        fontSize: width * 0.05,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: width * 0.03,
                    ),
                    Container(
                        height: width * 0.18,
                        width: width * 0.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(width * 0.03),
                          color: colorPage.twentyseven,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              date.isEmpty || date.length == 1
                                  ? ""
                                  : DateFormat.MMMd()
                                      .format(date.last!)
                                      .toString(),
                              style: TextStyle(
                                fontSize: width * 0.04,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              width: width * 0.12,
                            ),
                            Container(
                                width: width * 0.08,
                                height: width * 0.05,
                                child: SvgPicture.asset(imagePage.calender)),
                          ],
                        ))
                  ],
                ),
              ],
            ),
            SizedBox(
              height: width * 0.09,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Guest",
                  style: TextStyle(
                      fontSize: width * 0.04, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            SizedBox(
              height: width * 0.04,
            ),
            Container(
              height: width * 0.18,
              width: width * 1,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(width * 0.03),
                  border: Border.all(color: colorPage.twentyeight)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      count++;
                      setState(() {});
                    },
                    child: Container(
                        height: width * 0.13,
                        width: width * 0.13,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(width * 0.03),
                            color: colorPage.sixthColor),
                        child: Icon(Icons.add)),
                  ),
                  Text(count.toString(),
                      style: TextStyle(
                          fontSize: width * 0.05, fontWeight: FontWeight.w700)),
                  InkWell(
                    onTap: () {
                      count <= 1 ? 1 : count--;
                      setState(() {});
                    },
                    child: Container(
                        height: width * 0.13,
                        width: width * 0.13,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(width * 0.03),
                            color: colorPage.sixthColor),
                        child: Icon(Icons.remove)),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: width * 0.1,
            ),
            Text(
              "Total: \$${((a * double.parse( widget.price)) * (total))*count}",
              style: TextStyle(
                  fontWeight: FontWeight.w700, fontSize: width * 0.045),
            ),
            SizedBox(
              height: width * 0.05,
            ),
            InkWell(
              onTap: () {
                if (date.isEmpty || date.length == 0) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Please mention date")));
                } else {
                  BookingModal updatedModel = bookingModal!.copyWith(
                    fromdate: DateFormat.MMMd()
                        .format(date.first!)
                        .toString(),
                    todate: DateFormat.MMMd()
                        .format(date.last!)
                        .toString(),
                    guest: guest.toString(),
                    price: double.tryParse((((a * double.parse(widget.price.toString())) * (total))*count).toString()),
                  );
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => reservation(
                          bookingModal: updatedModel,
                        ),
                      ));
                }
              },
              child: Container(
                height: width * 0.13,
                width: width * 0.8,
                // color: Colors.red,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(width * 0.08),
                    color: colorPage.primaryColor,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 5,
                          spreadRadius: 0,
                          offset: Offset(0, 4),
                          color: colorPage.secondaryColor.withOpacity(0.25))
                    ]),
                child: Center(
                  child: Text("Continue",
                      style: TextStyle(
                          color: colorPage.thirdColor,
                          fontWeight: FontWeight.w600,
                          fontSize: width * 0.045)),
                ),
              ),
            ),
          ]),
        ));
  }
}
