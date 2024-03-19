import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_booking/constants/color_page.dart';
import 'package:hotel_booking/constants/image_page.dart';
import 'package:hotel_booking/hotel/hotelclass.dart';
import 'package:hotel_booking/home/my_bookmark.dart';

import '../main.dart';
import '../hotel/hotel.dart';

class recentlyBooked extends StatefulWidget {
  const recentlyBooked({super.key});

  @override
  State<recentlyBooked> createState() => _recentlyBookedState();
}

class _recentlyBookedState extends State<recentlyBooked> {
  // List photos=[
  //   {
  //    "image" :"assets/images/photos1.png",
  //     "text1" :"Intercontinental Hotel",
  //    "text2" :"\$205",
  //    "text3" :"/night",
  //   },
  //   {
  //     "image" :"assets/images/photos2.png",
  //     "text1" :"Nevada Hotel",
  //     "text2" :"\$107",
  //     "text3" :"/night",
  //   },
  //   {
  //     "image" : "assets/images/photos3.png",
  //     "text1" :"Oriental Hotel",
  //     "text2" :"\$190",
  //     "text3" :"/night",
  //   },
  //   {
  //     "image" :"assets/images/photos4.png",
  //     "text1" :"Federal Palace Hotel",
  //     "text2" :"\$200",
  //     "text3" :"/night",
  //   },
  //   {
  //     "image" :"assets/images/photos5.png",
  //     "text1" :"Presidential Hotel",
  //     "text2" :"\$160",
  //     "text3" :"/night",
  //   }
  // ];
  // bool bookmark=false;
  int selectindex=0;

  List saved=[];

