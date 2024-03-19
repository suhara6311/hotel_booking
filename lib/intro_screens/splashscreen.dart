import 'package:flutter/material.dart';
import 'package:hotel_booking/constants/color_page.dart';
import 'package:hotel_booking/constants/image_page.dart';
import 'package:hotel_booking/intro_screens/travel_page.dart';

import '../main.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {

  @override
  // void initState(){
  //   // TODO: implement initstate
  //   Future.delayed(Duration(
  //     seconds: 4
  //   )).then((value) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => travelPage(),)));
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: height*1,
        width: width*1,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
            imagePage.bgimage,
            ),fit: BoxFit.fill
          )
        ),
        child: Padding(
          padding:  EdgeInsets.only(left: width*0.08),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("Welcome to",style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: width*0.12,
                color: colorPage.thirdColor
              )),
              SizedBox(height: width*0.001,),
              Text("Bolu",style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: width*0.3,
                color: colorPage.primaryColor
              ),),
              SizedBox(height: width*0.1,),
              Text("The best hotel bookings in the century to accompany your vacation",
                style: TextStyle(
                fontWeight: FontWeight.w600,
                  fontSize: width*0.04,
                  color: colorPage.thirdColor
              ),),
              SizedBox(height: width*0.2,)
            ],
          ),
        ),
      ),
    );
  }
}
