import 'product_model.dart';

class Sale{
  final List<Product> listProduct;
  final String start_date_time;
  final String end_date_time;
  final String name;
  final int    saleNum;


  Sale({
    required this.listProduct,
    required this.start_date_time,
    required this.end_date_time,
    required this.name,
    required this.saleNum,
  });
}