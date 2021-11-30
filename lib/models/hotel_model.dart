class Hotel {
  final String imageURL;
  final String name;
  final String address;
  final double price;

  Hotel(
      {required this.name,
      required this.address,
      required this.price,
      required this.imageURL});
}

final List<Hotel> hotels = [
  Hotel(
    name: 'La Réserve Athénée',
    address: '69 Naughty St.',
    price: 69,
    imageURL: 'assets/images/hotel0.jpg',
  ),
  Hotel(
    name: 'Hyatt Regency',
    address: '420 High St.',
    price: 420,
    imageURL: 'assets/images/hotel1.jpg',
  ),
  Hotel(
    name: 'Exotic Inuit',
    address: '69-420  Forbidden St.',
    price: 69.420,
    imageURL: 'assets/images/hotel2.jpg',
  ),
];
