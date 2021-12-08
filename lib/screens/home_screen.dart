import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:travel_ui_app/models/user_model.dart';
import 'package:travel_ui_app/widgets/bottom_navigation_bar.dart';
import 'package:travel_ui_app/widgets/destination_carousel.dart';
import 'package:travel_ui_app/widgets/hotel_carousel.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedTopIndex = 0;

  final List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking,
  ];

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        log(_selectedTopIndex.toString());
        setState(() {
          _selectedTopIndex = index;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: _selectedTopIndex == index
              ? Theme.of(context).colorScheme.secondary
              : const Color(0xFFE7EBEE),
          borderRadius: BorderRadius.circular(30.0),
        ),
        height: 60.0,
        width: 60.0,
        child: Icon(
          _icons[index],
          size: 20.0,
          color: _selectedTopIndex == index
              ? Theme.of(context).primaryColor
              : const Color(0xFFB4C1C4),
        ),
      ),
    );
  }

//recieve data from firebase
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyBottomNavigation(),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 3.5.h),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                left: 5.w,
                right: 10.w,
              ),
              child: Text(
                "Hi ${loggedInUser.firstName}, What are you looking for?",
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            SizedBox(
              height: 2.5.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _icons
                  .asMap()
                  .entries
                  .map(
                    (MapEntry map) => _buildIcon(map.key),
                  )
                  .toList(),
            ),
            SizedBox(
              height: 1.4.h,
            ),
            const DestinationCarousel(),
            SizedBox(
              height: 0.2.h,
            ),
            const HotelCarousel(),
            const SizedBox(height: 2.0),
          ],
        ),
      ),
    );
  }
}
