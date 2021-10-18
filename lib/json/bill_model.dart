import 'package:test_flutter_template/json/product_model.dart';
import 'package:test_flutter_template/json/user_model.dart';

class Bill{
  final List<Product> listProduct;
  final User buyer;
  String status;
  bool isRating;


  Bill({
    required this.listProduct,
    required this.buyer,
    required this.status,
    required this.isRating,
  });
}