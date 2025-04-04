class Item {
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final List<String> ingredients;

  Item({
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.ingredients,
  });
  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      name: json['title'],
      description: json['description'],
      price: json['price'].toDouble(),
      imageUrl: json['image'],
      ingredients: List<String>.from(json['ingredients']),
    );
  }
}
