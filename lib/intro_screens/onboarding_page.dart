class UnbordingContent{
  String image;
  String title;
  String discription;

  UnbordingContent({required this.image, required this.title,
    required this.discription});
}
  List<UnbordingContent> contents=[
    UnbordingContent(
      title:"Travel safely, comfortably, & easily",
      image: "assets/images/travel.png",
      discription:"Lorem ipsum dolor sit amet, consectetur adipiscing elit,"
          " sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    ),
    UnbordingContent(
      title:"Find the best hotels for your vacation",
      image:"assets/images/hotel.png",
      discription:"Lorem ipsum dolor sit amet, consectetur adipiscing elit,"
          " sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    ),
    UnbordingContent(
      title:"Let’s discover the world with us",
      image:"assets/images/world.png",
      discription:"Lorem ipsum dolor sit amet, consectetur adipiscing elit,"
          " sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    ),
  ];



