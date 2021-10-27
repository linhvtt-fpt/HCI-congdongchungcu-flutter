import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';
import 'package:test_flutter_template/json/cart_product_json.dart';
import 'package:test_flutter_template/json/danh_sach_danh_gia_json.dart';
import 'package:test_flutter_template/json/product_checkout_json.dart';
import 'package:test_flutter_template/json/product_data_json.dart';
import 'package:test_flutter_template/json/product_model.dart';
import 'package:test_flutter_template/theme/colors.dart';
import 'package:test_flutter_template/json/home_page_json.dart';
import 'package:test_flutter_template/theme/styles.dart';

import 'cart_page.dart';
import 'checkout_page.dart';
import 'home_page.dart';
import 'yourshop_page.dart';

class StoreDetailPage extends StatefulWidget {
  final Product product;
  final bool isSale;
  const StoreDetailPage({Key? key, required this.product, required this.isSale}) : super(key: key);

  @override
  _StoreDetailPageState createState() => _StoreDetailPageState();
}

class _StoreDetailPageState extends State<StoreDetailPage> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(240, 103, 103, 1),
        elevation: 0,
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 8, right: 20.0),
            child: Container(
              height: 150.0,
              width: 30.0,
              child: GestureDetector(
                onTap: () {
                  if (cartList.isNotEmpty)
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Cart(cartList),
                      ),
                    );
                },
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
      bottomSheet: getFooter(),
      body: getBody(),
    );
  }

  Widget getFooter() {
    List bottomItems = [
      "assets/images/cart.png",
      "assets/images/buy-button.png",
    ];
    List textItems = ["Thêm vào giỏ hàng", "Mua ngay"];
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
          color: Color.fromRGBO(240, 103, 103, 1),
          border: Border(
              top: BorderSide(width: 2, color: black.withOpacity(0.06)))),
      child: Padding(
        padding: const EdgeInsets.only(left: 50, right: 60, bottom: 0, top: 5),
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
                    Image.asset(
                      bottomItems[index],
                      width: 25,
                      color: pageIndex == index ? black : Colors.black54,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      textItems[index],
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: pageIndex == index
                              ? black
                              : black.withOpacity(0.5)),
                    )
                  ],
                ));
          }),
        ),
      ),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(bottom: 60),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: size.width,
                  height: 250,
                  child: Image(
                    image: NetworkImage(widget.product.urlImage),
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.product.name,
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      if(widget.product.isSale)
                      Text("Giảm "+widget.product.saleNum.toString()+"%",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),)
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      widget.isSale ? Container(
                          child: Text(
                            'đ' + NumberFormat.decimalPattern()
                                .format(widget.product.price * 1.1),
                            style: TextStyle(fontSize: 17, color: Colors.grey,
                              decoration: TextDecoration.lineThrough),
                          ),
                        ) : Text(''),
                      Container(
                          child: Image.asset(
                        "assets/images/vietnamese-dong.png",
                        width: 18,
                        color: Colors.red,
                      )),
                      Container(
                        child: Container(
                          child: Text(
                            NumberFormat.decimalPattern()
                                .format(widget.product.price),
                            style: TextStyle(fontSize: 22, color: Colors.red),
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
                      Container(
                        child: Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.orange[300],
                              size: 17,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.orange[300],
                              size: 17,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.orange[300],
                              size: 17,
                            ),
                            Icon(
                              Icons.star_half,
                              color: Colors.orange[300],
                              size: 17,
                            ),
                            Icon(
                              Icons.star_border,
                              color: Colors.orange[300],
                              size: 17,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              widget.product.rate,
                              style: TextStyle(fontSize: 14),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              "|",
                              style: TextStyle(fontSize: 14),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text("Đã bán "+
                              widget.product.rate_number,
                            )
                          ],
                        ),
                        // ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: size.width,
                    height: 5,
                    decoration: BoxDecoration(color: textFieldColor),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  AssetImage(widget.product.imgShop),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            widget.product.nameShop,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),

                      // SizedBox(
                      //   width: 100,
                      // ),
                      Container(
                        width: 100,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.orange.shade700),
                        ),
                        child: Center(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => YourShopPage(widget.product.nameShop)));
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white)),
                            child: Text(
                              "Xem shop",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.orange.shade700),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Chi tiết sản phẩm",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                      Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                      Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                      Expanded(
                        child: Text(widget.product.description),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/fire.png',
                        width: 20,
                        height: 20,
                      ),
                      Text(" #trà_sữa thơm ngon, #trân_châu dai dai chuẩn vị "),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text("Thành phần: "),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/point.png',
                        width: 20,
                        height: 20,
                      ),
                      Text(" 1 Gói trà đen hảo hạng "),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/point.png',
                        width: 20,
                        height: 20,
                      ),
                      Text(" 1 Gói kem béo "),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/point.png',
                        width: 20,
                        height: 20,
                      ),
                      Text(" 1 Gói trân châu "),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/point.png',
                        width: 20,
                        height: 20,
                      ),
                      Text(" 1 Công thức độc quyền"),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/point.png',
                        width: 20,
                        height: 20,
                      ),
                      Text(" 1 Phần Quà Ngẫu Nhiên Bất Ngờ "),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
            Container(
              width: size.width,
              decoration: BoxDecoration(
                color: textFieldColor,
              ),
              padding: EdgeInsets.only(top: 5),
            ),
            Container(
              width: size.width,
              height: 70,
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Đánh giá sản phẩm",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.orange, size: 17),
                          Icon(Icons.star, color: Colors.orange, size: 17),
                          Icon(Icons.star, color: Colors.orange, size: 17),
                          Icon(Icons.star, color: Colors.orange, size: 17),
                          Icon(Icons.star_half, color: Colors.orange, size: 17),
                          Text(
                            " " + widget.product.rate + "/5",
                            style: TextStyle(color: Colors.red, fontSize: 16),
                          ),
                          Text(" (" + widget.product.rate_number + " đánh giá)",
                              style: TextStyle(fontSize: 16))
                        ],
                      )
                    ],
                  ),
                  Text("Xem tất cả",
                      style: TextStyle(color: Colors.red, fontSize: 16))
                ],
              ),
            ),
            Container(
              width: size.width,
              decoration: BoxDecoration(
                color: textFieldColor,
              ),
              padding: EdgeInsets.only(top: 5),
            ),
            Column(
                children: List.generate(allRating.length, (index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.all(8),
                  width: size.width,
                  // height: 170,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[100]),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Icon(Icons.account_circle),
                        ],
                      ),
                      Padding(
                       padding: const EdgeInsets.only(left: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(allRating[index].user),
                            SizedBox(height: 5,),
                            RatingBarIndicator(
                              rating: allRating[index].rate,
                              itemBuilder: (context, index) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              itemCount: 5,
                              itemSize: 15.0,
                              direction: Axis.horizontal,
                            ),
                            SizedBox(height: 5,),
                            Container(
                              width: 330,
                              child: new Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  new Text(allRating[index].comment,
                                      textAlign: TextAlign.left),
                                ],
                              ),
                            ),
                            SizedBox(height: 10,),
                            Container(
                              width: 70,
                              height: 70,
                              child: Image.network(allRating[index].imageFb),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }))
          ],
        ),
      ),
    );
  }

  selectedTab(index) {
    setState(() {
      pageIndex = index;
      if (index == 0) {
        if (cartList.contains(widget.product)) {
          cartList.elementAt(cartList.indexOf(widget.product)).quantity =
              widget.product.quantity + 1;
        } else {
          cartList.add(widget.product);
        }
      } else {
        productCheckout.add(widget.product);
        Route route = MaterialPageRoute(
            builder: (context) => CheckoutPage(productCheckout));
        Navigator.push(context, route);
      }
    });
  }
}
