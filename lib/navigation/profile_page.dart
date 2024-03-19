import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hotel_booking/authentication/create_account.dart';
import 'package:hotel_booking/authentication/log_in.dart';
import 'package:hotel_booking/authentication/sign_in.dart';
import 'package:hotel_booking/constants/color_page.dart';
import 'package:hotel_booking/constants/image_page.dart';
import 'package:hotel_booking/profile/edit_profile.dart';
import 'package:hotel_booking/profile/notification.dart';
import 'package:hotel_booking/profile/security.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class profilePage extends StatefulWidget {
  const profilePage({super.key});

  @override
  State<profilePage> createState() => _profileState();
}

//String? currentUserId;

class _profileState extends State<profilePage> {
  var file;
  String imageUrl = "";
  pickfile(ImageSource) async {
    final imagefile = await ImagePicker.platform.pickImage(source: ImageSource);
    file = File(imagefile!.path);
    if (mounted) {
      setState(() {
        file = File(imagefile!.path);
      });
      uploadFile();
      Navigator.pop(context);
    }
  }

  uploadFile() async {
    var uploadTask = await FirebaseStorage.instance
        .ref('uploads')
        .child(DateTime.now().toString())
        .putFile(file!, SettableMetadata(contentType: "image/jpeg"));
    var getUrl = await uploadTask.ref.getDownloadURL();
    imageUrl = getUrl;
    setState(() {});
  }

  //  String? currentUserEmail;
  // String? currentUserName;
  // String? currentUserNickname;
  // String? currentUserDOB;
  // String currentUserImage = "";
  // String? currentUserNumber;
  // String? currentUserGender;
  //  getData() async {
  //    SharedPreferences prefs = await SharedPreferences.getInstance();
  //    currentUserId = prefs.getString("id");
  //    var data=await FirebaseFirestore.instance.collection('users').where("id",isEqualTo: currentUserId).get();
  //    currentUserEmail = data.docs[0]["email"];
  //    currentUserName = data.docs[0]["name"];
  //    currentUserNickname = data.docs[0]["nickname"];
  //    currentUserDOB = data.docs[0]["dob"];
  //    currentUserImage = data.docs[0]["image"] ?? "";
  //    currentUserNumber = data.docs[0]["phonenumber"];
  //    currentUserGender = data.docs[0]["gender"];
  //  }

