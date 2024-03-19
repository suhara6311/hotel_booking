import 'package:flutter/material.dart';
import 'package:hotel_booking/constants/color_page.dart';
import 'package:hotel_booking/constants/image_page.dart';
import 'package:hotel_booking/main.dart';
import 'package:hotel_booking/intro_screens/splashscreen1_page.dart';
import 'package:widget_loading/widget_loading.dart';

class loadingPage extends StatefulWidget {
  const loadingPage({super.key});

  @override
  State<loadingPage> createState() => _loadingPageState();
}

class _loadingPageState extends State<loadingPage> {
  @override
  // void initState(){
  //   // TODO: implement initstate
  //   Future.delayed(Duration(
  //       seconds: 4
  //   )).then((value) => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => splashscreen1Page(),), (route) => false));
  //   super.initState();
  // }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPage.primaryColor,
      body: Column(
        children: [
          Container(
            height: height*1,
            width: width*1,
            decoration: BoxDecoration(
              color: colorPage.primaryColor
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(imagePage.loading),
                SizedBox(height: width*0.4,),
                CircularWidgetLoading(
                  dotColor: colorPage.thirdColor,
                  padding: EdgeInsets.all(width*0.15),
                  child: Center(child: Text('Loaded!')),
                  loading: true,
                ),
                SizedBox(height: width*0.2,)
              ],
            ),
          )
        ],
      ),
    );
  }
}
