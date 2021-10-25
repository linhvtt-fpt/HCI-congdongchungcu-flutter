import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:test_flutter_template/Fake_Data/notification_myshop_json.dart';
import 'package:test_flutter_template/json/home_page_json.dart';
import 'package:test_flutter_template/json/product_data_json.dart';
import 'package:test_flutter_template/json/product_model.dart';
import 'package:test_flutter_template/json/sp_ban_chay_json.dart';
import 'package:test_flutter_template/list_view/girdViewListItemPage.dart';
import 'package:test_flutter_template/list_view/listViewNotification_myshop.dart';
import 'package:test_flutter_template/model/notification_detail_myshop.dart';
import 'package:test_flutter_template/pages/cart_page.dart';
import 'package:test_flutter_template/pages/store_detail_pages.dart';
import 'package:test_flutter_template/pages/xem_danh_gia_cua_shop_khac_page.dart';
import 'package:test_flutter_template/theme/colors.dart';
import 'package:test_flutter_template/theme/styles.dart';
import 'package:test_flutter_template/widgets/custom_slider.dart';
import 'package:test_flutter_template/json/cart_product_json.dart';

class YourShopPage extends StatefulWidget {
  @override
  _YourShopPageState createState() => _YourShopPageState();
}

class _YourShopPageState extends State<YourShopPage> {
  int activeMenu = 0;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final double r = (175 / 360); //  rapport for web test(304 / 540);
    final coverHeight = screenWidth * r;
    bool _pinned = false;
    bool _snap = false;
    bool _floating = false;
    var size = MediaQuery.of(context).size;
    final widgetList = [
      Container(
        margin: EdgeInsets.only(left: 15, right: 15, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomSliderWidget(
              items: [
                "assets/images/banner1.jfif",
                "assets/images/banner2.jfif",
                "assets/images/banner3.jfif"
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Sản phẩm bán chạy",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: List.generate(productBanChay.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(
                      left: 5, top: 5, bottom: 5, right: 10),
                  child: Container(
                    width: 180,
                    height: 220,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
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
                                            product: productBanChay[index], isSale: false)));
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image(
                                  image: NetworkImage(
                                      productBanChay[index].urlImage),
                                  width: 180,
                                  height: 120,
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
                          productBanChay[index].name,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/vietnamese-dong.png",
                                  width: 15,
                                  color: Colors.red,
                                ),
                                Text(
                                  NumberFormat.decimalPattern()
                                      .format(productBanChay[index].price),
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.red,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            )),
                          ],
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Container(
                          padding: EdgeInsets.only(right: 10),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    productBanChay[index].rate,
                                    style: TextStyle(fontSize: 13),
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
                                  Text(
                                    "Đã bán",
                                    style: TextStyle(fontSize: 13),
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Text(
                                    productBanChay[index].rate_number,
                                    style: TextStyle(fontSize: 13),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              })),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Sản phẩm khác ",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            /* SingleChildScrollView(
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
                                image: NetworkImage(allProduct[index].urlImage),
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
                                NumberFormat.decimalPattern()
                                    .format(allProduct[index].price),
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
            ),
          */
            SingleChildScrollView(
              child: Column(
                  children: List.generate(allProduct.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Container(
                    width: size.width,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Row(
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
                                            product: allProduct[index], isSale: false)));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 8, right: 8, bottom: 8, top: 15),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image(
                                    image: NetworkImage(
                                        allProduct[index].urlImage),
                                    width: 110,
                                    height: 110,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        // SizedBox(
                        //   width: 10,
                        // ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 8, right: 8, bottom: 8, top: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  allProduct[index].name,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  allProduct[index].description,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 15.5),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset(
                                      "assets/images/vietnamese-dong.png",
                                      width: 18,
                                      color: Colors.red,
                                    ),
                                    Text(
                                      NumberFormat.decimalPattern()
                                          .format(allProduct[index].price),
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.red,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      width: 17,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      allProduct[index].rate,
                                      style: TextStyle(fontSize: 13),
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
                                    Text(
                                      "Đã bán",
                                      style: TextStyle(fontSize: 13),
                                    ),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    Text(
                                      allProduct[index].rate_number,
                                      style: TextStyle(fontSize: 13),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              })),
            )
          ],
        ),
      )
    ];

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Container(
          width: double.infinity,
          height: 40,
          color: Colors.transparent,
          child: Center(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Tìm kiếm...',
                hintStyle: TextStyle(
                    color: white, fontSize: 17, fontWeight: FontWeight.bold),
                prefixIcon: Icon(Icons.search, color: white),
                suffixIcon: Icon(
                  Icons.camera_alt,
                  color: white,
                ),
              ),
            ),
          ),
        ),
        elevation: 0.0,
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: _pinned,
            snap: _snap,
            floating: _floating,
            expandedHeight: coverHeight - 74, //304,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              background: Stack(
                children: [
                  Image.asset(
                    "assets/images/masteri-waterfront-background.jpg",
                    fit: BoxFit.cover,
                  ),
                  Positioned.fill(
                    child: Container(
                      color: Colors.black38,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 90),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: CircleAvatar(
                                  backgroundImage:
                                      AssetImage("assets/images/3.jpg"),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "Baba Tea",
                                style: TextStyle(
                                    color: white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              SizedBox(
                                width: 120,
                              ),
                              Container(
                                width: 90,
                                height: 40,
                                decoration: BoxDecoration(
                                    border: Border.all(color: white),
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.transparent),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "+ Theo dõi",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: white),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                child: Row(
                              children: [
                                Icon(
                                  Icons.storefront,
                                  color: white,
                                ),
                                Text(
                                  "Sản phẩm: 30",
                                  style: TextStyle(color: white),
                                ),
                              ],
                            )),
                            Text(
                              "|",
                              style: TextStyle(color: white),
                            ),
                            Container(
                                child: Row(
                              children: [
                                Icon(
                                  Icons.people,
                                  color: white,
                                ),
                                Text(
                                  "Người theo dõi: 10",
                                  style: TextStyle(color: white),
                                ),
                              ],
                            )),
                            Text(
                              "|",
                              style: TextStyle(color: white),
                            ),
                            Container(
                                child: InkWell(
                                  onTap: (){
                                    Navigator.push(context,
                                  MaterialPageRoute(
                                    builder: (context) => ViewListFeedbackPage(),
                                  ) );
                                  },
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star_border,
                                    color: white,
                                  ),
                                  Text(
                                    "Đánh giá: 4.5",
                                    style: TextStyle(color: white),
                                  ),
                                ],
                              ),
                            ))
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  width: screenWidth,
                  height: 10,
                  // decoration: BoxDecoration(
                  //   color: Colors.white,
                  //   borderRadius: BorderRadius.only(
                  //     topLeft: const Radius.circular(30.0),
                  //     topRight: const Radius.circular(30.0),
                  //   ),
                  // ),
                ),
              ],
            ),
          ),
          SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
            return widgetList[index];
          }, childCount: widgetList.length))
        ],
      ),
    );
  }
}
