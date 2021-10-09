import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_flutter_template/json/home_page_json.dart';
import 'package:test_flutter_template/json/product_data_json.dart';
import 'package:test_flutter_template/json/product_model.dart';
import 'package:test_flutter_template/pages/cart_page.dart';
import 'package:test_flutter_template/pages/store_detail_pages.dart';
import 'package:test_flutter_template/theme/colors.dart';
import 'package:test_flutter_template/theme/styles.dart';
import 'package:test_flutter_template/widgets/custom_slider.dart';
import 'package:test_flutter_template/json/cart_product_json.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activeMenu = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: double.infinity,
          height: 40,
          color: Colors.white,
          child: Center(
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Search for something',
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: Icon(Icons.camera_alt)),
            ),
          ),
        ),
        backgroundColor: Color.fromRGBO(240, 103, 103, 1),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 150.0,
              width: 30.0,
              child: GestureDetector(
                onTap: () {},
                child: Stack(
                  children: <Widget>[
                     IconButton(
                      onPressed: () {
                        Route route = MaterialPageRoute(
                            builder: (context) => Cart(cartList));
                        Navigator.push(context, route);
                      },
                      icon: Icon(Icons.shopping_cart_sharp, size: 28,),
                      color: Colors.white,
                    ),
                    if (cartList.length > 0)
                      Padding(
                        padding: const EdgeInsets.only(right: 3),
                        child: CircleAvatar(
                          radius: 8.0,
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          child: Text(
                            cartList.length.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Slide picture
            SizedBox(
              height: 10,
            ),
            CustomSliderWidget(
              items: [
                "assets/images/thongbao.jpg",
                "assets/images/thongbao2.jpg",
                "assets/images/thongbao3.jpg"
              ],
            ),
            Container(
              width: size.width,
              decoration: BoxDecoration(
                color: textFieldColor,
              ),
              padding: EdgeInsets.only(top: 5),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                padding: EdgeInsets.only(top: 5, bottom: 5),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Row(
                        children: List.generate(categories.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: Column(
                          children: [
                            Image.asset(
                              categories[index]['img'],
                              width: 35,
                              height: 40,
                              color: Colors.orange[800],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              categories[index]['name'],
                              style: customContent,
                            )
                          ],
                        ),
                      );
                    })),
                  ),
                ),
              ),
            ),
            Container(
              width: size.width,
              height: 5,
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
                    "GỢI Ý HÔM NAY",
                    style: customTitle,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SingleChildScrollView(
                    // scrollDirection: Axis.horizontal,
                    child: Column(
                        children: List.generate(allProduct.length, (index) {
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
                                            builder: (_) => StoreDetailPage(
                                                product: allProduct[index])));
                                  },
                                  child: Container(
                                    width: size.width,
                                    height: 160,
                                    child: Image(
                                      image: NetworkImage(
                                          allProduct[index].urlImage),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              allProduct[index].name,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 8,
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
                                      allProduct[index].price.toString(),
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
                                        allProduct[index].rate,
                                        style: TextStyle(fontSize: 14),
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.orange[300],
                                        size: 17,
                                      ),
                                      Text("|"),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Text("Đã bán"),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Text(
                                        allProduct[index].rate_number,
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
        )
      ],
    );
  }
}
