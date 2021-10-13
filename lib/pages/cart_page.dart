import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_flutter_template/json/product_model.dart';
import 'package:test_flutter_template/pages/checkout_page.dart';
import 'package:test_flutter_template/theme/colors.dart';

import 'store_detail_pages.dart';

class Cart extends StatefulWidget {
  final List<Product> _cart;

  Cart(this._cart);

  @override
  _CartState createState() => _CartState(this._cart);
}

class _CartState extends State<Cart> {
  _CartState(this._cart);
  int pageIndex = 0;

  List<Product> _cart;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Giỏ hàng'),
          backgroundColor: Color.fromRGBO(240, 103, 103, 1)),
      body: ListView.builder(
          itemCount: _cart.length,
          itemBuilder: (context, index) {
            var item = _cart[index];
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
              child: Card(
                  elevation: 4.0,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => StoreDetailPage(
                                            product: item)));
                              },
                        child: SizedBox(
                          width: 70,
                          height: 70,
                          child: Image.network(item.urlImage),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.name,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 15,
                                height: 15,
                                child: Image.asset(
                                    "assets/images/vietnamese-dong.png",
                                    color: Colors.red),
                              ),
                              Text(
                                NumberFormat.decimalPattern()
                                    .format(item.price),
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(
                                width: 60,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    5,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    InkWell(
                                      child: Icon(
                                        Icons.remove,
                                        color: Colors.black,
                                        size: 16,
                                      ),
                                      onTap: () {
                                        setState(() {
                                          if (item.quantity > 1) {
                                            item.quantity = item.quantity - 1;
                                            _cart
                                                .elementAt(_cart.indexOf(item))
                                                .quantity = item.quantity;
                                          } else {
                                            _cart.remove(item);
                                          }
                                        });
                                      },
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 3),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 3, vertical: 2),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(3),
                                          color: Colors.white),
                                      child: Text(
                                        item.quantity.toString(),
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 16),
                                      ),
                                    ),
                                    InkWell(
                                        onTap: () {
                                          setState(() {
                                            item.quantity = item.quantity + 1;
                                            _cart
                                                .elementAt(_cart.indexOf(item))
                                                .quantity = item.quantity;
                                          });
                                        },
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.black,
                                          size: 16,
                                        )),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 70,
                              ),
                              GestureDetector(
                                  child: Icon(
                                    Icons.remove_circle,
                                    color: Colors.red,
                                  ),
                                  onTap: () {
                                    setState(() {
                                      _cart.remove(item);
                                    });
                                  }),
                            ],
                          )
                        ],
                      ),
                    ],
                  )),
            );
          }),
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getFooter() {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
          // color: Color.fromRGBO(240, 103, 103, 1),
          border: Border(
              top: BorderSide(width: 1, color: black.withOpacity(0.06)))),
      child: Padding(
        padding: const EdgeInsets.only(left: 40),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Text(
                    "Tổng tiền:",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                )
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                        height: 20,
                        child: Image.asset("assets/images/vietnamese-dong.png",
                            color: Colors.red),
                      ),
                      Text(
                        NumberFormat.decimalPattern().format(totalProduct()),
                        style: TextStyle(fontSize: 20, color: Colors.red),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              width: 150,
              child: ElevatedButton(
                  onPressed: () {
                    Route route = MaterialPageRoute(
                        builder: (context) => CheckoutPage(_cart));
                    Navigator.push(context, route);
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero))),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 18,
                      ),
                      Text(
                        "Mua hàng",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }

  selectedTab(index) {
    setState(() {
      pageIndex = index;
    });
  }

  totalProduct() {
    int total = 0;
    if (_cart.length <= 0) {
      total = 0;
    } else {
      for (int i = 0; i < _cart.length; i++) {
        total += _cart[i].price * _cart[i].quantity as int;
      }
    }
    return total;
  }
}
