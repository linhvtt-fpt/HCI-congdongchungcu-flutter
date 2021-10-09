
import 'package:flutter/material.dart';
import 'package:test_flutter_template/json/product_data_json.dart';
import 'package:test_flutter_template/json/product_model.dart';
import 'package:test_flutter_template/widgets/search_widget.dart';

class FilterListPage  extends StatefulWidget {
  // const ({ Key? key }) : super(key: key);

  @override
  _FilterListPageState createState() => _FilterListPageState();
}

class _FilterListPageState extends State<FilterListPage> {
  late List<Product> products;
  String querry = '';
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    products = allProduct;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: <Widget>[
            buildSearch(),
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];

                  return buildProduct(product);
                },
              ),
            ),
          ],
        ),
      );
  }


Widget buildSearch() {
  return SearchWidget(
    text: querry, 
    onChanged: searchProduct, 
    hintText: 'Search name....'
    );
}

Widget buildProduct(Product product) {
  return ListTile(
    leading: Image.network(
      product.urlImage,
      fit: BoxFit.cover,
      width: 50,
      height: 50,
    ),
    title: Text(product.name),
  );
}



  void searchProduct(String value) {
    final products = allProduct.where((product) {
      final titleLower = product.name.toLowerCase();
      final searchLower = querry.toLowerCase();

      return titleLower.contains(searchLower);
    }).toList();

    setState(() {
      this.querry = querry;
      this.products = products;
    });
  }
}

