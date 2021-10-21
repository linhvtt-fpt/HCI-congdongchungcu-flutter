import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:test_flutter_template/json/home_page_json.dart';
import 'package:test_flutter_template/json/product_data_json.dart';
import 'package:test_flutter_template/json/product_model.dart';
import 'package:test_flutter_template/list_view/girdViewListItemPage.dart';
import 'package:test_flutter_template/pages/cart_page.dart';
import 'package:test_flutter_template/pages/store_detail_pages.dart';
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
        margin: EdgeInsets.only(left: 15, right: 15, bottom: 30),
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
            Text(
              "Sản phẩm",
              style: customTitle,
            ),
            SizedBox(
              height: 15,
            ),
            SingleChildScrollView(
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
                                    image:
                                    NetworkImage(allProduct[index].urlImage),
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
          color:  Colors.transparent,
          child: Center(
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Tìm kiếm...',
                  hintStyle: TextStyle(color: white, fontSize: 17, fontWeight: FontWeight.bold),
                  prefixIcon: Icon(Icons.search, color: white),
                  suffixIcon: Icon(Icons.camera_alt, color: white,),
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
            expandedHeight: coverHeight - 73, //304,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              background: Stack(
                children: [
                  Image.asset("assets/images/masteri-waterfront-background.jpg", fit: BoxFit.cover,),
                  Positioned.fill(
              child: Container(
                color: Colors.black38,
              ),
            ),
                
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
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
                          SizedBox(width: 20,),
                          Text("Baba Tea", style: TextStyle(color: white, fontWeight: FontWeight.bold, fontSize: 20),)
                        ],
                      ),
                    ],
                  ),
                ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              width: screenWidth,
              height: 25,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    width: screenWidth,
                    height: 25,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(30.0),
                        topRight: const Radius.circular(30.0),
                      ),
                    ),
                  )
                ],
              ),
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
