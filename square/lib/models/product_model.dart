class Product {
  final String id;
  final String title;
  final String description;
  final String price;
  final String category;
  final String image;
  final String ratingRate;
  final String ratingCount;

  const Product({
    this.id = '',
    this.title = '',
    this.description = '',
    this.price = '',
    this.category = '',
    this.image = '',
    this.ratingRate = '',
    this.ratingCount = '',
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'category': category,
      'image': image,
      'ratingRate': ratingRate,
      'ratingCount': ratingCount,
    };
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'].toString(),
      title: json['title'].toString(),
      description: json['description'].toString(),
      price: (json['price']).toString(),
      category: json['category'].toString(),
      image: json['image'].toString(),
      ratingRate: json['rating']['rate'].toString(),
      ratingCount: json['rating']['count'].toString(),
    );
  }
}
