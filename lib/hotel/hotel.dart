import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_booking/Modal/Booking_Modal.dart';
import 'package:hotel_booking/constants/color_page.dart';
import 'package:hotel_booking/constants/image_page.dart';
import 'package:hotel_booking/hotel/calender.dart';
import 'package:readmore/readmore.dart';

import '../authentication/create_account.dart';
import '../main.dart';

class hotel extends StatefulWidget {
  const hotel({
    super.key,
    required this.image,
    required this.title,
    required this.place,
    required this.description,
    required this.amount,
    required this.id,
  });
  final String image;
  final String title;
  final String place;
  final String description;
  final String amount;
  final String id;

  @override
  State<hotel> createState() => _hotelState();
}

class _hotelState extends State<hotel> {
  List restaurant = [
    "assets/images/restaurant10.png",
    "assets/images/restaurant11.png",
    "assets/images/restaurant1.jpeg",
    "assets/images/restaurant2.jpeg",
    "assets/images/restaurant3.jpeg",
    "assets/images/restaurant4.jpeg",
    "assets/images/restaurant5.jpeg",
    "assets/images/restaurant6.jpeg",
    "assets/images/restaurant7.jpeg",
    "assets/images/restaurant8.jpeg",
    "assets/images/restaurant9.jpeg"
  ];
  List review = [
    {
      "pic": "assets/images/Ellipse 3.png",
      "name": "Ivande Othawa",
      "date": "Jan 20, 2025",
      "description":
          "Very nice and comfortable hotel, thank you for accompanying my vacation!"
    },
    {
      "pic": "assets/images/Ellipse 4.png",
      "name": "Nonso Davies",
      "date": "Jan 20, 2025",
      "description":
          "The rooms are very elegant and the natural views are amazing can’t wait to come back again"
    },
    {
      "pic": "assets/images/Ellipse 5.png",
      "name": "Peter Shege",
      "date": "Jan 09, 2025",
      "description":
          "Very nice hotel, my friends and I are very satisfied with the service!"
    },
    {
      "pic": "assets/images/Ellipse 4.png",
      "name": "Nonso Davies",
      "date": "Jan 20, 2025",
      "description":
          "The rooms are very elegant and the natural views are amazing can’t wait to come back again"
    },
    {
      "pic": "assets/images/Ellipse 3.png",
      "name": "Ivande Othawa",
      "date": "Jan 20, 2025",
      "description":
          "Very nice and comfortable hotel, thank you for accompanying my vacation!"
    },
  ];

  bool more = false;

