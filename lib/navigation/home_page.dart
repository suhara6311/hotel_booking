import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hotel_booking/constants/color_page.dart';
import 'package:hotel_booking/constants/image_page.dart';
import 'package:hotel_booking/hotel/hotel.dart';
import 'package:hotel_booking/hotel/hotelclass.dart';
import 'package:hotel_booking/home/my_bookmark.dart';
import 'package:hotel_booking/home/recently_booked.dart';
import 'package:hotel_booking/home/recommended.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../authentication/create_account.dart';
import '../authentication/sign_in.dart';
import '../main.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  List name1 = ["Recommended", "Popular", "Trending"];
  String selectCategory = '';
  // List hotelroom=[
  //   "assets/images/room.png",
  //   "assets/images/hotel1.jpeg",
  //   "assets/images/hotel2.jpeg",
  //   "assets/images/hotel3.jpeg"
  // ];
  int selectIndex = 0;
  // String name="";
  String image = "";
  String email = "";
  String password = "";
  String id = "";
  String? currentUserId;
  String? homeName;
  bool loading = false;

  getName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    currentUserId = prefs.getString("loginUserId") ?? "";
    print(currentUserId);
    loading = true;
    setState(() {

    });
    var data= await FirebaseFirestore.instance.collection("users").where("id",isEqualTo: currentUserId).get();
    print(currentUserId);
    print(data.docs[0]["nickname"]);
    homeName = data.docs[0]["nickname"];
    loading = false;
    setState(() {

    });
    // image = prefs.getString("image")!;
    // email = prefs.getString("email")!;
    // password = prefs.getString("password")!;
    // id = prefs.getString("id")!;
  }

  @override
  void initState() {
    getName();
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: colorPage.thirdColor,
        appBar: AppBar(
          elevation: 0,
          titleSpacing: width * 0.01,
          toolbarHeight: width * 0.2,
          backgroundColor: colorPage.thirdColor,
          leading: Padding(
            padding: EdgeInsets.all(width * 0.03),
            child: SvgPicture.asset(imagePage.b),
          ),
          title: Text("Bolu",
              style: TextStyle(
                  color: colorPage.secondaryColor,
                  fontWeight: FontWeight.w700,
                  fontSize: width * 0.075)),
          actions: [
            InkWell(
              onTap: () async {
                GoogleSignIn().signOut();
                SharedPreferences prefs =
                    await SharedPreferences
                    .getInstance();
                prefs.remove("login");
                prefs.remove("loginUserId");
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => signIn(),
                    ),
                        (route) => false);
              },
                child: SvgPicture.asset(imagePage.line)),
            SizedBox(
              width: width * 0.03,
            ),
            InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => myBookmark(),
                      ));
                },
                child: SvgPicture.asset(imagePage.minus)),
            SizedBox(
              width: width * 0.05,
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(width * 0.05),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hello,$userId",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: width * 0.095,
                        color: colorPage.secondaryColor)),
                SizedBox(
                  height: width * 0.04,
                ),
                TextFormField(
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
                SizedBox(
                  height: width * 0.06,
                ),
                Container(
                  height: width * 0.15,
                  width: width * 1,
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
                                itemBuilder: (BuildContext context, int index) {
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
                                                color: colorPage.primaryColor),
                                            borderRadius: BorderRadius.circular(
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
                  height: width * 0.07,
                ),
                Container(
                  height: width * 0.87,
                  width: width * 1,
                  // color: Colors.red,
                  child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('hotel')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Text("No data found");
                        }
                        var data = snapshot.data!.docs;
                        return data.length == 0
                            ? Text("No hotels found")
                            : ListView.separated(
                                itemCount: data.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Stack(children: [
                                    InkWell(
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
                                        height: width * 0.87,
                                        width: width * 0.69,
                                        padding: EdgeInsets.only(
                                          left: width * 0.04,
                                        ),
                                        decoration: BoxDecoration(
                                            color: colorPage.forthColor,
                                            borderRadius: BorderRadius.circular(
                                                width * 0.1),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    data[index]['image']),
                                                fit: BoxFit.fill)),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              data[index]['title'],
                                              style: TextStyle(
                                                  color: colorPage.thirdColor,
                                                  fontSize: width * 0.053,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            SizedBox(
                                              height: width * 0.025,
                                            ),
                                            Text(
                                              data[index]['place'],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: width * 0.035,
                                                  color: colorPage.thirdColor),
                                            ),
                                            SizedBox(
                                              height: width * 0.02,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  '\$${data[index]['amount']}',
                                                  style: TextStyle(
                                                      color:
                                                          colorPage.thirdColor,
                                                      fontSize: width * 0.03,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                                Text(
                                                  "/night",
                                                  style: TextStyle(
                                                    color: colorPage.thirdColor,
                                                    fontSize: width * 0.03,
                                                    // fontWeight: FontWeight.w700
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: width * 0.05,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: width * 0.05,
                                      right: width * 0.05,
                                      child: Container(
                                        height: width * 0.06,
                                        width: width * 0.14,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                width * 0.03),
                                            color: colorPage.primaryColor),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Image.asset(imagePage.star,
                                                height: width * 0.04),
                                            Text(
                                              data[index]['rating'],
                                              style: TextStyle(
                                                  color: colorPage.thirdColor,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: width * 0.03),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: width * 0.08,
                                      right: width * 0.02,
                                      child: Container(
                                        height: width * 0.05,
                                        width: width * 0.14,
                                        // color: Colors.white,
                                        child: SvgPicture.asset(imagePage.minus,
                                            color: colorPage.thirdColor),
                                      ),
                                    )
                                  ]);
                                },
                                separatorBuilder: (context, index) {
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Recently Booked",
                        style: TextStyle(
                            color: colorPage.secondaryColor,
                            fontSize: width * 0.042,
                            fontWeight: FontWeight.w600)),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => recentlyBooked(),
                            ));
                      },
                      child: Text(
                        "See All",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: width * 0.042,
                            color: colorPage.primaryColor),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
