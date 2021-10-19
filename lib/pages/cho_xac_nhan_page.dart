import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icon.dart';
import 'package:test_flutter_template/json/bill_model.dart';
import 'package:test_flutter_template/json/list_bill_json.dart';
import 'package:test_flutter_template/json/product_model.dart';
import 'package:test_flutter_template/pages/checkout_page.dart';
import 'package:test_flutter_template/pages/chi_tiet_don_hang_page.dart';
import 'package:test_flutter_template/pages/store_detail_pages.dart';

import 'cart_page.dart';

class WaitAcceptPage extends StatefulWidget {


  // const WaitAcceptPage(
  //     {Key? key,
  //     required this.listbill})
  //     : super(key: key);super

  // final List<Product> cartIn;
  //
  // WaitAcceptPage({required this.cartIn});

  final bool buyer;
  final String status;
  List<Bill> listbill = listBill;


  WaitAcceptPage({required this.buyer, required this.status})
  {
    //chưa xác nhận
    if(status.contains("Chưa xác nhận")){
      listbill = listBillShop.where((element) => element.status.contains("Chưa xác nhận")).toList();
    }

    // // Đã xác nhận
    // if(status.contains("Đã xác nhận")){
    //   listbill = listBill.where((element) => element.status.contains("Đã xác nhận")).toList();
    // }
  }

  @override
  _WaitAcceptPageState createState() => _WaitAcceptPageState();
}


class _WaitAcceptPageState extends State<WaitAcceptPage> {

  // listbill = listBill.where((element) => element.status.contains("Chưa xác nhận")).toList();


  // List<Product> _cart ;
  //
  // _WaitAcceptPageState(this._cart);
  // {
  //   this._cart = cartIn;
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color.fromRGBO(240, 103, 103, 1),
            title:
            Row(
              children: [
                if(widget.status.contains("Chưa xác nhận"))
                  Center(
                    child: Text(
                        'Chờ Xác Nhận'
                    ),
                  ),
                // if(widget.status.contains("Đã xác nhận"))
                //   Center(
                //     child: Text(
                //         'Đã Xác Nhận'
                //     ),
                //   ),
              ],
            )
        ),
        body: ListView.builder(

          itemCount: widget.listbill.length,
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
                          //này là người mua
                          if(widget.buyer)
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Icon(Icons.storefront),
                                  SizedBox(width: 3,),
                                  Text(widget.listbill[index1].listProduct[0].nameShop),
                                ],
                              ),
                            ),

                          //này là shop
                          if(!widget.buyer)
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Icon(Icons.account_circle),
                                  SizedBox(width: 3,),
                                  Text(widget.listbill[index1].buyer.name.toString()),
                                ],
                              ),
                            ),

                          if(widget.status.contains("Chưa xác nhận"))
                            Container(
                              padding: EdgeInsets.only(right: 10),
                              child: Text(widget.listbill[index1].status,
                                style: TextStyle(
                                  color: Colors.deepOrangeAccent,
                                ),),
                            ),

                          // if(widget.status.contains("Đã xác nhận"))
                          //   Container(
                          //     padding: EdgeInsets.only(right: 10),
                          //     child: Text(widget.listbill[index1].status,
                          //       style: TextStyle(
                          //         color: Colors.green,
                          //       ),),
                          //   ),
                        ],
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: 2,
                          itemBuilder: (context, index) {
                            var item = widget.listbill[index1].listProduct;
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

                      if(widget.listbill[index1].listProduct.length > 2)
                        GestureDetector(
                            onTap: () {
                              // chuyển trand sang trang detail
                              Navigator.push(context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailOrderPage(widget.listbill[index1].listProduct, widget.status, widget.buyer),
                                  ) );
                            },
                            child: Text('Xem Thêm Sản Phẩm')),

                      Divider(
                        color: Colors.grey,
                      ),

                      Container(
                        padding: EdgeInsets.only(left: 8, right: 8, bottom: 8, top: 4) ,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text( totalQuantity(widget.listbill[index1].listProduct).toString()+' sản phẩm'
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
                                Text(NumberFormat.decimalPattern().format(totalPrice(widget.listbill[index1].listProduct)),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          _btnShow(),

                          if(widget.buyer == false)
                            _btnAccept(),

                          if(widget.buyer == true && widget.status.contains("Chưa xác nhận"))
                          //truyền là Buyer và đang ở trang chưa xác nhận
                            _btnProcess("Đang xử lý", Colors.grey.shade300),

                          // if(widget.buyer == true && widget.status.contains("Đã xác nhận"))
                          // //truyền là Buyer và đang ở trang Đã xác nhận
                          //   _btnProcess("Đang giao", Colors.green),
                        ],
                      )

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

Widget _btnShow() {
  return InkWell(
      onTap: () {},
      child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.all(13),

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Colors.red,
                  ),
                  child: Text(
                    "       Hủy Đơn      ",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ]
          )
      )
  );
}
Widget _btnProcess(String text, Color colors) {
  return InkWell(
      onTap: () {},
      child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(31, 14, 31, 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: colors,
                  ),
                  child: Text( text
                    ,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white54, fontSize: 16),
                  ),
                ),
              ]
          )
      )
  );
}

Widget _btnAccept() {
  return InkWell(
      onTap: () {},
      child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.all(13),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Colors.green,
                  ),
                  child: Text(
                    "  Xác Nhận Đơn ",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ]
          )
      )
  );
}
