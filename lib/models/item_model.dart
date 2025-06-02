class Item {
  final String id;
  final String name;
  final String image;
  final double price;
  final double oldPrice;
  final String discount;
  final String rating;
  final String reviews;
  final String? deliveryTime;

  Item({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.rating,
    required this.reviews,
    this.deliveryTime
  });
}
