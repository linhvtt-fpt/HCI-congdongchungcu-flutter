import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icon.dart';
import 'package:test_flutter_template/json/bill_model.dart';
import 'package:test_flutter_template/json/list_bill_json.dart';
import 'package:test_flutter_template/json/product_model.dart';
import 'package:test_flutter_template/pages/profile_page.dart';
import 'package:test_flutter_template/pages/rating.dart';
import 'package:test_flutter_template/pages/store_detail_pages.dart';
import 'package:test_flutter_template/pages/xem_rating.dart';

import 'myshop_page.dart';

class RatingShop extends StatefulWidget {


  // const WaitAcceptPage(
  //     {Key? key,
  //     required this.listbill})
  //     : super(key: key);super

  // final List<Product> cartIn;
  //
  // WaitAcceptPage({required this.cartIn});

  @override
  _RatingShopState createState() => _RatingShopState();
}
class _RatingShopState extends State<RatingShop> {
  final List<Bill> listbill = listBillShop.where((element) => element.status.contains("Đã hoàn thành")).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromRGBO(240, 103, 103, 1),
              title: Text(
                   'Đánh giá'
              ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: ListView.builder(
          itemCount: listbill.length,
          itemBuilder: (context, index1) {
            return Container(
              height: 370,
              child: Card(
                child:  Container(
                  color: Colors.grey[200],
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Icon(Icons.account_circle_outlined),
                                SizedBox(width: 3,),
                                Text(listbill[index1].listProduct[0].nameShop),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(right: 10),
                            child: Text(listbill[index1].status,
                              style: TextStyle(
                                color: Colors.deepOrangeAccent,
                              ),),
                          ),
                        ],
                      ),
                      Expanded(
                        child: ListView.builder(
                            itemCount: 2,
                            itemBuilder: (context, index) {
                              var item = listbill[index1].listProduct;
                              return Card(
                                child: Row(
                                  children: [
                                    Image.network(item[index].urlImage, width: 70, height: 70,),
                                    SizedBox(width: 20,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(item[index].name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 15,
                                              height: 15,
                                              child: Image.asset(
                                                  "assets/images/vietnamese-dong.png",
                                                  color: Colors.red),
                                                                     ),
                                            Text(NumberFormat.decimalPattern().format(item[index].price),style: TextStyle(color: Colors.red)),
                                            SizedBox(width: 120,),
                                            Text("x" + item[index].quantity.toString()),
                                            SizedBox(width: 30,),
                                            SizedBox(
                                              width: 15,
                                              height: 15,
                                              child: Image.asset(
                                                  "assets/images/vietnamese-dong.png",
                                                  color: Colors.red),
                                            ),
                                            Text(NumberFormat.decimalPattern().format(item[index].price * item[index].quantity).toString(), style: TextStyle(color: Colors.red))
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              );
                            }, ),
                      ),

                      if(listbill[index1].listProduct.length > 2)
                        Text('Xem Thêm Sản Phẩm'),

                      Divider(
                        color: Colors.grey,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 8, right: 8, bottom: 8, top: 4) ,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text( totalQuantity(listbill[index1].listProduct).toString()+' sản phẩm'
                            ,style: TextStyle(
                                color: Colors.black54,
                              ),),
                            Row(
                              children: [
                                Text(
                                  'Tổng thanh toán: ',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black54,
                                ),
                                  ),
                                SizedBox(
                                  width: 15,
                                  height: 15,
                                  child: Image.asset(
                                      "assets/images/vietnamese-dong.png",
                                      color: Colors.red),
                                ),
                                Text(NumberFormat.decimalPattern().format(totalPrice(listbill[index1].listProduct)),
                                  style: TextStyle(color: Colors.red) ,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                       Divider(
                         color: Colors.grey,
                       ),
                      _btnShow(listbill[index1], context),
                    ],
                  ),
                ),
              )
              ,
            );
          },
      )
    );
  }

  int totalQuantity(List<Product> item)
  {
    int totalQuantity = 0;
    for(int i = 0 ; i < item.length ; i ++)
    {
      totalQuantity = totalQuantity + item[i].quantity;
    }
    return totalQuantity;
  }


  int totalPrice(List<Product> item)
  {
    int total = 0;
    for(int i = 0 ; i < item.length ; i ++)
    {
      total = total + item[i].quantity * item[i].price;
    }
    return total;
  }

}

Widget _btnShow(Bill bill, BuildContext context) {
  return InkWell(
    onTap: bill.isRating ? () {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => ViewRatingBill(bill)));
    } : null,
    child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.all(13),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: bill.isRating ? Color.fromRGBO(240, 103, 103, 1) : Colors.grey,
              ),
              child: Text(
                "Xem đánh giá",
                  style: TextStyle(color: bill.isRating ? Colors.white : Colors.white54, fontSize: 16),
                ),

            ),
                ]
        )
        )
  );

}