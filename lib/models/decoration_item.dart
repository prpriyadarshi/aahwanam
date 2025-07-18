class DecorationItem {
  final String name;
  final String image;
  final String price;
  final String rating;

  DecorationItem({
    required this.name,
    required this.image,
    required this.price,
    required this.rating,
  });

  Map<String, String> toMap() {
    return {
      'name': name,
      'image': image,
      'price': price,
      'rating': rating,
    };
  }
}
