class Product {
  final String? imageUrl;
  String? description;
  String sku;
  bool movedToFoundList = false;
  bool edited = false;

  Product({
    this.imageUrl,
    this.description,
    required this.sku,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
      imageUrl: json['image_url'],
      description: json['description'],
      sku: json['sku']);

  Map<String, dynamic> toMap() {
    return {
      'imageUrl': imageUrl,
      'description': description,
      'sku': sku,
    };
  }

  @override
  String toString() {
    return sku;
  }
}