  int selectindex = 0;

  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Container(
        color: Colors.white,
        height: width * 0.22,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Divider(
              endIndent: width * 0.04,
              indent: width * 0.04,
              thickness: width * 0.002,
              color: colorPage.secondaryColor.withOpacity(0.25),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Text(
                      "\$${widget.amount}",
                      style: TextStyle(
                          color: colorPage.primaryColor,
                          fontSize: width * 0.055,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "  /night",
                      style: TextStyle(
                        fontSize: width * 0.03,
                      ),
                    )
                  ],
                ),
                InkWell(
                  onTap: () {
                    BookingModal bookingModal = BookingModal(
                        userId: userId.toString(),
                        time: "",
                        fromdate: "",
                        todate: "",
                        guest: "",
                        price: 0.0,
                        customername: "",
                        customernickname: "",
                        dob: "",
                        email: "",
                        phonenumber: "",
                        paymentmethod: 0,
                        hotelId: widget.id,
                        bookingId: "");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => calender(
                            price: widget.amount,
                            bookingModal: bookingModal,
                          ),
                        ));
                  },
                  child: Container(
                    height: width * 0.12,
                    width: width * 0.6,
                    decoration: BoxDecoration(
                        color: colorPage.primaryColor,
                        borderRadius: BorderRadius.circular(width * 0.07),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 4),
                              spreadRadius: 0,
                              blurRadius: 5,
                              color: colorPage.secondaryColor.withOpacity(0.25))
                        ]),
                    child: Center(
                      child: Text("Book Now!",
                          style: TextStyle(
                              color: colorPage.thirdColor,
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      backgroundColor: colorPage.thirdColor,
      body: CustomScrollView(
        // shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        scrollBehavior: ScrollBehavior(),
        slivers: [
          SliverAppBar(
            backgroundColor: colorPage.thirdColor,
            elevation: 0,
            expandedHeight: width * 0.7,
            leading: Padding(
              padding: EdgeInsets.only(top: width * 0.07),
              child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: colorPage.secondaryColor,
                  )),
            ),
            pinned: true,
            // title: Text("Presidential Hotel",style: TextStyle(
            //   fontSize: width*0.06,
            //   fontWeight: FontWeight.w700,
            //   color: colorPage.secondaryColor
            // ),),
            flexibleSpace: Container(
              height: width * 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: FlexibleSpaceBar(
                      background: Image(
                        image: NetworkImage(widget.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: width * 0.12,
                      ),
                      Text(widget.title,
                          style: TextStyle(
                              color: colorPage.secondaryColor,
                              fontWeight: FontWeight.w700,
                              fontSize: width * 0.07)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // SliverAppBar(
          //
          //   backgroundColor: colorPage.thirdColor,
          //   title: Text("Presidential Hotel",style: TextStyle(
          //     color: colorPage.secondaryColor,
          //     fontWeight: FontWeight.w700,
          //     fontSize: width*0.07
          //   )),
          //   pinned: true,
          //   elevation: 0,
          // ),
          SliverToBoxAdapter(
              // fillOverscroll: false,
              // hasScrollBody: true,
              child: Padding(
            padding: EdgeInsets.only(left: width * 0.045, right: width * 0.045),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(imagePage.location),
                    Text(
                      widget.place,
                      style: TextStyle(
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.w500,
                          color: colorPage.secondaryColor),
                    )
                  ],
                ),
                SizedBox(
                  height: width * 0.045,
                ),
                Divider(
                  endIndent: width * 0.042,
                  indent: width * 0.042,
                  color: colorPage.secondaryColor.withOpacity(0.25),
                ),
                SizedBox(
                  height: width * 0.045,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Gallery Photos",
                      style: TextStyle(
                          color: colorPage.secondaryColor,
                          fontWeight: FontWeight.w700,
                          fontSize: width * 0.05),
                    ),
                    InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(width * 0.04)),
                              content: Container(
                                height: width * 1,
                                width: width * 0.8,
                                margin: EdgeInsets.all(width * 0.03),
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: StreamBuilder<DocumentSnapshot>(
                                          stream: FirebaseFirestore.instance
                                              .collection("hotel")
                                              .doc(widget.title)
                                              .snapshots(),
                                          builder: (context, snapshot) {
                                            if (!snapshot.hasData) {
                                              return Text("No data found");
                                            }
                                            var data =
                                                snapshot.data!["addimage"];
                                            return data.length == 0
                                                ? Text("No hotels found")
                                                : GridView.builder(
                                                    itemCount: data.length,
                                                    physics:
                                                        BouncingScrollPhysics(),
                                                    gridDelegate:
                                                        SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 2,
                                                      crossAxisSpacing:
                                                          width * 0.05,
                                                      mainAxisSpacing:
                                                          width * 0.05,
                                                    ),
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      return Container(
                                                        height: width * 0.3,
                                                        width: width * 0.3,
                                                        decoration: BoxDecoration(
                                                            color: colorPage
                                                                .secondaryColor,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        width *
                                                                            0.03),
                                                            image: DecorationImage(
                                                                image: NetworkImage(
                                                                    data[
                                                                        index]),
                                                                fit: BoxFit
                                                                    .cover)),
                                                      );
                                                    },
                                                  );
                                          }),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Text(
                        "See All",
                        style: TextStyle(
                            fontSize: width * 0.05,
                            fontWeight: FontWeight.w700,
                            color: colorPage.primaryColor),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: width * 0.03,
                ),
                Container(
                  height: width * 0.35,
                  width: width * 1,
                  // color: colorPage.primaryColor,
                  child: StreamBuilder<DocumentSnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection("hotel")
                          .doc(widget.title)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Text("No data found");
                        }
                        var data = snapshot.data!["addimage"];
                        return data.length == 0
                            ? Text("No hotels found")
                            : ListView.separated(
                                itemCount: data.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, int index) {
                                  return Container(
                                    height: width * 0.2,
                                    width: width * 0.36,
                                    decoration: BoxDecoration(
                                        color: colorPage.secondaryColor,
                                        borderRadius:
                                            BorderRadius.circular(width * 0.03),
                                        image: DecorationImage(
                                            image: NetworkImage(data[index]),
                                            fit: BoxFit.cover)),
                                  );
                                },
                                separatorBuilder: (context, int index) {
                                  return SizedBox(
                                    width: width * 0.03,
                                  );
                                },
                              );
                      }),
                ),
                SizedBox(
                  height: width * 0.03,
                ),
                Text(
                  "Details",
                  style: TextStyle(
                      color: colorPage.secondaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: width * 0.055),
                ),
                SizedBox(
                  height: width * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SvgPicture.asset(imagePage.hotelll),
                    SvgPicture.asset(imagePage.bed),
                    SvgPicture.asset(imagePage.bath),
                    SvgPicture.asset(imagePage.sqrf)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "   Hotels",
                      style: TextStyle(
                        fontSize: width * 0.03,
                      ),
                    ),
                    Text(
                      "4 Bedrooms",
                      style: TextStyle(
                        fontSize: width * 0.03,
                      ),
                    ),
                    Text(
                      "2 Bathrooms",
                      style: TextStyle(
                        fontSize: width * 0.03,
                      ),
                    ),
                    Text(
                      "3000 sqft",
                      style: TextStyle(
                        fontSize: width * 0.03,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: width * 0.035,
                ),
                Text(
                  "Description",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: width * 0.055,
                      color: colorPage.secondaryColor),
                ),
                SizedBox(
                  height: width * 0.035,
                ),
                ReadMoreText(
                  widget.description,
                  trimLines: 3,
                  trimCollapsedText: "Read More",
                  trimExpandedText: "Read Less",
                  trimMode: TrimMode.Line,
                  colorClickableText: colorPage.primaryColor,
                  moreStyle: TextStyle(color: colorPage.primaryColor),
                  lessStyle: TextStyle(color: colorPage.primaryColor),
                ),
                SizedBox(
                  height: width * 0.035,
                ),
                Text(
                  "Facilities",
                  style: TextStyle(
                      color: colorPage.secondaryColor,
                      fontSize: width * 0.055,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: width * 0.035,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset(imagePage.swim),
                        Text(
                          "Swimming Pool",
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: width * 0.03),
                        ),
                        SizedBox(
                          height: width * 0.035,
                        ),
                        SvgPicture.asset(imagePage.meeting),
                        Text(
                          "Meeting Room",
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: width * 0.03),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset(imagePage.wifi),
                        Text(
                          "WiFi",
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: width * 0.03),
                        ),
                        SizedBox(
                          height: width * 0.035,
                        ),
                        SvgPicture.asset(imagePage.elevator),
                        Text(
                          "Elevator",
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: width * 0.03),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset(imagePage.res),
                        Text(
                          "Restaurant",
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: width * 0.03),
                        ),
                        SizedBox(
                          height: width * 0.035,
                        ),
                        SvgPicture.asset(imagePage.fitness),
                        Text(
                          "Fitness Center",
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: width * 0.03),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset(imagePage.parking),
                        Text(
                          "Parking",
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: width * 0.03),
                        ),
                        SizedBox(
                          height: width * 0.035,
                        ),
                        SvgPicture.asset(imagePage.hours),
                        Text(
                          "24-hours Open",
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: width * 0.03),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: width * 0.035,
                ),
                Text(
                  "Location",
                  style: TextStyle(
                      fontSize: width * 0.055,
                      fontWeight: FontWeight.w600,
                      color: colorPage.secondaryColor),
                ),
                SizedBox(
                  height: width * 0.03,
                ),
                Stack(
                  children: [
                    Image(image: AssetImage(imagePage.locatmap)),
                    Positioned(
                        top: width * 0.2,
                        right: width * 0.42,
                        child: SvgPicture.asset(imagePage.locat)),
                    SizedBox(
                      height: width * 0.5,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Review",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 19),
                    ),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    SvgPicture.asset(
                      imagePage.star2,
                    ),
                    Text(
                      "5.0",
                      style: TextStyle(color: colorPage.primaryColor),
                    ),
                    Text(
                      " (4,345 reviews)",
                      style: TextStyle(
                          fontSize: width * 0.038,
                          fontWeight: FontWeight.w600,
                          color: colorPage.secondaryColor),
                    ),
                    SizedBox(
                      width: width * 0.2,
                    ),
                    // Text("See All",style: TextStyle(
                    //   color: colorPage.primaryColor,
                    //   fontWeight: FontWeight.w700,
                    //   fontSize: width*0.042
                    // ),)
                  ],
                ),
                SizedBox(
                  height: width * 0.05,
                ),
                Container(
                  height: width * 0.9,
                  width: width * 1,
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: more == false
                        ? review.sublist(0, 3).length
                        : review.length,
                    physics: more
                        ? NeverScrollableScrollPhysics()
                        : BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: width * 0.33,
                        width: width * 1,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(width * 0.02),
                            color: colorPage.thirdColor,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 5,
                                  spreadRadius: 0,
                                  offset: Offset(0, 4),
                                  color: colorPage.secondaryColor
                                      .withOpacity(0.25))
                            ]),
                        child: Column(
                          children: [
                            ListTile(
                              leading: CircleAvatar(
                                backgroundImage:
                                    AssetImage(review[index]["pic"]),
                              ),
                              title: Text(review[index]["name"],
                                  style: TextStyle(
                                      fontSize: width * 0.046,
                                      fontWeight: FontWeight.w600)),
                              subtitle: Text(review[index]["date"],
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: width * 0.042)),
                              trailing: Container(
                                height: width * 0.06,
                                width: width * 0.14,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(width * 0.03),
                                    color: colorPage.primaryColor),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.asset(imagePage.star,
                                        height: width * 0.04),
                                    Text(
                                      "5.0",
                                      style: TextStyle(
                                          color: colorPage.thirdColor,
                                          fontWeight: FontWeight.w600,
                                          fontSize: width * 0.03),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Text(
                              review[index]["description"],
                              style: TextStyle(
                                  fontSize: width * 0.037,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: width * 0.05,
                      );
                    },
                  ),
                ),
                InkWell(
                  onTap: () {
                    more = !more;
                    setState(() {});
                  },
                  child: Container(
                    height: width * 0.14,
                    width: width * 1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width * 0.07),
                        color: colorPage.sixthColor),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(more ? "Less" : "More",
                            style: TextStyle(
                                color: colorPage.primaryColor,
                                fontWeight: FontWeight.w600,
                                fontSize: width * 0.036)),
                        SizedBox(
                          width: width * 0.02,
                        ),
                        more
                            ? Icon(
                                Icons.keyboard_arrow_up_sharp,
                                color: colorPage.primaryColor,
                              )
                            : SvgPicture.asset(imagePage.triangle)
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: width * 0.25,
                )
              ],
            ),
          )),
        ],
      ),
    );
  }
}
