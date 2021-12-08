// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

import 'package:travel_ui_app/models/hotel_model.dart';

class HotelScreen extends StatefulWidget {
  late Hotel hotel;
  HotelScreen(this.hotel, {Key? key}) : super(key: key);

  @override
  _HotelScreenState createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 40.5.h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black38,
                      offset: Offset(0.0, 2.0),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Hero(
                  tag: widget.hotel.imageURL,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Image(
                      image: AssetImage(widget.hotel.imageURL),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 3.5.h, horizontal: 3.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      color: Colors.white,
                      iconSize: 29.sp,
                      icon: const Icon(Icons.arrow_back_rounded),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Row(
                      children: <Widget>[
                        IconButton(
                          color: Colors.white,
                          iconSize: 22.sp,
                          icon: const Icon(Icons.search),
                          onPressed: () {},
                        ),
                        IconButton(
                          color: Colors.white,
                          iconSize: 22.sp,
                          icon: const Icon(FontAwesomeIcons.sortAmountDown),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 5.h,
                left: 5.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Text(
                    //   widget.hotel.name,
                    //   style: Theme.of(context).textTheme.subtitle1?.copyWith(
                    //         fontSize: 26.sp,
                    //       ),
                    // ),
                    Row(
                      children: [
                        const Icon(
                          FontAwesomeIcons.locationArrow,
                          size: 13.0,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 1.5.w,
                        ),
                        Text(
                          widget.hotel.address,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2
                              ?.copyWith(fontSize: 20.sp, color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 5.h,
                right: 5.h,
                child: Icon(
                  Icons.location_on,
                  color: Colors.white,
                  size: 25.sp,
                ),
              )
            ],
          ),
          SizedBox(
            height: 1.1.h,
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 0.5.h),
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                return Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(5.w, 1.6.h, 4.w, 1.h),
                      width: 90.w,
                      height: 20.h,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF3F5F7),
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(0.0, 2.0),
                            color: Colors.black45,
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(6.w, 0.5.h, 3.5.w, 2.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              children: [
                                Positioned(
                                  top: 2.h,
                                  child: Icon(
                                    FontAwesomeIcons.landmark,
                                    size: 20.sp,
                                  ),
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Container(
                                  padding: EdgeInsets.only(bottom: 1.h),
                                  width: 70.w,
                                  child: Text(
                                    hotels[index].name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        ?.copyWith(
                                          color: Colors.black87,
                                          letterSpacing: 0.1.sp,
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 12.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Rate: Rs.${hotels[index].price}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1
                                            ?.copyWith(
                                              letterSpacing: 0.1.sp,
                                              fontSize: 14.sp,
                                              color: Colors.grey[600],
                                              fontWeight: FontWeight.w400,
                                            ),
                                      ),
                                      SizedBox(
                                        width: 1.w,
                                      ),
                                      Text(
                                        'per pax',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1
                                            ?.copyWith(
                                              letterSpacing: 0.1.sp,
                                              fontSize: 10.sp,
                                              color: Colors.grey[600],
                                              fontWeight: FontWeight.w300,
                                            ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 0.5.h,
                                  ),
                                  Text(
                                    'Class: Luxury Hotel',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        ?.copyWith(
                                          fontSize: 13.sp,
                                          letterSpacing: 0.1.sp,
                                          color: Colors.grey[600],
                                          fontWeight: FontWeight.w400,
                                        ),
                                  ),
                                  SizedBox(
                                    height: 0.5.h,
                                  ),
                                  _buildHotelRatingStars(hotels[index].rating),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Expanded(
            child: Image(
              width: 75.w,
              image: const AssetImage(
                'assets/images/plant.jpg',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Text _buildHotelRatingStars(int rating) {
    String stars = '';
    for (int i = 0; i < rating; i++) {
      stars += '​​⭐​';
    }
    return Text(
      'Rating: $stars',
      style: Theme.of(context).textTheme.bodyText1?.copyWith(
            fontSize: 13.sp,
            letterSpacing: 0.1.sp,
            color: Colors.grey[600],
            fontWeight: FontWeight.w400,
          ),
    );
  }
}
