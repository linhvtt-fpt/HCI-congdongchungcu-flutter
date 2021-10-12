class Product {
  final String name;
  final String description;
  final int price;
  final String urlImage;
  final String imgShop;
  final String nameShop;
  final String rate;
  final String rate_number;
  final int categoryId;
  int quantity;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.urlImage,
    required this.imgShop,
    required this.nameShop,
    required this.rate,
    required this.rate_number,
    required this.quantity,
    required this.categoryId,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
      name: json['name'],
      description: json['description'],
      price: json['price'],
      urlImage: json['urlImage'],
      imgShop: json['imgShop'],
      nameShop: json['nameShop'],
      rate: json['rate'],
      rate_number: json['rate_number'],
      quantity: json['quantity'],
      categoryId: json['categoryId']);

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
        'price': price,
        'urlImage': urlImage,
        'imgShop': imgShop,
        'nameShop': nameShop,
        'rate': rate,
        'rate_number': rate_number,
        'quantity': quantity
      };
}
