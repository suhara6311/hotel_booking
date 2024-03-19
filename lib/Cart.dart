import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  List adding = [
    {
      "fruit name": "Apple",
      "quantity": 0,
      "price": 150,
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVCYAM_LthVgHHgm-F3sJRZmGpWNuIha3eAg&usqp=CAU"
    },
    {
      "fruit name": "Orange",
      "quantity": 1,
      "price": 100,
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFAJC2v2iUfc60l8WdxsYQlfQZtbvJ2QtV1w&usqp=CAU"
    },
    {
      "fruit name": "Grapes",
      "quantity": 0,
      "price": 120,
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_6pnVMJ-fWfM7VD56hZmG1c8jW_ziAssE5A&usqp=CAU"
    },
    {
      "fruit name": "Pinapple",
      "quantity": 0,
      "price": 120,
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvSO6xprsXtzj1Hi4RVMWqCt3VN7nisAJFKw&usqp=CAU"
    },
    {
      "fruit name": "Strawberry",
      "quantity": 1,
      "price": 200,
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGWQxB5e6x4xKDRAQCYAG-CHsfQVKsEccXIQ&usqp=CAU"
    },
    {
      "fruit name": "Mango",
      "quantity": 2,
      "price": 190,
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYIdsjvEGoxzH2uzVbX1UZ6a3L36Y9x4uN1A&usqp=CAU"
    },
  ];
  List select = [];
  double total = 0.0;
  List<QueryDocumentSnapshot<Map<String, dynamic>>>? data;
  getTotal() async {
    await FirebaseFirestore.instance
        .collection('cartitems')
        .snapshots()
        .listen((event) {
      total = 0;
      data = event.docs;
      print(event.docs[0].data());
      for (int i = 0; i < event.docs.length; i++) {
        // total = double.tryParse(event.docs[i].data()['quantity'].toString() )??0*
        // double.tryParse(event.docs[i].data()['price'].toString() )! + total;
        total = total +
            double.tryParse(event.docs[i].data()['quantity'].toString())! *
                double.tryParse(event.docs[i].data()['price'].toString())!;

        print(total);
      }
      setState(() {});
    });
    // for (int i = 0; i < adding.length; i++) {
    //   total = adding[i]["quantity"] * adding[i]["price"] + total;
    // }
  }

  @override
  void initState() {
    getTotal();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Container(
        color: Colors.white,
        height: width * 0.22,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Divider(
              endIndent: width * 0.04,
              indent: width * 0.04,
              thickness: width * 0.002,
              color: Colors.black.withOpacity(0.25),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Text(
                      "Total:$total",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: width * 0.055,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: width * 0.12,
                    width: width * 0.6,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(width * 0.07),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 4),
                              spreadRadius: 0,
                              blurRadius: 5,
                              color: Colors.black.withOpacity(0.25))
                        ]),
                    child: Center(
                      child: Text("Book Now!",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Center(
          child: Text("Cart",
              style: TextStyle(
                  fontSize: width * 0.08,
                  fontWeight: FontWeight.w400,
                  color: Colors.black)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: width * 2,
              width: width * 1,
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                itemCount: data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: width * 0.3,
                    width: width * 1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width * 0.03),
                        color: Colors.white,
                        border: Border.all(color: Colors.black)),
                    child: ListTile(
                      leading: Container(
                        height: width * 0.2,
                        width: width * 0.2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(width * 0.03),
                            color: Colors.redAccent,
                            image: DecorationImage(
                                image: NetworkImage(data![index]["image"]),
                                fit: BoxFit.fill)),
                      ),
                      title: Text(data![index]["name"],
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                              fontSize: width * 0.04)),
                      subtitle: Text(data![index]["price"].toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                              fontSize: width * 0.04)),
                      trailing: data![index]["quantity"] != 0
                          ? Container(
                              height: width * 0.08,
                              width: width * 0.2,
                              color: Colors.black,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      FirebaseFirestore.instance
                                          .collection('cartitems')
                                          .doc(data![index].id)
                                          .update({
                                        "quantity": data![index]["quantity"] + 1
                                      });
                                      getTotal();
                                      setState(() {});
                                    },
                                    child: Container(
                                      height: width * 0.07,
                                      width: width * 0.07,
                                      color: Colors.black,
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Text(data![index]["quantity"].toString(),
                                      style: TextStyle(color: Colors.white)),
                                  InkWell(
                                    onTap: () {
                                      FirebaseFirestore.instance
                                          .collection('cartitems')
                                          .doc(data![index].id)
                                          .update({
                                        "quantity": data![index]["quantity"] - 1
                                      });
                                      getTotal();
                                      setState(() {});
                                    },
                                    child: Container(
                                      height: width * 0.07,
                                      width: width * 0.07,
                                      color: Colors.black,
                                      child: Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : InkWell(
                              onTap: () {
                                FirebaseFirestore.instance
                                    .collection('cartitems')
                                    .doc(data![index].id)
                                    .update({
                                  "quantity": data![index]["quantity"] + 1
                                });
                                getTotal();
                                setState(() {});
                              },
                              child: Container(
                                height: width * 0.08,
                                width: width * 0.2,
                                color: Colors.black,
                                child: Center(
                                  child: Text(
                                    "Add",
                                    style: TextStyle(
                                        fontSize: width * 0.04,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: width * 0.02,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
