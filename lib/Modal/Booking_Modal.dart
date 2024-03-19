import 'dart:ffi';

class BookingModal{
  String userId;
  String time;
  String fromdate;
  String todate;
  String guest;
  double price;
  String customername;
  String customernickname;
  String dob;
  String email;
  String phonenumber;
  int paymentmethod;
  String hotelId;
  String bookingId;

  BookingModal({
    required this.userId,
    required this.time,
    required this.fromdate,
    required this.todate,
    required this.guest,
    required this.price,
    required this.customername,
    required this.customernickname,
    required this.dob,
    required this.email,
    required this.phonenumber,
    required this.paymentmethod,
    required this.hotelId,
    required this.bookingId,
});

  Map<String,dynamic>toMap(){
    return{
      "userId":this.userId,
      "time":this.time,
      "fromdate":this.fromdate,
      "todate":this.todate,
      "guest":this.guest,
      "price":this.price,
      "customername":this.customername,
      "customernickname":this.customernickname,
      "dob":this.dob,
      "email":this.email,
      "phonenumber":this.phonenumber,
      "paymentmethod":this.paymentmethod,
      "hotelId":this.hotelId,
      "bookingId":this.bookingId,
    };
  }

  factory BookingModal.fromMap(Map<String,dynamic>Map){
    return BookingModal(
      userId: Map["userId"]??"",
      time: Map["time"]??"",
      fromdate: Map["fromdate"]??"",
      todate: Map["todate"]??"",
      guest: Map["guest"]??"",
      price: Map["price"]??"",
      customername: Map["customername"]??"",
      customernickname: Map["customernickname"]??"",
      dob: Map["dob"]??"",
      email: Map["email"]??"",
      phonenumber: Map["phonenumber"]??"",
      paymentmethod: Map["paymentmethod"]??"",
      hotelId: Map["hotelId"]??"",
      bookingId: Map["bookingId"]??"",

    );
  }
  BookingModal copyWith({
    String? userId,
    String? time,
    String? fromdate,
    String? todate,
    String? guest,
    double? price,
    String? customername,
    String? customernickname,
    String? dob,
    String? email,
    String? phonenumber,
    int? paymentmethod,
    String? hotelId,
    String? bookingId,
})  {
    return BookingModal(
      userId: userId ?? this.userId,
      time: time ?? this.time,
      fromdate: fromdate ?? this.fromdate,
      todate: todate ?? this.todate,
      guest: guest ?? this.guest,
      price: price ?? this.price,
      customername: customername ?? this.customername,
      customernickname: customernickname ?? this.customernickname,
      dob: dob ?? this.dob,
      email: email ?? this.email,
      phonenumber: phonenumber ?? this.phonenumber,
      paymentmethod: paymentmethod ?? this.paymentmethod,
      hotelId: hotelId ?? this.hotelId,
      bookingId: bookingId ?? this.bookingId,
    );
  }

}