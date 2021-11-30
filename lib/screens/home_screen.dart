import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';
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
                'Hi, What are you looking for?',
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
/** ***********Custom scroll view an alternative for the listview builder*********/

// CustomScrollView(
//   scrollDirection: Axis.horizontal,
//   slivers: <Widget>[
//     SliverList(

//       delegate: SliverChildBuilderDelegate(
//         (context, index) => _buildIcon(index),
//         childCount: _icons.length,
//       ),
//     ),
//   ],
// ),

//*****listview of destinations****//
// SizedBox(
//   height: 200.0,
//   child: SizedBox(
//     child: ListView.separated(
//       separatorBuilder: (BuildContext context, int index) =>
//           Container(
//         width: 10,
//       ),
//       scrollDirection: Axis.horizontal,
//       itemCount: destinations.length,
//       itemBuilder: (BuildContext context, int index) {
//         return Container(
//           margin: const EdgeInsets.all(8),
//           height: 100,
//           decoration: BoxDecoration(
//               color: Colors.white70,
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.5),
//                   spreadRadius: 2,
//                   blurRadius: 7,
//                   offset: const Offset(
//                       0, 3), // changes position of shadow
//                 ),
//               ],
//               borderRadius: BorderRadius.circular(10.0)),
//           child: Column(
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(60.0)),
//                 child: Image.asset(
//                   destinations[index].imageUrl,
//                   width: 150,
//                   height: 140,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               const SizedBox(
//                 height: 8,
//               ),
//               Text(
//                 destinations[index].city,
//                 style: const TextStyle(
//                   fontSize: 16.0,
//                   fontWeight: FontWeight.bold,
//                 ),
//               )
//             ],

//             // subtitle: ,
//           ),
//         );
//       },
//     ),
//   ),
// ),
