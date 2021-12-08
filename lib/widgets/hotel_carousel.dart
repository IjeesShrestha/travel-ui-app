import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

import 'package:travel_ui_app/models/hotel_model.dart';

class HotelCarousel extends StatelessWidget {
  const HotelCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          leading: Text(
            'Exclusive Hotels',
            style: Theme.of(context).textTheme.headline2,
          ),
          trailing: GestureDetector(
            onTap: () {},
            child: Text(
              'See all',
              style: Theme.of(context).textTheme.headline2?.copyWith(
                    fontSize: 12.sp,
                    color: Theme.of(context).primaryColor,
                  ),
            ),
          ),
        ),
        SizedBox(
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: hotels.length,
            itemBuilder: (BuildContext context, int index) {
              Hotel hotel = hotels[index];
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    '/hotels_page',
                    arguments: hotel,
                  );
                },
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  width: 240.0,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[
                      Positioned(
                        bottom: 20.0,
                        child: Container(
                          height: 120.0,
                          width: 240.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(
                                15.0, 10.0, 10.0, 10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  hotel.name,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.copyWith(
                                        letterSpacing: 0.3,
                                        fontSize: 13.sp,
                                      ),
                                ),
                                const SizedBox(height: 2.0),
                                Text(
                                  hotel.address,
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                                const SizedBox(height: 2.0),
                                Text(
                                  'Rs.${hotel.price} / night',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
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
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image(
                            height: 180.0,
                            width: 220.0,
                            fit: BoxFit.cover,
                            image: AssetImage(hotel.imageURL),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
