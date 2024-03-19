import 'package:flutter/material.dart';

class BannerUserModel{
  String ? image;
  String ? title;
  String ? place;
  String ? amount;
  String ? amounttext;
  String ? rating;
  String ? description;
  BannerUserModel({
    this.image,
    this.title,
    this.place,
    this.amount,
    this.amounttext,
    this.rating,
    this.description,
  });
  Map<String,dynamic>toMap(){
    return{
      "image":this.image,
      "title":this.title,
      "place":this.place,
      "amount":this.amount,
      "amounttext":this.amounttext,
      "rating":this.rating,
      "description":this.description,
    };
  }
  factory BannerUserModel.fromMap(Map<String,dynamic>map){
    return BannerUserModel(
      image: map['image']??"",
      title: map['title']??"",
      place: map['place']??"",
      amount: map['amount']??"",
      amounttext: map['amounttext']??"",
      rating: map['rating']??"",
      description: map['description']??"",
    );
  }
  BannerUserModel copyWith({
    String? image,
    String? title,
    String? place,
    String? amount,
    String? amounttext,
    String? rating,
    String? description,
  }){
    return BannerUserModel(
      image: image ?? this.image,
      title: title ?? this.title,
      place: place ?? this.place,
      amount: amount ?? this.amount,
      amounttext: amounttext ?? this.amounttext,
      rating: rating ?? this.rating,
      description: description ?? this.description,
    );
  }
}
