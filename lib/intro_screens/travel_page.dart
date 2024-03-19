import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hotel_booking/constants/color_page.dart';
import 'package:hotel_booking/constants/image_page.dart';
import 'package:hotel_booking/intro_screens/loading_page.dart';
import 'package:hotel_booking/intro_screens/splashscreen1_page.dart';
import 'package:hotel_booking/intro_screens/travel1_page.dart';
import 'package:introduction_screen/introduction_screen.dart';
import '../main.dart';
import 'onboarding_page.dart';

class travelPage extends StatefulWidget {
  const travelPage({super.key});

  @override
  State<travelPage> createState() => _travelPageState();
}

class _travelPageState extends State<travelPage> {
  int currentIndex=0;
  PageController controller=PageController();
  @override
  void initState(){
    // TODO: implement initstate
    Future.delayed(Duration(
        seconds: 4
    )).then((value) => Navigator.push(context,
        MaterialPageRoute(builder: (context) => loadingPage(),)));
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: width*1.6,
            width: width*1,
            // color: Colors.red,
            child: PageView.builder(
              controller: controller,
              padEnds: false,
              itemCount: contents.length,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex=index;
                  });
                },
                itemBuilder: (_,i){
                return Column(
                  children: [
                    Container(
                      height: width*1.1,
                      width: width*1,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(contents[i].image),
                        )
                      ),
                    ),
                    SizedBox(height: width*0.06,),
                    Text(contents[i].title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: colorPage.secondaryColor,
                        fontSize: width*0.09,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                    SizedBox(height: width*0.06,),
                    Text(
                    contents[i].discription,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: colorPage.fifthColor,
                        fontSize: width*0.042,
                      ),
                    )
                  ],
                );
    }
            ),
          ),
          SizedBox(height: width*0.06,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                3, (index) => Container(
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
              if(currentIndex==2){
                Navigator.push(context, MaterialPageRoute(builder:
                    (context)=> loadingPage()));
              }
              else{
                controller.nextPage(duration: Duration(milliseconds: 100),
                    curve: Curves.easeIn);
              }
            },
            child: Container(
              height: width*0.13,
              width: width*0.8,
             child:  Center(
               child: Text(currentIndex==2 ? "Done" : "Next",
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
          currentIndex==2 ? SizedBox() : InkWell(
            onTap: () {
              controller.jumpToPage(2);
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
          SizedBox(height: width*0.1,)

        ],
      ),
    );

  }
}
