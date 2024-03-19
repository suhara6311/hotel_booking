import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking/Cart.dart';
import 'package:hotel_booking/Cart_example.dart';
import 'package:hotel_booking/authentication/create_account.dart';
import 'package:hotel_booking/authentication/create_info.dart';
import 'package:hotel_booking/authentication/log_in.dart';
import 'package:hotel_booking/authentication/sign_in.dart';
import 'package:hotel_booking/forgot_password/page1.dart';
import 'package:hotel_booking/forgot_password/page2.dart';
import 'package:hotel_booking/forgot_password/page3.dart';
import 'package:hotel_booking/intro_screens/loading1_page.dart';
import 'package:hotel_booking/intro_screens/loading_page.dart';
import 'package:hotel_booking/intro_screens/splashscreen.dart';
import 'package:hotel_booking/intro_screens/splashscreen1_page.dart';
import 'package:hotel_booking/navigation/booking_page.dart';
import 'package:hotel_booking/hotel/calender.dart';
import 'package:hotel_booking/hotel/cancelhotel.dart';
import 'package:hotel_booking/booking/completed.dart';
import 'package:hotel_booking/profile/edit_profile.dart';
import 'package:hotel_booking/navigation/home_page.dart';
import 'package:hotel_booking/hotel/hotel.dart';
import 'package:hotel_booking/home/my_bookmark.dart';
import 'package:hotel_booking/navigation/navigation_page.dart';
import 'package:hotel_booking/hotel/newcard.dart';
import 'package:hotel_booking/profile/notification.dart';
import 'package:hotel_booking/hotel/payment1.dart';
import 'package:hotel_booking/hotel/payment2.dart';
import 'package:hotel_booking/hotel/payment3.dart';
import 'package:hotel_booking/navigation/profile_page.dart';
import 'package:hotel_booking/home/recently_booked.dart';
import 'package:hotel_booking/home/recommended.dart';
import 'package:hotel_booking/hotel/reservation.dart';
import 'package:hotel_booking/navigation/search_page.dart';
import 'package:hotel_booking/profile/security.dart';
import 'package:hotel_booking/hotel/ticket.dart';

import 'main_pages/mybooking.dart';
var width;
var height;
Future<void> main() async {
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();
  runApp(myApp());
}
class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
     width=MediaQuery.of(context).size.width;
     height=MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: MaterialApp(
        theme: ThemeData(
          textTheme: GoogleFonts.urbanistTextTheme()
        ),
        home: splashscreen1Page(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
