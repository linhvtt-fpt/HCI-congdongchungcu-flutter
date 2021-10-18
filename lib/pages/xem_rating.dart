import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:test_flutter_template/json/bill_model.dart';
import 'package:test_flutter_template/json/product_model.dart';

import 'danh_gia_page.dart';

class ViewRatingBill extends StatefulWidget {
  final Bill bill;

  ViewRatingBill(this.bill);

  @override
  _ViewRatingBill createState() => _ViewRatingBill();
}

class _ViewRatingBill extends State<ViewRatingBill> {
  @override
  Widget build(BuildContext context) {
    var bill = widget.bill;
    List<Product> listProduct = bill.listProduct;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(240, 103, 103, 1),
          centerTitle: true,
          title: Text('Đánh giá đơn hàng'),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(children: <Widget>[
              Expanded(
                  child: GridView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: listProduct.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          crossAxisSpacing: 15.0,
                          mainAxisSpacing: 15.0,
                          childAspectRatio:
                              MediaQuery.of(context).size.height / 250),
                      itemBuilder: (BuildContext context, int index) {
                        var product = listProduct[index];
                        //List.generate(choices2021.length, (index) {
                        return GestureDetector(
                            child: Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: Image(
                                    image: NetworkImage(product.urlImage),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(product.name,
                                style: TextStyle(
                                    fontSize: 16,
                                  fontWeight: FontWeight.bold
                                )
                                )
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 40,
                                  ),
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                SizedBox(
                                  width: 40,
                                ),
                                Text("Ngon"),
                              ],
                            )
                          ],
                        ));
                      })),
            ])));
  }
}
