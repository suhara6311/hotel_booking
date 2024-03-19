import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_booking/constants/color_page.dart';
import 'package:hotel_booking/constants/image_page.dart';
import 'package:hotel_booking/navigation/home_page.dart';
import 'package:hotel_booking/home/my_bookmark.dart';

import '../main.dart';
import '../hotel/hotelclass.dart';

class recommended extends StatefulWidget {
  const recommended({super.key});

  @override
  State<recommended> createState() => _recommendedState();
}

class _recommendedState extends State<recommended> {
  int selectindex=1;
  List name=[
    "All Hotel",
    "Recommended",
    "Popular",
    "Trending"

  ];
  List saved=[];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: colorPage.thirdColor,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding:EdgeInsets.only(left: width*0.03,right: width*0.03,top: width*0.15),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  style: TextStyle(
                    fontSize:  width*0.04,
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: InputDecoration(
                    fillColor: colorPage.sixteenth,
                    filled: true,
                    prefixIcon: Icon(Icons.search),
                    hintText: "Search",
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(right:width*0.04),
                      child: SvgPicture.asset(imagePage.ee),
                    ),
                    suffixIconConstraints: BoxConstraints(
                      maxHeight: width*0.1,
                      maxWidth: width*0.1,
                    ),
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: width*0.04,
                        color: colorPage.forthColor
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(width*0.02),
                        borderSide: BorderSide(
                            color: colorPage.sixteenth
                        )
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(width*0.02),
                        borderSide: BorderSide(
                            color: colorPage.sixteenth
                        )
                    ),
                  ),
                ),
              ),
              SizedBox(height: width*0.06,),
              Container(
                height:width*0.15,
                width: width*1,
                // color: Colors.red,
                child: ListView.builder(
                  itemCount: name.length,
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return  InkWell(
                      onTap: () {
                        selectindex=index;
                        selectindex==0? Navigator.push(context, MaterialPageRoute(builder: (context) => homePage(),)):null;
                        setState(() {

                        });
                      },
                      child: Container(
                          height: width*0.1,
                          width: width*0.35,
                          // color: Colors.red,
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
              Container(
                height: width*0.2,
                width: width*1,
                margin: EdgeInsets.only(right: width*0.03,left: width*0.05),
                // color: Colors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text("Recommended  (484,579)",
                        style: TextStyle(
                          color: colorPage.secondaryColor,
                          fontSize: width*0.046,
                          fontWeight: FontWeight.w600
                        ),),
                      ],
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(imagePage.menu),
                        SizedBox(width: width*0.03,),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => myBookmark(),));
                          },
                            child: SvgPicture.asset(imagePage.booking)),
                        SizedBox(width: width*0.03,),
                      ],
                    ),
                  ],
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
                                          image: DecorationImage(image: AssetImage(details[index].image))
                                      )
                                  ),
                                  Container(
                                    width: width*0.45,
                                    // color: Colors.red,
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
                                        Row(
                                          children: [
                                            Image(image: AssetImage(imagePage.star),
                                              color: colorPage.twentyone,),
                                            Text(details[index].rating,style: TextStyle(
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
                                      Text(details[index].amount,
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
