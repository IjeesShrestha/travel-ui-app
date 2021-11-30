class Activity {
  final String imageUrl;
  final double rating;
  final double price;
  final String type;
  final String name;
  final List<String> startTimes;

  Activity(
      {required this.imageUrl,
      required this.name,
      required this.rating,
      required this.price,
      required this.type,
      required this.startTimes});
}
