// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:travel_ui_app/models/activity_model.dart';
import 'package:travel_ui_app/models/destination_model.dart';

class DestinationPage extends StatefulWidget {
  late Destination destination;
  DestinationPage(this.destination, {Key? key}) : super(key: key);
  @override
  _DestinationPageState createState() => _DestinationPageState();
}

class _DestinationPageState extends State<DestinationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  tag: widget.destination.imageUrl,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Image(
                      image: AssetImage(widget.destination.imageUrl),
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
                    Text(
                      widget.destination.city,
                      style: Theme.of(context).textTheme.subtitle1?.copyWith(
                            fontSize: 26.sp,
                          ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          FontAwesomeIcons.locationArrow,
                          size: 13.0,
                          color: Colors.white70,
                        ),
                        SizedBox(
                          width: 1.5.w,
                        ),
                        Text(
                          widget.destination.zone,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2
                              ?.copyWith(fontSize: 15.sp),
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
                  color: Colors.white70,
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
              itemCount: widget.destination.activities.length,
              itemBuilder: (BuildContext context, int index) {
                Activity activity = widget.destination.activities[index];
                return Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(9.w, 1.6.h, 4.w, 1.h),
                      width: 100.w,
                      height: 22.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
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
                        padding: EdgeInsets.fromLTRB(29.w, 0.5.h, 3.5.w, 2.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  width: 28.w,
                                  child: Text(
                                    activity.name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        ?.copyWith(
                                          color: Colors.black87,
                                          letterSpacing: 0.1.sp,
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'Rs.${activity.price}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          ?.copyWith(
                                            letterSpacing: 0.1.sp,
                                            fontSize: 16.sp,
                                            color: Colors.black87,
                                            fontWeight: FontWeight.w500,
                                          ),
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
                              ],
                            ),
                            Text(
                              activity.type,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(
                                    fontSize: 11.sp,
                                    letterSpacing: 0.1.sp,
                                    color: Colors.grey[600],
                                  ),
                            ),
                            _buildRatingStars(activity.rating),
                            SizedBox(
                              height: 1.5.h,
                            ),
                            Row(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      borderRadius: BorderRadius.circular(10.0),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey[300] as Color,
                                          offset: const Offset(0.0, 2.0),
                                        ),
                                      ]),
                                  child: Text(
                                    activity.startTimes[0],
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        ?.copyWith(
                                          color: Colors.grey,
                                          letterSpacing: 0,
                                          fontSize: 11.sp,
                                        ),
                                  ),
                                ),
                                SizedBox(
                                  width: 1.w,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          offset: const Offset(0.0, 2.0),
                                        ),
                                      ]),
                                  child: Text(
                                    activity.startTimes[1],
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        ?.copyWith(
                                          color: Colors.grey,
                                          letterSpacing: 0,
                                          fontSize: 11.sp,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 3.w,
                      bottom: 20.0,
                      top: 20.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image(
                          image: AssetImage(activity.imageUrl),
                          fit: BoxFit.cover,
                          width: 33.w,
                          height: 20.h,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

Text _buildRatingStars(int rating) {
  String stars = '';
  for (int i = 0; i < rating; i++) {
    stars += '​​⭐​';
  }
  return Text(stars);
}
