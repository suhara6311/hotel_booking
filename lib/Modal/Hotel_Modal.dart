class HotelUserModel{
  String ? image;
  String ? title;
  String ? place;
  String ? amount;
  String ? category;
  String ? rating;
  String ? description;
  List ? addimage;
  HotelUserModel({
    this.image,
    this.title,
    this.place,
    this.amount,
    this.category,
    this.rating,
    this.description,
    this.addimage,
  });
  Map<String,dynamic>toMap(){
    return{
      "image":this.image,
      "title":this.title,
      "place":this.place,
      "amount":this.amount,
      "category":this.category,
      "rating":this.rating,
      "description":this.description,
      "addimage":this.addimage,
    };
  }
  factory HotelUserModel.fromMap(Map<String,dynamic>map){
    return HotelUserModel(
      image: map['image']??"",
      title: map['title']??"",
      place: map['place']??"",
      amount: map['amount']??"",
      category: map['category']??"",
      rating: map['rating']??"",
      description: map['description']??"",
      addimage: map['addimage']??"",
    );
  }
  HotelUserModel copyWith({
    String? image,
    String? title,
    String? place,
    String? amount,
    String? category,
    String? rating,
    String? description,
    List? addimage,
  }){
    return HotelUserModel(
      image: image ?? this.image,
      title: title ?? this.title,
      place: place ?? this.place,
      amount: amount ?? this.amount,
      category: category ?? this.category,
      rating: rating ?? this.rating,
      description: description ?? this.description,
      addimage: addimage ?? this.addimage,
    );
  }
}
