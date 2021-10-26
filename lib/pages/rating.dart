import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:test_flutter_template/json/bill_model.dart';
import 'package:test_flutter_template/json/product_model.dart';

import 'danh_gia_page.dart';

class RatingBill extends StatefulWidget {
  final Bill bill;

  RatingBill(this.bill);

  @override
  _RatingBill createState() => _RatingBill();
}

class _RatingBill extends State<RatingBill> {
  @override
  Widget build(BuildContext context) {
    var bill = widget.bill;
    List<Product> listProduct = bill.listProduct;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(240, 103, 103, 1),
          centerTitle: true,
          title: Text('Đánh giá sản phẩm'),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          ),
          actions: [
            TextButton(
              onPressed: () {
                bill.isRating = true;
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => RatingPage()));
              },
              child: const Text(
                  'GỬI',
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.white)
              ),
            )
          ],
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
                              MediaQuery.of(context).size.height / 400),
                      itemBuilder: (BuildContext context, int index) {
                        var product = listProduct[index];
                        //List.generate(choices2021.length, (index) {
                        return new GestureDetector(
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
                                Text(product.name)
                              ],
                            ),
                            Divider(color: Colors.grey),
                            RatingBar.builder(
                              initialRating: 5,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding:
                                  EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                            SizedBox(height: 10),
                            TextFormField(
                              maxLines: 5,
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                filled: true,
                                fillColor: Colors.grey.shade100,
                                hintText:
                                    'Chia sẻ những điều bạn thích về sản phẩm này',
                                hintStyle: TextStyle(color: Colors.grey),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Theme.of(context).accentColor,
                                    width: 2.0,
                                  ),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade500,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ));
                      })),
            ])));
  }
}
