import 'package:flutter/material.dart';
import 'package:hotel_booking/constants/color_page.dart';
import 'package:hotel_booking/constants/image_page.dart';
import 'package:hotel_booking/intro_screens/travel1_page.dart';
import 'package:hotel_booking/navigation/home_page.dart';
import 'package:hotel_booking/navigation/navigation_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../authentication/create_account.dart';
import '../authentication/sign_in.dart';
import '../main.dart';

class splashscreen1Page extends StatefulWidget {
  const splashscreen1Page({super.key});

  @override
  State<splashscreen1Page> createState() => _splashscreen1PageState();
}

class _splashscreen1PageState extends State<splashscreen1Page> {
  bool login = false;
  getAa() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    name=prefs.getString("name");
    email=prefs.getString("email");
    password=prefs.getString("password");
    image=prefs.getString("image");
    userId=prefs.getString("id")??"";
    // sure=save.getInt("select")!;
    login  = prefs.getBool('login')??false;
    setState(() {

    });
  }
  @override
  void initState(){
    getAa();
    // TODO: implement initstate
    Future.delayed(Duration(
        seconds: 4
    )).then((value) => Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) =>login ? navigationPage() : travel1Page(),)));
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: height*1,
        width: width*1,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  imagePage.bolu,
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
