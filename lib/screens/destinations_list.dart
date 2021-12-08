import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:travel_ui_app/models/destination_model.dart';

class DestinationList extends StatelessWidget {
  const DestinationList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  color: Theme.of(context).primaryColor,
                  iconSize: 25.sp,
                  icon: const Icon(Icons.arrow_back_rounded),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Row(
                  children: <Widget>[
                    IconButton(
                      color: Theme.of(context).primaryColor,
                      iconSize: 22.sp,
                      icon: const Icon(Icons.search),
                      onPressed: () {},
                    ),
                    IconButton(
                      color: Theme.of(context).primaryColor,
                      iconSize: 22.sp,
                      icon: const Icon(FontAwesomeIcons.sortAmountDown),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
            Divider(
              thickness: 2.sp,
              color: Theme.of(context).primaryColor,
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: 1.2.h, bottom: 1.h, left: 5.w, right: 5.w),
              child: Row(
                children: [
                  // Icon(
                  //   FontAwesomeIcons.plane,
                  //   size: 16.sp,
                  //   color: Theme.of(context).primaryColor,
                  // ),
                  SizedBox(
                    width: 8.w,
                  ),
                  SizedBox(
                    width: 79.w,
                    child: Text(
                      ' Top Destinations For You',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style: Theme.of(context).textTheme.headline2?.copyWith(
                          fontSize: 19.sp, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SizedBox(
                width: 95.w,

                child: ListView.builder(
                  itemCount: destinations.length,
                  itemBuilder: (BuildContext context, int index) {
                    Destination destination = destinations[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          '/destinations_page',
                          arguments: destination,
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.all(10.0),
                        height: 45.h,
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: <Widget>[
                            Positioned(
                              bottom: 20.0,
                              child: Container(
                                height: 13.h,
                                width: 88.w,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(5.w, 2.h, 2.w, 3.h),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        '${destination.activities.length} Activities',
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                      ),
                                      Text(
                                        destination.description,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Colors.white,
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black26,
                                      offset: Offset(0.0, 2.0),
                                      blurRadius: 6.0,
                                    ),
                                  ],
                                ),
                                child: Stack(
                                  children: <Widget>[
                                    Hero(
                                      tag: destination.imageUrl,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        child: Image(
                                          height: 34.h,
                                          width: 82.w,
                                          fit: BoxFit.cover,
                                          image:
                                              AssetImage(destination.imageUrl),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 10.0,
                                      bottom: 10.0,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            destination.city,
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle1,
                                          ),
                                          Row(
                                            children: [
                                              const Icon(
                                                FontAwesomeIcons.locationArrow,
                                                size: 10.0,
                                                color: Colors.white,
                                              ),
                                              SizedBox(
                                                width: 1.5.w,
                                              ),
                                              Text(
                                                destination.zone,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle2,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                // Padding(
                //   padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
                //   child: Column(
                //     children: <Widget>[
                //       Container(
                //         height: 35.h,
                //         color: Colors.amber,
                //       ),
                //     ],
                //   ),
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
