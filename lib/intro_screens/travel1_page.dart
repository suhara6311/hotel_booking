import 'package:flutter/material.dart';
import 'package:hotel_booking/constants/color_page.dart';
import 'package:hotel_booking/constants/image_page.dart';
import 'package:hotel_booking/intro_screens/loading1_page.dart';
import 'package:hotel_booking/intro_screens/onboarding2_page.dart';

import '../main.dart';

class travel1Page extends StatefulWidget {
  const travel1Page({super.key});

  @override
  State<travel1Page> createState() => _travel1PageState();
}

class _travel1PageState extends State<travel1Page> {
  int currentIndex=0;
  PageController pageCont=PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: height*0.7,
            width: width*1,
            // color: Colors.red,
            child: PageView.builder(
                controller: pageCont,
                padEnds: false,
                itemCount: contents1.length,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex=index;
                  });
                },
                itemBuilder: (context,index){
                  return Container(
                    height: height*0.5,
                    width: width,
                    child: Stack(
                      children: [
                        Container(
                          height: width*0.9,
                          width: width*1,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              image: DecorationImage(
                                  image: AssetImage(contents1[index].image),
                                  fit: BoxFit.fill
                              ),
                              borderRadius: BorderRadius.circular(width*0.05)
                          ),
                        ),
                        Positioned(
                          bottom:width*0.25,
                          left: width*0.03,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(contents1[index].title,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width*0.1,
                                    fontWeight: FontWeight.w800
                                ),),
                              SizedBox(height: width*0.03,),
                              Text(contents1[index].title2,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width*0.1,
                                    fontWeight: FontWeight.w800
                                ),),
                              SizedBox(height: width*0.03,),
                              Text(contents1[index].title3,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width*0.1,
                                    fontWeight: FontWeight.w800
                                ),),
                              SizedBox(height: width*0.03,),
                              Text(contents1[index].title4,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width*0.1,
                                    fontWeight: FontWeight.w800
                                ),),
                              SizedBox(height: width*0.03,),
                              Text(contents1[index].title5,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width*0.1,
                                    fontWeight: FontWeight.w800
                                ),),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(width*0.03),
                              child: Text(
                                contents1[index].discription,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: colorPage.fifthColor,
                                  fontSize: width*0.042,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }
            ),
          ),
          SizedBox(height: width*0.06,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                contents1.length, (index) => Container(
              height: width*0.04,
              width: currentIndex == index ? width*0.095:width*0.04,
              margin: EdgeInsets.only(right: width*0.04),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(width*0.03),
                color: currentIndex == index ? colorPage.primaryColor :
                colorPage.sixthColor,
              ),
            )),
          ),
          SizedBox(height: width*0.06,),
          InkWell(
            onTap: () {
              if(currentIndex==contents1.length-1){
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:
                    (context)=> loading1Page()), (route) => false);
              }
              else{
                pageCont.nextPage(duration: Duration(milliseconds: 100),
                    curve: Curves.easeIn);
              }
            },
            child: Container(
              height: width*0.13,
              width: width*0.8,
              child:  Center(
                child: Text(currentIndex==contents1.length-1 ? "Done" : "Next",
                  style: TextStyle(
                      fontSize: width*0.05,
                      color: colorPage.thirdColor,
                      fontWeight: FontWeight.w600
                  ),),
              ),
              decoration: BoxDecoration(
                color: colorPage.primaryColor,
                borderRadius: BorderRadius.circular(width*0.1),
              ),
            ),
          ),
          SizedBox(height: width*0.06,),
          currentIndex==contents1.length-1 ? SizedBox() : InkWell(
            onTap: () {
              pageCont.jumpToPage(contents1.length-1);
            },
            child: Container(
              height: width*0.13,
              width: width*0.8,
              child:  Center(
                child: Text("Skip",
                  style: TextStyle(
                      fontSize: width*0.05,
                      color: colorPage.seventhColor,
                      fontWeight: FontWeight.w600
                  ),),
              ),
              decoration: BoxDecoration(
                color: colorPage.sixthColor,
                borderRadius: BorderRadius.circular(width*0.1),
              ),
            ),
          ),
        ],
      ),

    );
  }
}
