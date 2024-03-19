import 'package:hotel_booking/constants/image_page.dart';

class HotelDetails{
  String image;
  String title;
  String place;
  String amount;
  String amounttext;
  String rating;

  HotelDetails({required this.image,required this.title,
    required this.place,required this.amount,required this.amounttext,
    required this.rating});
}
  List<HotelDetails> details=[
    HotelDetails(
        image: imagePage.photos1,
        title: "Intercontinental Hotel",
        place: "Lagos, Nigeria",
        amount: "\$205",
        amounttext:"/night",
        rating: "5.0"
    ),
    HotelDetails(
        image: imagePage.photos2,
        title: "Nevada Hotel",
        place: "Lagos, Nigeria",
        amount: "\$107",
        amounttext:"/night",
        rating: "5.0"
    ),
    HotelDetails(
        image: imagePage.photos3,
        title: "Oriental Hotel",
        place: "Lagos, Nigeria",
        amount: "\$190",
        amounttext:"/night",
        rating: "5.0"
    ),
    HotelDetails(
        image: imagePage.photos4,
        title: "Federal Palace Hotel",
        place: "Lagos, Nigeria",
        amount: "\$200",
        amounttext:"/night",
        rating: "5.0"
    ),
    HotelDetails(
        image: imagePage.photos5,
        title: "Presidential Hotel",
        place: "Lagos, Nigeria",
        amount: "\$160",
        amounttext:"/night",
        rating: "5.0"
    ),
    HotelDetails(
        image: imagePage.photos6,
        title: "Radison Blue Hotel",
        place: "Lagos, Nigeria",
        amount: "\$210",
        amounttext:"/night",
        rating: "5.0"
    ),
    HotelDetails(
        image: imagePage.photos7,
        title: "Legent Hotel",
        place: "Lagos, Nigeria",
        amount: "\$205",
        amounttext:"/night",
        rating: "5.0"
    ),
    HotelDetails(
        image: imagePage.photos8,
        title: "The George Hotel",
        place: "Lagos, Nigeria",
        amount: "\$190",
        amounttext:"/night",
        rating: "5.0"
    ),
    HotelDetails(
        image: imagePage.photos9,
        title: "Nordic Hotel",
        place: "Lagos, Nigeria",
        amount: "\$175",
        amounttext:"/night",
        rating: "5.0"
    ),
  ];