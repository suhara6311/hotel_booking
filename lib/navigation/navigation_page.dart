import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_booking/constants/color_page.dart';
import 'package:hotel_booking/constants/image_page.dart';
import 'package:hotel_booking/navigation/home_page.dart';
import 'package:hotel_booking/navigation/profile_page.dart';
import 'package:hotel_booking/navigation/search_page.dart';

import '../main.dart';
import 'booking_page.dart';

class navigationPage extends StatefulWidget {
  const navigationPage({super.key});

  @override
  State<navigationPage> createState() => _navigationPageState();
}

class _navigationPageState extends State<navigationPage> {
  List hotel=[
    homePage(),
    searchPage(),
    bookingPage(),
    profilePage(),

  ];
  int selectedIndex=0;
  void onItemTapped(int Index){
    setState(() {
      selectedIndex=Index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: colorPage.primaryColor,
       unselectedItemColor: colorPage.fifthColor,
       showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined),
            label: "Home"
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search),
            label: "Search"
          ),
          BottomNavigationBarItem(icon: Icon(Icons.book_online_outlined),
            label: "Booking"
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person),
            label: "Profile"
          ),


        ],
        onTap: onItemTapped,
        currentIndex: selectedIndex,
      ),
      backgroundColor: colorPage.thirdColor,
      body: hotel[selectedIndex],
    );
  }
}
