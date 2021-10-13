import 'dart:ffi';

class ProductMyShop {
  final String shopName;
  final String name;
  final String description;
  final int price;
  final String urlImage;
  final String category;
  final int quantitySold;
  final String rate;
  int quantity;


  ProductMyShop({
    required this.shopName,
    required this.name,
    required this.description,
    required this.price,
    required this.urlImage,
    required this.category,
    required this.quantitySold,
    required this.rate,
    required this.quantity
  });

  factory ProductMyShop.fromJson(Map<String, dynamic> json) => ProductMyShop(
    shopName: json['shopName'],
      name: json['name'],
      description: json['description'],
      price: json['price'] ,
      urlImage: json['urlImage'],
      category: json['category'],
      quantitySold: json['quantitySold'],
      rate: json['rate'],
      quantity: json['quantity']
  );

  Map<String, dynamic> toJson() => {
    'shopName': shopName,
    'name': name,
    'description': description,
    'price': price,
    'urlImage': urlImage,
    'category': category,
    'quantitySold': quantitySold,
    'rate': rate,
    'quantity': quantity
  };
}