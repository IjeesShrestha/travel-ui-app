import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:travel_ui_app/models/destination_model.dart';

class DestinationCarousel extends StatelessWidget {
  const DestinationCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          leading: Text(
            'Top Destinations',
            style: Theme.of(context).textTheme.headline2,
          ),
          trailing: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('/destinations_list');
            },
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
            itemCount: destinations.length,
            itemBuilder: (BuildContext context, int index) {
              //destination object//
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
                  width: 210.0,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[
                      Positioned(
                        bottom: 20.0,
                        child: Container(
                          height: 120.0,
                          width: 200.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(
                                15.0, 10.0, 10.0, 10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  '${destination.activities.length} activities',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                Text(
                                  destination.description,
                                  style: Theme.of(context).textTheme.bodyText2,
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
                        child: Stack(
                          children: <Widget>[
                            Hero(
                              tag: destination.imageUrl,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image(
                                  height: 180.0,
                                  width: 180.0,
                                  fit: BoxFit.cover,
                                  image: AssetImage(destination.imageUrl),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 10.0,
                              bottom: 10.0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    destination.city,
                                    style:
                                        Theme.of(context).textTheme.subtitle1,
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
