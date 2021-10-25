import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:test_flutter_template/json/home_page_json.dart';
import 'package:test_flutter_template/json/product_data_json.dart';
import 'package:test_flutter_template/json/product_model.dart';
import 'package:test_flutter_template/json/sp_ban_chay_json.dart';
import 'package:test_flutter_template/json/sp_khuyen_mai_json.dart';
import 'package:test_flutter_template/json/sp_yeu_thich_json.dart';
import 'package:test_flutter_template/list_view/girdViewListItemPage.dart';
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
        automaticallyImplyLeading: false,
        title: Container(
          width: double.infinity,
          height: 40,
          color: Colors.white,
          child: Center(
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Tìm kiếm...',
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
                      icon: Icon(
                        Icons.shopping_cart_sharp,
                        size: 28,
                      ),
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
        // Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        //children: [
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
            padding: EdgeInsets.only(top: 3, bottom: 5),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                margin: EdgeInsets.only(left: 10),
                child: Row(
                    children: List.generate(categories.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GridViewListItemPage(
                                  categoryId: categories[index]['id'],
                                  categoryName: categories[index]['name'])
                                  ));
                    },
                    child: Padding(
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
                    ),
                  );
                })),
              ),
            ),
          ),
        ),
        Container(
          width: size.width,
          height: 3,
          decoration: BoxDecoration(color: textFieldColor),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          width: size.width,
          margin: EdgeInsets.only(left: 15, right: 15, bottom: 30),
          decoration: BoxDecoration(color: Colors.grey[100],),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "KHUYẾN MÃI",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    children: List.generate(productSale.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 5, top: 5, bottom: 5, right: 10),
                        child: Container(
                          width: 180,
                          height: 240,
                          decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.circular(10),
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
                                                  product: productSale[index], isSale: true)));
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image(
                                        image:
                                        NetworkImage(productSale[index].urlImage),
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
                                productSale[index].name,
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
                                          Text(
                                            'đ' + NumberFormat.decimalPattern()
                                                .format(productSale[index].price * 1.1),
                                            style: TextStyle(
                                                fontSize: 15,
                                                decoration: TextDecoration.lineThrough,
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Image.asset(
                                            "assets/images/vietnamese-dong.png",
                                            width: 15,
                                            color: Colors.red,
                                          ),
                                          Text(
                                            NumberFormat.decimalPattern()
                                                .format(productSale[index].price),
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.red,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      )),

                                ],

                              ),
                              SizedBox(height: 7,),
                              Container(
                                padding: EdgeInsets.only(right: 10),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          productSale[index].rate,
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
                                        Text("Đã bán", style: TextStyle(fontSize: 13),),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        Text(
                                          productSale[index].rate_number,
                                          style: TextStyle(fontSize: 13),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 10,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text("Shop "+productSale[index].nameShop, style: TextStyle(color: Colors.grey),)
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    })),
              ),
              Text(
                "CÓ THỂ BẠN SẼ THÍCH",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    children: List.generate(productLike.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 5, top: 5, bottom: 5, right: 10),
                    child: Container(
                      width: 180,
                      height: 240,
                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                              product: productLike[index], isSale: false)));
                                },
                                child: ClipRRect(
                                  // width: 200,
                                  // height: 120,
                                  // decoration: BoxDecoration(
                                  //         borderRadius:
                                  //             BorderRadius.circular(30),
                                  //         color: Colors.grey[100],
                                  //         border: Border.all(color: Colors.black12)),
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image(
                                    image:
                                        NetworkImage(productLike[index].urlImage),
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
                            productLike[index].name,
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
                                        .format(productLike[index].price),
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.red,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              )),
                              
                            ],
                            
                          ),
                          SizedBox(height: 7,),
                           Container(
                             padding: EdgeInsets.only(right: 10),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          productLike[index].rate,
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
                                        Text("Đã bán", style: TextStyle(fontSize: 13),),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        Text(
                                          productLike[index].rate_number,
                                          style: TextStyle(fontSize: 13),
                                        )
                                      ],
                                    ),
                                     SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text("Shop "+productLike[index].nameShop, style: TextStyle(color: Colors.grey),)
                                ],
                              )
                                  ],
                                ),
                              ),
                             
                        ],
                      ),
                    ),
                  );
                })),
              ),
              Text(
                "BẠN MỚI XEM GẦN ĐÂY",
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
                    padding: const EdgeInsets.only(left: 5, top: 5, bottom: 5, right: 10),
                    child: Container(
                      width: 180,
                      height: 240,
                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                    image:
                                        NetworkImage(productBanChay[index].urlImage),
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
                          SizedBox(height: 7,),
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
                                        Text("Đã bán", style: TextStyle(fontSize: 13),),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        Text(
                                          productBanChay[index].rate_number,
                                          style: TextStyle(fontSize: 13),
                                        )
                                      ],
                                    ),
                                     SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text("Shop "+productBanChay[index].nameShop, style: TextStyle(color: Colors.grey),)
                                ],
                              )
                                  ],
                                ),
                              ),
                             
                        ],
                      ),
                    ),
                  );
                })),
              ),
            SizedBox(height: 10,),
            Text("SẢN PHẨM BÁN CHẠY", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),
            SizedBox(height: 10,),
            SingleChildScrollView(
                child: Column(
                    children: List.generate(allProduct.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Container(
                      width: size.width,
                      height: 150,
                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                  padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8, top: 15),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image(
                                      image:
                                          NetworkImage(allProduct[index].urlImage),
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
                              padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8, top: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                              Text(
                                allProduct[index].name,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 19, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 5,),
                              Text(allProduct[index].description, overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 15.5),),
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
                                      SizedBox(width: 17,),
                                       
                                ],
                              ),
                              SizedBox(height: 10,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text("Shop "+allProduct[index].nameShop, style: TextStyle(color: Colors.grey),),
                                        ],
                                      ),
                                  SizedBox(height: 10,),
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
                                        Text("Đã bán", style: TextStyle(fontSize: 13),),
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
        ),

        //],
        //),
      ],
    );
  }
}
