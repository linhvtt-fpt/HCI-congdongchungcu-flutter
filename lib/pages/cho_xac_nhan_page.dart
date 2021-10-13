import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_flutter_template/json/bill_model.dart';
import 'package:test_flutter_template/json/product_model.dart';
import 'package:test_flutter_template/pages/store_detail_pages.dart';

class WaitAcceptPage extends StatefulWidget {
  // final List<Bill> listBill;
  // const WaitAcceptPage(
  //     {Key? key,
  //     required this.listBill})
  //     : super(key: key);

  final List<Product> cartIn;

  WaitAcceptPage({required this.cartIn});

  @override
  _WaitAcceptPageState createState() => _WaitAcceptPageState(this.cartIn);
}
class _WaitAcceptPageState extends State<WaitAcceptPage> {

  List<Product> _cart ;

  _WaitAcceptPageState(this._cart);
  // {
  //   this._cart = cartIn;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
              title: Text(
                   'Chờ Xác Nhận Đơn Hàng Của Bạn'
              ),
      ),
      body: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) {
            return Container(
              height: 525,
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
                                Icon(Icons.storefront),
                                SizedBox(width: 3,),
                                Text('BABA JUICE'),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(right: 10),
                            child: Text('Chờ thanh toán',
                              style: TextStyle(
                                color: Colors.deepOrangeAccent,
                              ),),
                          ),
                        ],
                      ),
                      Expanded(
                        child: ListView.builder(
                            itemCount: _cart.length,//_cart.length,
                            itemBuilder: (context, index) {
                              var item = _cart[index];
                              return Container(
                                padding: EdgeInsets.only(left: 10),
                                child: Card(
                                    color: Colors.grey[200] ,
                                    elevation: 0.5,
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
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    )
                                ),
                              )
                              ;
                            }),
                      ),


                      if(_cart.length > 3)
                        GestureDetector(
                          onTap: () {

                          },
                          child: Text('Xem Thêm ...') ,
                        ),

                      SizedBox(
                        height: 5,
                      ) ,

                      Divider(
                        color: Colors.grey,
                      ),

                      Container(
                        padding: EdgeInsets.all(8) ,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('3 sản phẩm'
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
                                Text('50000'),
                              ],
                            ),
                          ],
                        ),
                      ),
                       Divider(
                         color: Colors.grey,
                       ),
                      _btnShow(),
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
                color: Colors.grey,
              ),
              child: Text(
                  "    Đang xử Lý   ",
                  style: TextStyle(color: Colors.white54, fontSize: 16),
                ),
            ),
                ]
        )
        )
  );

}