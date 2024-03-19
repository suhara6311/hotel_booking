import 'package:flutter/material.dart';
import 'package:flutter_flip_card/flipcard/flip_card.dart';
import 'package:flutter_flip_card/flutter_flip_card.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_booking/constants/color_page.dart';
import 'package:hotel_booking/constants/image_page.dart';
import 'package:hotel_booking/hotel/payment2.dart';

import '../Modal/Booking_Modal.dart';
import '../main.dart';

class newcard extends StatefulWidget {
  const newcard({super.key, required this.bookingModal});
  final BookingModal bookingModal;

  @override
  State<newcard> createState() => _newcardState();
}

class _newcardState extends State<newcard> {
  TextEditingController Fullname_Controller = TextEditingController();
  TextEditingController cardnumber_Controller = TextEditingController();
  TextEditingController date_Controller = TextEditingController();
  TextEditingController cvv_Controller = TextEditingController();
  final formKey = GlobalKey<FormState>();
  FlipCardController con1 = FlipCardController();
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
              "New Card",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: width * 0.07,
                  color: colorPage.secondaryColor),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(width * 0.04),
        child: SingleChildScrollView(
          child: Column(
            children: [
              FlipCard(
                rotateSide: RotateSide.bottom,
                onTapFlipping: true,
                axis: FlipAxis.vertical,
                controller: con1,
                frontWidget: Center(
                  child: Container(
                      height: width * 0.6,
                      width: width * 1,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(imagePage.card))),
                      child: Padding(
                        padding: EdgeInsets.all(width * 0.06),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Balance",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: width * 0.05,
                                          color: colorPage.thirdColor),
                                    ),
                                    SizedBox(
                                      height: width * 0.04,
                                    ),
                                    Text(
                                      "\$1299.15",
                                      style: TextStyle(
                                          color: colorPage.thirdColor,
                                          fontSize: width * 0.09,
                                          fontWeight: FontWeight.w600),
                                    )
                                  ],
                                ),
                                SvgPicture.asset(
                                  imagePage.logo,
                                  height: width * 0.15,
                                )
                              ],
                            ),
                            SizedBox(
                              height: width * 0.04,
                            ),
                            Padding(
                              padding: EdgeInsets.all(width * 0.04),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(date_Controller.text,
                                          style: TextStyle(
                                              color: colorPage.thirdColor,
                                              fontWeight: FontWeight.w600,
                                              fontSize: width * 0.07)),
                                    ],
                                  ),
                                  Text(
                                    cardnumber_Controller.text,
                                    style: TextStyle(
                                        fontSize: width * 0.05,
                                        fontWeight: FontWeight.w600,
                                        color: colorPage.thirdColor),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )),
                ),
                backWidget: Container(
                  height: width * 0.6,
                  width: width * 1,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width * 0.04),
                      image:
                          DecorationImage(image: AssetImage(imagePage.card))),
                  child: Column(
                    children: [
                      SizedBox(
                        height: width * 0.02,
                      ),
                      Center(
                        child: Text(
                          "Toll Free No.1800 425 0018",
                          style: TextStyle(
                              color: colorPage.thirdColor,
                              fontSize: width * 0.027),
                        ),
                      ),
                      SizedBox(
                        height: width * 0.02,
                      ),
                      Container(
                        height: width * 0.15,
                        width: width * 0.91,
                        color: colorPage.secondaryColor,
                      ),
                      SizedBox(
                        height: width * 0.03,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: width * 0.03,
                          ),
                          Container(
                            height: width * 0.1,
                            width: width * 0.6,
                            color: colorPage.forthColor,
                          ),
                          Container(
                            height: width * 0.08,
                            width: width * 0.1,
                            color: colorPage.thirdColor,
                            child: Center(
                                child: Text(
                              cvv_Controller.text,
                              style: TextStyle(fontWeight: FontWeight.w600),
                            )),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: width * 0.04,
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: Fullname_Controller,
                      // textCapitalization: TextCapitalization.sentences,
                      // keyboardType: TextInputType.multiline,
                      textInputAction: TextInputAction.done,
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: width * 0.05),
                      decoration: InputDecoration(
                          fillColor: colorPage.sixteenth,
                          filled: true,
                          labelText: "Full Name",
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: width * 0.05,
                              color: colorPage.secondaryColor),
                          hintText: "please your fullname",
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: width * 0.05),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: colorPage.forthColor),
                            borderRadius: BorderRadius.circular(width * 0.03),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(width * 0.03),
                              borderSide:
                                  BorderSide(color: colorPage.ninthColor))),
                    ),
                    SizedBox(
                      height: width * 0.04,
                    ),
                    TextFormField(
                      controller: cardnumber_Controller,
                      textCapitalization: TextCapitalization.sentences,
                      maxLength: 16,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                      onChanged: (value) {
                        setState(() {});
                      },
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: width * 0.05),
                      decoration: InputDecoration(
                          fillColor: colorPage.sixteenth,
                          filled: true,
                          counterText: "",
                          labelText: "card number",
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: width * 0.05,
                              color: colorPage.secondaryColor),
                          hintText: "please your card number",
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: width * 0.05),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: colorPage.forthColor),
                            borderRadius: BorderRadius.circular(width * 0.03),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(width * 0.03),
                              borderSide:
                                  BorderSide(color: colorPage.ninthColor))),
                    ),
                    SizedBox(
                      height: width * 0.04,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: date_Controller,
                            textCapitalization: TextCapitalization.sentences,
                            keyboardType: TextInputType.datetime,
                            textInputAction: TextInputAction.done,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: width * 0.05),
                            onChanged: (value) {
                              setState(() {});
                            },
                            maxLength: 5,
                            decoration: InputDecoration(
                                fillColor: colorPage.sixteenth,
                                filled: true,
                                counterText: "",
                                labelText: "date",
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: width * 0.05,
                                    color: colorPage.secondaryColor),
                                hintText: "please enter date",
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: width * 0.05),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: colorPage.forthColor),
                                  borderRadius:
                                      BorderRadius.circular(width * 0.03),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(width * 0.03),
                                    borderSide: BorderSide(
                                        color: colorPage.ninthColor))),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.03,
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: cvv_Controller,
                            // textCapitalization: TextCapitalization.sentences,
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.done,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: width * 0.05),
                            onChanged: (value) {
                              setState(() {});
                            },
                            maxLength: 3,
                            decoration: InputDecoration(
                                fillColor: colorPage.sixteenth,
                                filled: true,
                                counterText: "",
                                labelText: "cvv",
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: width * 0.05,
                                    color: colorPage.secondaryColor),
                                hintText: "please enter cvv",
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: width * 0.05),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: colorPage.forthColor),
                                  borderRadius:
                                      BorderRadius.circular(width * 0.03),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(width * 0.03),
                                    borderSide: BorderSide(
                                        color: colorPage.ninthColor))),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: width * 0.3,
              ),
              InkWell(
                onTap: () {
                  if (Fullname_Controller.text != "" &&
                      cardnumber_Controller.text != "" &&
                      date_Controller.text != "" &&
                      cvv_Controller.text != "" &&
                      formKey.currentState!.validate()) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => payment2(
                            cardNumber: cardnumber_Controller.text,
                            bookingModal: widget.bookingModal,
                          ),
                        ));
                  } else {
                    Fullname_Controller.text == ""
                        ? ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("please enter your Fullname!"),
                          ))
                        : cardnumber_Controller.text == ""
                            ? ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(
                                content: Text("please enter your cardnumber!"),
                              ))
                            : date_Controller.text == ""
                                ? ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                    content: Text("please enter date!"),
                                  ))
                                : cvv_Controller.text == ""
                                    ? ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                        content: Text("please enter cvv!"),
                                      ))
                                    : ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                        content: Text(
                                            "please enter your valid details"),
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
                    child: Text("Add New Card",
                        style: TextStyle(
                            color: colorPage.thirdColor,
                            fontWeight: FontWeight.w600,
                            fontSize: width * 0.045)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
