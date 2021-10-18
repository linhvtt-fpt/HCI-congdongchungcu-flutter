import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:intl/intl.dart';
import 'package:test_flutter_template/json/product_myshop.dart';
import 'package:test_flutter_template/theme/colors.dart';
import 'package:test_flutter_template/theme/styles.dart';

import 'myshop_add_new_product.dart';
import 'myshop_detail_product.dart';
import 'myshop_notification_page.dart';

class MyShopPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyShopPageState();
}

class _MyShopPageState extends State<MyShopPage> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    List bottomItems = [
      Icons.my_library_books_sharp,
      Icons.card_giftcard,
      Icons.stars
    ];
    List textItems = ["Chờ xác nhận", "Giao hàng", "Đánh giá"];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Container(
          padding: EdgeInsets.all(2),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(Icons.storefront),
              ),
              Text(
                "AVA CAKE OFFICIAL",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ],
          ),
        ),
        backgroundColor: Color.fromRGBO(240, 103, 103, 1),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            _btnNotificationMyshop(),
            SizedBox(
              height: 5,
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                            width: 8, color: black.withOpacity(0.06)),
                      ),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          Icons.list_alt,
                          color: Colors.blue[900],
                          size: 20,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: Text(
                              "Đơn hàng",
                              style: TextStyle(fontSize: 16),
                            )),
                        Text(
                          "Xem lịch sử đơn hàng",
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 18,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.05, color: Colors.black87)),
                  ),
                  Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                        color: white,
                        border: Border(
                          // top: BorderSide(width: 2, color: black.withOpacity(0.06)),
                            bottom: BorderSide(
                                width: 8, color: black.withOpacity(0.06)))),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 30, right: 30, bottom: 0, top: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(textItems.length, (index) {
                          return InkWell(
                              onTap: () {
                                selectedTab(index);
                              },
                              child: Column(
                                children: [
                                  Icon(bottomItems[index],
                                      size: 22, color: Colors.black),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    textItems[index],
                                    style:
                                    TextStyle(fontSize: 13, color: black),
                                  ),
                                ],
                              ));
                        }),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            _btnCreateNewProduct(),
            SizedBox(
              height: 5,
            ),
            getBody(),
          ],
        ),
      ),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: size.width,
          height: 8,
          decoration: BoxDecoration(color: textFieldColor),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          margin: EdgeInsets.only(left: 15, right: 15, bottom: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "CÁC MẶT HÀNG ĐANG BÁN",
                style: customTitle,
              ),
              SizedBox(
                height: 15,
              ),
              SingleChildScrollView(
                // scrollDirection: Axis.horizontal,
                child: Column(
                    children: List.generate(allProductMyShop.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.all(5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => MyShopDetailPage(
                                                product: allProductMyShop[index])));
                                  },
                                  child: Container(
                                    width: size.width,
                                    height: 160,
                                    child: Image(
                                      image: NetworkImage(
                                          allProductMyShop[index].urlImage),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    allProductMyShop[index].name,
                                    style: TextStyle(
                                        fontSize: 18, fontWeight: FontWeight.w400),
                                  ),
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.orange[300],
                                  size: 17,
                                ),
                                Text(
                                  allProductMyShop[index].rate,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          "assets/images/vietnamese-dong.png",
                                          width: 13,
                                          color: Colors.red,
                                        ),
                                        Text(
                                          NumberFormat.decimalPattern()
                                              .format(allProductMyShop[index].price),
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.red,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    )),
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        allProductMyShop[index].category,
                                        style: TextStyle(fontSize: 14),
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      // Icon(
                                      //   Icons.star,
                                      //   color: Colors.orange[300],
                                      //   size: 17,
                                      // ),
                                      Text("|"),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Text("Đã bán"),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Text(
                                        NumberFormat.decimalPattern().format(
                                            allProductMyShop[index].quantitySold),
                                        style: TextStyle(fontSize: 14),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      );
                    })),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _btnCreateNewProduct() {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => AddNewProductMyShop()));
      },
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(0)),
            color: Colors.white,
          ),
          // margin: EdgeInsets.symmetric(horizontal: 12),
          margin: EdgeInsets.only(left: 10),
          padding: EdgeInsets.all(10),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 25),
                child: Icon(
                  Icons.add_circle_outline,
                ),
              ),
              SizedBox(width: 5),
              Expanded(
                child:
                Row(
                  children: [
                    Text(
                      "Thêm sản phẩm mới",
                      style: TextStyle(color: Colors.black87, fontSize: 16),
                    ),
                    SizedBox(
                      width: 162,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }

  Widget _btnNotificationMyshop() {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => MyShopNotificationPage()));
      },
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(0)),
            color: Colors.white,
          ),
          margin: EdgeInsets.only(left: 10),
          // margin: EdgeInsets.symmetric(horizontal: 12),
          padding: EdgeInsets.all(10),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 25),
                child: Icon(
                  Icons.add_alert,
                ),
              ),
              SizedBox(width: 5),
              Expanded(
                child: Row(
                  children: [
                    Text(
                      "Thông báo",
                      style: TextStyle(color: Colors.black87, fontSize: 16),
                    ),
                    SizedBox(
                      width: 232,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }

  selectedTab(index) {
    setState(() {
      pageIndex = index;
    });
  }
}