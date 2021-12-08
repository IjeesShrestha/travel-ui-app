import 'activity_model.dart';

class Destination {
  final String imageUrl;
  final String city;
  final String zone;
  final String description;
  final List<Activity> activities;

  Destination({
    required this.city,
    required this.zone,
    required this.description,
    required this.activities,
    required this.imageUrl,
  });
}

List<Activity> activities = [
  Activity(
    imageUrl: "assets/images/swayambu.jpg",
    name: 'Swayambhu Gumba',
    rating: 5,
    price: 100,
    type: 'Relegious Heritage',
    startTimes: ['6:00 am', '10:00 pm'],
  ),
  Activity(
    imageUrl: "assets/images/crossroads.jpg",
    name: 'Godawari',
    rating: 4,
    price: 500,
    type: 'Trekking & Hiking',
    startTimes: ['6:00 am', '8:00 am'],
  ),
  Activity(
    imageUrl: "assets/images/locale.jpg",
    name: 'Basantapur',
    rating: 3,
    price: 200,
    type: 'Local Sightseeking',
    startTimes: ['6:00 am', '10:00 am'],
  ),
];

List<Destination> destinations = [
  Destination(
    city: 'Kathmandu',
    zone: 'Bagmati',
    description: 'An ancient city and the cultural hub of Nepal.',
    activities: activities,
    imageUrl: "assets/images/runes.jpg",
  ),
  Destination(
    city: 'Pokhara',
    zone: 'Kaski',
    description: 'The perfect mixture of nature and culture.',
    activities: activities,
    imageUrl: "assets/images/pokhara.jpg",
  ),
  Destination(
    city: 'Patan',
    zone: 'Bagmati',
    description: 'Visit the busy streets and lifestyle of patan.',
    activities: activities,
    imageUrl: "assets/images/busystreets.jpg",
  ),
  Destination(
    city: 'Bhaktapur',
    zone: 'Bagmati',
    description: 'A city of devotees, another hub of newari culture.',
    activities: activities,
    imageUrl: "assets/images/bhaktapur.jpg",
  ),
  Destination(
    city: 'Dhulikhel',
    zone: 'Kavre',
    description: 'Bask in the ambience of the peace and quiet of Dhulikhel.',
    activities: activities,
    imageUrl: "assets/images/dhulikhel.jpg",
  ),
];