  bool list=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPage.sixthColor,
      appBar: AppBar(
        elevation: 0,
        titleSpacing: width*0.01,
        toolbarHeight: width*0.3,
        backgroundColor: colorPage.thirdColor,
        leading: Padding(
          padding:  EdgeInsets.all(width*0.03),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: SvgPicture.asset(imagePage.arrow,width: width*0.05,
            ),
          ),
        ),
        title: Text("Recently Booked",
        style: TextStyle(
          color: colorPage.secondaryColor,
          fontSize: width*0.06,
          fontWeight: FontWeight.w700
        )),
        actions: [
          InkWell(
            onTap: () {
              list=true;
              setState(() {

              });
            },
              child: SvgPicture.asset(list ? imagePage.menu : imagePage.mnm
              )),
          SizedBox(width: width*0.03,),
          InkWell(
            onTap: () {
              list=false;
              setState(() {

              });
            },
              child: SvgPicture.asset(list ? imagePage.booking: imagePage.bkm)),
          SizedBox(width: width*0.03,),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(width*0.04),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: list == true ? StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('hotel').snapshots(),
                builder: (context, snapshot) {
                  if(!snapshot.hasData){
                    return CircularProgressIndicator();
                  }
                  var data = snapshot.data!.docs;
                  return data.length==0
                      ? Text("No hotels found!"):
                   ListView.separated(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => hotel(
                            place: data[index]["place"],
                            image: data[index]["image"],
                            description: data[index]["description"],
                            title: data[index]["title"],
                            amount: data[index]['amount'],
                            id: data[index].id,

                          ),));
                        },
                        child: Container(
                          height: width*0.35,
                          width: width*1,
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
                                  image: DecorationImage(image: NetworkImage(data[index]["image"]))
                                )
                                ),
                              Container(
                                width: width*0.45,
                                // color: Colors.red,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(data[index]["title"],
                                    style: TextStyle(
                                      color: colorPage.secondaryColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: width*0.047
                                    )),
                                    SizedBox(height: width*0.03,),
                                    Text(data[index]["place"],
                                    style: TextStyle(
                                      fontSize: width*0.038,
                                      fontWeight: FontWeight.w400
                                    ),),
                                    SizedBox(height: width*0.03,),
                                    Row(
                                      children: [
                                    Image(image: AssetImage(imagePage.star),
                                    color: colorPage.twentyone,),
                                    Text(data[index]["rating"],style: TextStyle(
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
                                  Text(data[index]["amount"],
                                  style: TextStyle(
                                    color: colorPage.primaryColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: width*0.049
                                  ),),
                                    Text(details[index].amounttext),
                                  SizedBox(height: width*0.03,),
                                  InkWell(
                                    onTap: () {
                                     if(saved.contains(index)){
                                       saved.remove(index);
                                       setState(() {

                                       });
                                     }
                                     else{
                                       saved.add(index);
                                       setState(() {

                                       });
                                     }
                                     setState(() {

                                     });
                                    },
                                      child:saved.contains(index)? SvgPicture.asset(imagePage.bookmark):SvgPicture.asset(imagePage.minus))
                                ],
                              )

                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: width*0.03,);
                    },
                  );
                }
              ) : StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('hotel').snapshots(),
                builder: (context, snapshot) {
                  if(!snapshot.hasData){
                    return CircularProgressIndicator();
                  }
                  var data = snapshot.data!.docs;
                  return data.length==0
                    ? Text("No hotels found!"):
                   GridView.builder(
                    itemCount: data.length,
                    physics: BouncingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: width*0.03,
                        crossAxisSpacing: width*0.03,
                        childAspectRatio: 0.54
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => hotel(
                            place: data[index]["place"],
                            image: data[index]["image"],
                            description: data[index]["description"],
                            title: data[index]["title"],
                            amount: data[index]['amount'],
                            id: data[index].id,

                          ),));
                        },
                        child: Container(
                          // height: width*0.7,
                          // width: width*0.45,
                          // color: Colors.red,
                          decoration: BoxDecoration(
                              color: colorPage.thirdColor,
                              borderRadius: BorderRadius.circular(width*0.04)
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: width*0.38,
                                width: width*0.38,
                                // color: Colors.red,
                                margin: EdgeInsets.all(width*0.03),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(width*0.03),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            data[index]["image"]
                                        ),fit: BoxFit.fill
                                    )
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(width*0.05),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Text("Radisson Blu ",
                                    //   style: TextStyle(
                                    //       color: colorPage.secondaryColor,
                                    //       fontWeight: FontWeight.w700,
                                    //       fontSize: width*0.05
                                    //   ),),
                                    Text(data[index]["title"],
                                      style: TextStyle(
                                          color: colorPage.secondaryColor,
                                          fontWeight: FontWeight.w700,
                                          fontSize: width*0.045
                                      ),),
                                    SizedBox(height: width*0.02,),
                                    Row(
                                      children: [
                                        Image(image: AssetImage(imagePage.star),
                                          color: colorPage.twentyone,),
                                        Text(data[index]["rating"],style: TextStyle(
                                            color: colorPage.primaryColor,
                                            fontSize: width*0.03,
                                            fontWeight: FontWeight.w600
                                        ),),
                                        Text(data[index]["place"],
                                          style: TextStyle(
                                              fontSize: width*0.038,
                                              fontWeight: FontWeight.w400
                                          ),),
                                        SizedBox(height: width*0.04,),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(data[index]["amount"],
                                            style: TextStyle(
                                                fontSize: width*0.05,
                                                color: colorPage.primaryColor,
                                                fontWeight: FontWeight.w700
                                            )),
                                        SizedBox(width: width*0.02,),
                                        Text(details[index].amounttext,style:
                                        TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: width*0.03,
                                            color: colorPage.secondaryColor
                                        ),),
                                        SizedBox(width: width*0.04,),
                                        InkWell(
                                            onTap: () {
                                              if(saved.contains(index)){
                                                saved.remove(index);
                                                setState(() {

                                                });
                                              }
                                              else{
                                                saved.add(index);
                                                setState(() {

                                                });
                                              }
                                              setState(() {

                                              });
                                            },
                                            child:saved.contains(index)? SvgPicture.asset(imagePage.bookmark):SvgPicture.asset(imagePage.minus))
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
                }
              ),
            )
          ],
        ),
      ),

    );
  }
}
