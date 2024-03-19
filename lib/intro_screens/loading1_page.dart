import 'package:flutter/material.dart';
import 'package:hotel_booking/authentication/sign_in.dart';
import 'package:hotel_booking/constants/color_page.dart';
import 'package:hotel_booking/constants/image_page.dart';
import 'package:hotel_booking/navigation/navigation_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:widget_loading/widget_loading.dart';

import '../authentication/create_account.dart';
import '../main.dart';

class loading1Page extends StatefulWidget {
  const loading1Page({super.key});

  @override
  State<loading1Page> createState() => _loading1PageState();
}

class _loading1PageState extends State<loading1Page> {
  bool login = false;
  getAa() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    name = prefs.getString("name");
    email = prefs.getString("email");
    password = prefs.getString("password");
    image = prefs.getString("image");
    userId = prefs.getString("id");
    // sure=save.getInt("select")!;
    login = prefs.getBool('login') ?? false;
    setState(() {});
  }

  @override
  void initState() {
    getAa();
    // TODO: implement initstate
    Future.delayed(Duration(seconds: 4)).then((value) =>
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => login ? navigationPage() : signIn())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPage.thirdColor,
      body: Column(
        children: [
          Container(
            height: height * 1,
            width: width * 1,
            decoration: BoxDecoration(color: colorPage.thirdColor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(imagePage.loading1),
                SizedBox(
                  height: width * 0.4,
                ),
                CircularWidgetLoading(
                  dotColor: colorPage.primaryColor,
                  padding: EdgeInsets.all(width * 0.15),
                  child: Center(child: Text('Loaded!')),
                  loading: true,
                ),
                SizedBox(
                  height: width * 0.2,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
