import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_booking/constants/color_page.dart';
import 'package:hotel_booking/constants/image_page.dart';
import 'package:hotel_booking/hotel/hotel.dart';

import '../main.dart';
import '../hotel/hotelclass.dart';

class searchPage extends StatefulWidget {
  const searchPage({super.key});

  @override
  State<searchPage> createState() => _searchPageState();
}

class _searchPageState extends State<searchPage> {
  List name = ["All Hotel", "Recommended", "Popular", "Trending"];
  String selectCategory = '';
  int selectIndex = 0;

  List saved = [];

  bool list = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: colorPage.sixthColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: width * 0.5,
              width: width * 1,
              color: colorPage.thirdColor,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(width * 0.05),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      style: TextStyle(
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: InputDecoration(
                        fillColor: colorPage.sixteenth,
                        filled: true,
                        prefixIcon: Icon(Icons.search),
                        hintText: "Search",
                        suffixIcon: Padding(
                          padding: EdgeInsets.only(right: width * 0.04),
                          child: SvgPicture.asset(imagePage.ee),
                        ),
                        suffixIconConstraints: BoxConstraints(
                          maxHeight: width * 0.1,
                          maxWidth: width * 0.1,
                        ),
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: width * 0.04,
                            color: colorPage.forthColor),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(width * 0.02),
                            borderSide: BorderSide(color: colorPage.sixteenth)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(width * 0.02),
                            borderSide: BorderSide(color: colorPage.sixteenth)),
                      ),
                    ),
                  ),
                  Container(
                    height: width * 0.15,
                    width: width * 1,
                    padding: EdgeInsets.only(left: width * 0.03),
                    child: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('category')
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return Text("No data found");
                          }
                          var data = snapshot.data!.docs;
                          return data.length == 0
                              ? Text("No hotels found")
                              : ListView.builder(
                                  itemCount: data.length,
                                  scrollDirection: Axis.horizontal,
                                  physics: BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return InkWell(
                                      onTap: () {
                                        selectIndex = index;
                                        selectCategory =
                                            data[index]["category"];
                                        if (selectCategory == "All Hotel") {
                                          selectCategory = "";
                                        }
                                        setState(() {});
                                      },
                                      child: Container(
                                          height: width * 0.1,
                                          // width: width*0.35,
                                          // color: Colors.red,
                                          padding: EdgeInsets.only(
                                              left: width * 0.02,
                                              right: width * 0.02),
                                          margin: EdgeInsets.all(width * 0.02),
                                          decoration: BoxDecoration(
                                              color: selectIndex == index
                                                  ? colorPage.primaryColor
                                                  : colorPage.thirdColor,
                                              border: Border.all(
                                                  color:
                                                      colorPage.primaryColor),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      width * 0.05)),
                                          child: Center(
                                              child: Text(
                                            data[index]['category'],
                                            style: TextStyle(
                                                color: selectIndex == index
                                                    ? colorPage.thirdColor
                                                    : colorPage.primaryColor),
                                          ))),
                                    );
                                  },
                                );
                        }),
                  ),
                  SizedBox(
                    height: width * 0.02,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: width * 0.05, right: width * 0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "All Hotel (484,579)",
                          style: TextStyle(
                              fontSize: width * 0.05,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            InkWell(
                                onTap: () {
                                  list = true;
                                  setState(() {});
                                },
                                child: SvgPicture.asset(
                                    list ? imagePage.menu : imagePage.mnm)),
                            SizedBox(
                              width: width * 0.03,
                            ),
                            InkWell(
                                onTap: () {
                                  list = false;
                                  setState(() {});
                                },
                                child: SvgPicture.asset(
                                    list ? imagePage.booking : imagePage.bkm)),
                            SizedBox(
                              width: width * 0.03,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: width * 0.02,
            ),
            Expanded(
              child: list == true
                  ? StreamBuilder<QuerySnapshot>(
                      stream: selectCategory == ""
                          ? FirebaseFirestore.instance
                              .collection('hotel')
                              .snapshots()
                          : FirebaseFirestore.instance
                              .collection("hotel")
                              .where("category", isEqualTo: selectCategory)
                              .snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Text("No data found!");
                        }
                        var data = snapshot.data!.docs;
                        return data.length == 0
                            ? Text("No hotels found")
                            : ListView.separated(
                                shrinkWrap: true,
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemCount: data.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => hotel(
                                              place: data[index]["place"],
                                              image: data[index]["image"],
                                              description: data[index]["description"],
                                              title: data[index]["title"],
                                              amount: data[index]['amount'],
                                              id: data[index].id,
                                            ),
                                          ));
                                    },
                                    child: Container(
                                      height: width * 0.35,
                                      width: width * 1,
                                      // color: Colors.red,
                                      decoration: BoxDecoration(
                                        color: colorPage.thirdColor,
                                        borderRadius:
                                            BorderRadius.circular(width * 0.03),
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                              height: width * 0.25,
                                              width: width * 0.25,
                                              // color: Colors.red,
                                              margin:
                                                  EdgeInsets.all(width * 0.03),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          width * 0.03),
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                          data[index]
                                                              ["image"])))),
                                          Container(
                                            width: width * 0.45,
                                            // color: Colors.red,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(data[index]["title"],
                                                    style: TextStyle(
                                                        color: colorPage
                                                            .secondaryColor,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize:
                                                            width * 0.047)),
                                                SizedBox(
                                                  height: width * 0.03,
                                                ),
                                                Text(
                                                  data[index]["place"],
                                                  style: TextStyle(
                                                      fontSize: width * 0.038,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                SizedBox(
                                                  height: width * 0.03,
                                                ),
                                                Row(
                                                  children: [
                                                    Image(
                                                      image: AssetImage(
                                                          imagePage.star),
                                                      color:
                                                          colorPage.twentyone,
                                                    ),
                                                    Text(
                                                      data[index]["rating"],
                                                      style: TextStyle(
                                                          color: colorPage
                                                              .primaryColor,
                                                          fontSize:
                                                              width * 0.03,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                    Text(
                                                      "  (4,345 reviews)",
                                                      style: TextStyle(
                                                          fontSize:
                                                              width * 0.03,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: colorPage
                                                              .twentytwo),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                data[index]["amount"],
                                                style: TextStyle(
                                                    color:
                                                        colorPage.primaryColor,
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: width * 0.049),
                                              ),
                                              Text(details[index].amounttext),
                                              SizedBox(
                                                height: width * 0.03,
                                              ),
                                              InkWell(
                                                  onTap: () {
                                                    if (saved.contains(index)) {
                                                      saved.remove(index);
                                                      setState(() {});
                                                    } else {
                                                      saved.add(index);
                                                      setState(() {});
                                                    }
                                                    setState(() {});
                                                  },
                                                  child: saved.contains(index)
                                                      ? SvgPicture.asset(
                                                          imagePage.bookmark)
                                                      : SvgPicture.asset(
                                                          imagePage.minus))
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return SizedBox(
                                    height: width * 0.03,
                                  );
                                },
                              );
                      })
                  : StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('hotel')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Text("No data found!");
                        }
                        var data = snapshot.data!.docs;
                        return data.length == 0
                            ? Text("No hotels found!")
                            : GridView.builder(
                                itemCount: data.length,
                                physics: BouncingScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        mainAxisSpacing: width * 0.03,
                                        crossAxisSpacing: width * 0.03,
                                        childAspectRatio: 0.54,
                                        mainAxisExtent: width * 0.8),
                                itemBuilder: (BuildContext context, int index) {
                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => hotel(
                                              place: data[index]["place"],
                                              image: data[index]["image"],
                                              description: data[index]["description"],
                                              title: data[index]["title"],
                                              amount: data[index]['amount'],
                                              id: data[index].id,
                                            ),
                                          ));
                                    },
                                    child: Container(
                                      height: width * 0.5,
                                      width: width * 0.45,
                                      //color: Colors.red,
                                      decoration: BoxDecoration(
                                          //color: Colors.red,
                                          color: colorPage.thirdColor,
                                          borderRadius: BorderRadius.circular(
                                              width * 0.04)),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: width * 0.38,
                                            width: width * 0.38,
                                            // color: Colors.red,
                                            margin:
                                                EdgeInsets.all(width * 0.03),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        width * 0.03),
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        data[index]["image"]),
                                                    fit: BoxFit.fill)),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.all(width * 0.05),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                // Text("Radisson Blu ",
                                                //   style: TextStyle(
                                                //       color: colorPage.secondaryColor,
                                                //       fontWeight: FontWeight.w700,
                                                //       fontSize: width*0.05
                                                //   ),),
                                                Text(
                                                  data[index]["title"],
                                                  style: TextStyle(
                                                      color: colorPage
                                                          .secondaryColor,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: width * 0.045),
                                                ),
                                                SizedBox(
                                                  height: width * 0.03,
                                                ),
                                                Row(
                                                  children: [
                                                    Image(
                                                      image: AssetImage(
                                                          imagePage.star),
                                                      color:
                                                          colorPage.twentyone,
                                                    ),
                                                    Text(
                                                      data[index]["rating"],
                                                      style: TextStyle(
                                                          color: colorPage
                                                              .primaryColor,
                                                          fontSize:
                                                              width * 0.03,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                    Text(
                                                      data[index]["place"],
                                                      style: TextStyle(
                                                          fontSize:
                                                              width * 0.038,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                    //SizedBox(height: width*0.04,),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(data[index]["amount"],
                                                        style: TextStyle(
                                                            fontSize:
                                                                width * 0.05,
                                                            color: colorPage
                                                                .primaryColor,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700)),
                                                    SizedBox(
                                                      width: width * 0.02,
                                                    ),
                                                    Text(
                                                      details[index].amounttext,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize:
                                                              width * 0.03,
                                                          color: colorPage
                                                              .secondaryColor),
                                                    ),
                                                    SizedBox(
                                                      width: width * 0.04,
                                                    ),
                                                    InkWell(
                                                        onTap: () {
                                                          if (saved.contains(
                                                              index)) {
                                                            saved.remove(index);
                                                            setState(() {});
                                                          } else {
                                                            saved.add(index);
                                                            setState(() {});
                                                          }
                                                          setState(() {});
                                                        },
                                                        child: saved
                                                                .contains(index)
                                                            ? SvgPicture.asset(
                                                                imagePage
                                                                    .bookmark)
                                                            : SvgPicture.asset(
                                                                imagePage
                                                                    .minus))
                                                  ],
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                      }),
            )
          ],
        ),
      ),
    );
  }
}