  bool toggle = false;
  @override
  void initState() {
    // getData();
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPage.thirdColor,
      appBar: AppBar(
        backgroundColor: colorPage.thirdColor,
        elevation: 0,
        toolbarHeight: width * 0.25,
        leadingWidth: width * 0.6,
        leading: Row(
          children: [
            SizedBox(
              width: width * 0.02,
            ),
            SvgPicture.asset(imagePage.bol),
            SizedBox(
              width: width * 0.02,
            ),
            Text(
              "Profile",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: width * 0.07,
                  color: colorPage.secondaryColor),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection('users')
                .doc(userId)
                .snapshots(),
            builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              }
              print("22222222222222222222222222222222222222222$userId");
              var data = snapshot.data;
              print(data!.data());

              return Column(
                children: [
                  Center(
                    child: Container(
                      height: width * 0.4,
                      width: width * 0.4,
                      // color: Colors.red,
                      child: Stack(
                        children: [
                          //imageUrl!=""?
                          CircleAvatar(
                            radius: width * 0.18,
                            backgroundImage: NetworkImage(data['image']),
                          ),
                            //   : CircleAvatar(
                            //   radius: width * 0.18,
                            //   backgroundColor: Colors.red,
                            //   //backgroundImage: NetworkImage(""),
                            // ),
                          Positioned(
                            top: width * 0.27,
                            left: width * 0.27,
                            child: InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(width * 0.06),
                                      ),
                                      content: Container(
                                        height: height * 0.3,
                                        width: width * 1,
                                        margin: EdgeInsets.all(width * 0.01),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              "choose the file",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: width * 0.07,
                                                  color: colorPage.twentynine),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    pickfile(
                                                        ImageSource.camera);
                                                  },
                                                  child: Container(
                                                    height: width * 0.15,
                                                    width: width * 0.3,
                                                    decoration: BoxDecoration(
                                                        color: colorPage
                                                            .sixthColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    width *
                                                                        0.07),
                                                        boxShadow: [
                                                          BoxShadow(
                                                              blurRadius: 5,
                                                              spreadRadius: 0,
                                                              offset:
                                                                  Offset(0, 4),
                                                              color: colorPage
                                                                  .secondaryColor
                                                                  .withOpacity(
                                                                      0.25))
                                                        ]),
                                                    child: Center(
                                                      child: Text("Camera",
                                                          style: TextStyle(
                                                              color: colorPage
                                                                  .primaryColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: width *
                                                                  0.05)),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: width * 0.02,
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    pickfile(
                                                        ImageSource.gallery);
                                                  },
                                                  child: Container(
                                                    height: width * 0.15,
                                                    width: width * 0.3,
                                                    decoration: BoxDecoration(
                                                        color: colorPage
                                                            .primaryColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    width *
                                                                        0.07),
                                                        boxShadow: [
                                                          BoxShadow(
                                                              blurRadius: 5,
                                                              spreadRadius: 0,
                                                              offset:
                                                                  Offset(0, 4),
                                                              color: colorPage
                                                                  .primaryColor
                                                                  .withOpacity(
                                                                      0.25))
                                                        ]),
                                                    child: Center(
                                                      child: Text("Gallery",
                                                          style: TextStyle(
                                                              fontSize:
                                                                  width * 0.05,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color: colorPage
                                                                  .thirdColor)),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Container(
                                  height: width * 0.1,
                                  width: width * 0.1,
                                  child: SvgPicture.asset(imagePage.pencil)
                                  // decoration: BoxDecoration(
                                  //   image: DecorationImage(image: AssetImage(imagePage.pencil))
                                  // ),
                                  ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: width * 0.03,
                  ),
                  Text(
                    data["name"],
                    style: TextStyle(
                        fontSize: width * 0.063, fontWeight: FontWeight.w700),
                  ),
                  Text(
                   data["email"],
                    style: TextStyle(
                        fontWeight: FontWeight.w600, fontSize: width * 0.036),
                  ),
                  InkWell(
                    onTap: () {
                      // getData();

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => editProfile(
                              id: data.id,
                              name:data["name"],
                              nickname: data["nickname"],
                              dob: data["dob"],
                              email: data["email"],
                              phonenumber: data["phonenumber"],
                              gender: data["gender"],
                            ),
                          ));
                    },
                    child: ListTile(
                      leading: SvgPicture.asset(imagePage.pro),
                      title: Text("Edit Profile",
                          style: TextStyle(
                              fontSize: width * 0.043,
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
                  ListTile(
                    leading: SvgPicture.asset(imagePage.pay),
                    title: Text("Payment",
                        style: TextStyle(
                            fontSize: width * 0.043,
                            fontWeight: FontWeight.w600)),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => notification(),
                          ));
                    },
                    child: ListTile(
                      leading: SvgPicture.asset(imagePage.noti),
                      title: Text("Notifications",
                          style: TextStyle(
                              fontSize: width * 0.043,
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => security(),
                          ));
                    },
                    child: ListTile(
                      leading: SvgPicture.asset(imagePage.security),
                      title: Text("Security",
                          style: TextStyle(
                              fontSize: width * 0.043,
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
                  ListTile(
                    leading: SvgPicture.asset(imagePage.help),
                    title: Text("Help",
                        style: TextStyle(
                            fontSize: width * 0.043,
                            fontWeight: FontWeight.w600)),
                  ),
                  ListTile(
                    leading: SvgPicture.asset(imagePage.eye),
                    title: Text("Dark Theme",
                        style: TextStyle(
                            fontSize: width * 0.043,
                            fontWeight: FontWeight.w600)),
                    trailing: Stack(children: [
                      InkWell(
                        onTap: () {
                          toggle = !toggle;
                          setState(() {});
                        },
                        child: Container(
                          height: width * 0.07,
                          width: width * 0.12,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(width * 0.05),
                              color: toggle ? Colors.green : Colors.grey[400]),
                        ),
                      ),
                      AnimatedPositioned(
                        duration: Duration(
                          milliseconds: 200,
                        ),
                        curve: Curves.easeIn,
                        left: toggle ? width * 0.05 : 0,
                        right: toggle ? 0 : width * 0.05,
                        child: InkWell(
                          onTap: () {
                            toggle = !toggle;
                            setState(() {});
                          },
                          child: AnimatedContainer(
                            duration: Duration(
                              milliseconds: 200,
                            ),
                            height: width * 0.07,
                            width: width * 0.07,
                            curve: Curves.easeIn,
                            decoration: BoxDecoration(
                                color: Colors.white, shape: BoxShape.circle),
                          ),
                        ),
                      ),
                      // AnimatedPositioned(
                      //   duration: Duration(
                      //       milliseconds: 50
                      //   ),
                      //   left: toggle ? width*0.05 : width*0.1,
                      //   right: toggle ? width*0.1 : 0,
                      //   top: width*0.02,
                      //   child: Text(toggle ? "ON" : "OFF",
                      //     style: TextStyle(
                      //         color:toggle ? Colors.white : Colors.black,
                      //         fontSize: width*0.03
                      //     ),
                      //   ),
                      // ),
                    ]),
                  ),
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(width * 0.08),
                              topRight: Radius.circular(width * 0.08)),
                        ),
                        constraints: BoxConstraints(
                            maxHeight: width * 0.7, maxWidth: width * 1),
                        context: context,
                        isDismissible: false,
                        builder: (context) {
                          return Container(
                            width: width * 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Log Out",
                                  style: TextStyle(
                                      color: colorPage.twentynine,
                                      fontSize: width * 0.055,
                                      fontWeight: FontWeight.w700),
                                ),
                                Divider(
                                  color: colorPage.secondaryColor
                                      .withOpacity(0.25),
                                  endIndent: width * 0.04,
                                  indent: width * 0.04,
                                ),
                                Text(
                                  "Are you sure you want to log out?",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: width * 0.05),
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    InkWell(
                                      onTap: () async {
                                        GoogleSignIn().signOut();
                                        SharedPreferences prefs =
                                            await SharedPreferences
                                                .getInstance();
                                        prefs.remove("login");
                                        prefs.remove("name");
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => signIn(),
                                            ),
                                            (route) => false);
                                      },
                                      child: Container(
                                        height: width * 0.15,
                                        width: width * 0.7,
                                        decoration: BoxDecoration(
                                            color: colorPage.primaryColor,
                                            borderRadius: BorderRadius.circular(
                                                width * 0.07),
                                            boxShadow: [
                                              BoxShadow(
                                                  blurRadius: 5,
                                                  spreadRadius: 0,
                                                  offset: Offset(0, 4),
                                                  color: colorPage.primaryColor
                                                      .withOpacity(0.25))
                                            ]),
                                        child: Center(
                                          child: Text("Yes, Logout",
                                              style: TextStyle(
                                                  color: colorPage.thirdColor,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: width * 0.05)),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: width * 0.02,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        height: width * 0.15,
                                        width: width * 0.7,
                                        decoration: BoxDecoration(
                                            color: colorPage.sixthColor,
                                            borderRadius: BorderRadius.circular(
                                                width * 0.07),
                                            boxShadow: [
                                              BoxShadow(
                                                  blurRadius: 5,
                                                  spreadRadius: 0,
                                                  offset: Offset(0, 4),
                                                  color: colorPage
                                                      .secondaryColor
                                                      .withOpacity(0.25))
                                            ]),
                                        child: Center(
                                          child: Text("Cancel",
                                              style: TextStyle(
                                                  fontSize: width * 0.05,
                                                  fontWeight: FontWeight.w600,
                                                  color:
                                                      colorPage.primaryColor)),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: ListTile(
                      leading: SvgPicture.asset(imagePage.logout),
                      title: Text("Logout",
                          style: TextStyle(
                              color: colorPage.twentynine,
                              fontSize: width * 0.043,
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
