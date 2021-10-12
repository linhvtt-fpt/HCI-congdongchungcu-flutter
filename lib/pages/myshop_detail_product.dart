import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_flutter_template/json/cart_product_json.dart';
import 'package:test_flutter_template/json/product_checkout_json.dart';
import 'package:test_flutter_template/json/product_model.dart';
import 'package:test_flutter_template/json/product_myshop.dart';
import 'package:test_flutter_template/json/product_myshop_model.dart';
import 'package:test_flutter_template/theme/colors.dart';

import 'cart_page.dart';
import 'checkout_page.dart';
import 'edit_myshop_product.dart';

class MyShopDetailPage extends StatefulWidget {
  final ProductMyShop product;
  const MyShopDetailPage(
      {Key? key,
        required this.product})
      : super(key: key);

  @override
  _MyShopDetailPageState createState() => _MyShopDetailPageState();
}

class _MyShopDetailPageState extends State<MyShopDetailPage> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(240, 103, 103, 1),
        elevation: 0,
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
    List textItems = ["Chỉnh sửa sản phẩm", "Bump ngay"];
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
                  // selectedTab(index);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => EditMyShopProduct(
                              product: allProductMyShop[index])));
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
                    fit: BoxFit.cover,
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
                  Text(
                    widget.product.name,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Container(
                          child: Image.asset(
                            "assets/images/vietnamese-dong.png",
                            width: 18,
                            color: Colors.red,
                          )),
                      Container(
                        child: Container(
                          child: Text(
                            NumberFormat.decimalPattern().format(widget.product.price),
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
                              Icons.star,
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
                            Text("Đã bán: "),
                            Text(
                              NumberFormat.decimalPattern().format(widget.product.quantitySold),
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
                  Container(
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
                            AssetImage(widget.product.urlImage),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          widget.product.shopName,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        // SizedBox(
                        //   width: 10,
                        // ),
                        Expanded(
                          child: Container(
                            width: 100,
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(5),
                              border:
                              Border.all(color: Colors.orange.shade700),
                            ),
                            child: Center(
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
                      Text(
                          widget.product.description),
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
                      Text(" #bánh_trung_thu_mùa_dịch, #bánh_trung_thu_ế "),
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
                      Text(" 1 Bánh nhân dừa "),
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
                      Text(" 1 Bánh nhân đậu xanh "),
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
                      Text(" 1 Bánh nhân thập cẩm "),
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
                      Text(" 1 Bánh nhân gà quay"),
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
            )
          ],
        ),
      ),
    );
  }

  // selectedTab(index) {
  //   setState(() {
  //     pageIndex = index;
  //     if (index == 0) {
  //       if(cartList.contains(widget.product)){
  //         cartList.elementAt(cartList.indexOf(widget.product)).quantity = widget.product.quantity + 1;
  //       }
  //       else{
  //         cartList.add(widget.product);
  //       }
  //     }
  //     else{
  //       productCheckout.add(widget.product);
  //       Route route = MaterialPageRoute(
  //           builder: (context) => CheckoutPage(productCheckout));
  //       Navigator.push(context, route);
  //     }
  //   });
  // }
}
