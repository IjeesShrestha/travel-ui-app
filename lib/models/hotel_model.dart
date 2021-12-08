class Hotel {
  final String imageURL;
  final String name;
  final String address;
  final double price;
  final int rating;

  Hotel(
      {required this.name,
      required this.address,
      required this.price,
      required this.imageURL,
      required this.rating});
}

final List<Hotel> hotels = [
  Hotel(
    name: 'La Réserve Athénée',
    address: '69 Naughty St.',
    price: 6900.0,
    imageURL: 'assets/images/hotel0.jpg',
    rating: 5,
  ),
  Hotel(
    name: 'Hyatt Regency',
    address: '420 High St.',
    price: 4200.0,
    imageURL: 'assets/images/hotel1.jpg',
    rating: 5,
  ),
  Hotel(
    name: 'Exotic Inuit',
    address: '69-420  Forbidden St.',
    price: 6942.0,
    imageURL: 'assets/images/hotel2.jpg',
    rating: 4,
  ),
];
