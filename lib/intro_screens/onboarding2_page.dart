import 'package:hotel_booking/constants/image_page.dart';

class UnbordingContent1{
  String image;
  String title;
  String title2;
  String title3;
  String title4;
  String title5;
  String discription;

  UnbordingContent1({required this.image, required this.title,required this.title2,required this.title3,required this.title4,
    required this.title5, required this.discription});
}
List<UnbordingContent1> contents1=[
  UnbordingContent1(
    title:"Let’s ",
    title2: "have the",
    title3: "best",
    title4: "vacation",
    title5: "with us",
    image: imagePage.curve,
    discription:"Lorem ipsum dolor sit amet, consectetur adipiscing elit,"
        " sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
  ),
  UnbordingContent1(
    title:"",
    title2: "Travel",
    title3: "made easy",
    title4: "in your",
    title5: "hands",
    image: imagePage.vehicle,
    discription:"Lorem ipsum dolor sit amet, consectetur adipiscing elit,"
        " sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
  ),
  UnbordingContent1(
    title:"",
    title2: "Let’s",
    title3: "discover",
    title4: "the world",
    title5: "with us",
    image: imagePage.mountain,
    discription:"Lorem ipsum dolor sit amet, consectetur adipiscing elit,"
        " sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
  ),
];



