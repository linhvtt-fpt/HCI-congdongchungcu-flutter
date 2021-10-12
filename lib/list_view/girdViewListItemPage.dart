import 'package:flutter/material.dart';
import 'package:test_flutter_template/json/product_data_json.dart';
import 'package:test_flutter_template/json/product_model.dart';

class GridViewListItemPage extends StatelessWidget {
  List<Product> list = allProduct;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('test'),
        ),
        body: Container(
          child: GridView.count(
            crossAxisCount: 3,
            children: [
              Container(
                  child: Column(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/trasua.jpg'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(height: 3),
                  Text('testasdaasdasdasdasdasdasdas',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Text('20.000đ')
                ],
              )),
            ],
          ),
        ));
  }
}

            // Container(
            //     decoration: BoxDecoration(
            //       image: DecorationImage(
            //         image: AssetImage('assets/images/trasua.jpg'),
            //       ),
            //     ),
            //   ),
            