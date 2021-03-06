import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_flutter_template/json/bill_model.dart';
import 'package:test_flutter_template/json/cart_product_json.dart';
import 'package:test_flutter_template/json/product_model.dart';
import 'package:test_flutter_template/pages/rating.dart';
import 'package:test_flutter_template/pages/reason_cancel_bill.dart';
import 'package:test_flutter_template/pages/xem_rating.dart';
import 'package:test_flutter_template/theme/colors.dart';
import 'package:test_flutter_template/json/user_checkout.dart';

import 'cho_xac_nhan_page.dart';
import 'da_xac_nhan_shop.dart';
import 'danh_gia_page.dart';
class DetailOrderPage  extends StatefulWidget {
  final Bill BillToCheckout;
  final bool buyer;

  DetailOrderPage(this.BillToCheckout, this.buyer);


  @override
  _DetailOrderPageState createState() => _DetailOrderPageState();
}

class _DetailOrderPageState extends State<DetailOrderPage> {

  //_DetailOrderPageState(this.listProductToCheckout, this.status, this.buyer);


  // List<Product> listProductToCheckout;
  // String status;
  // bool buyer;

  @override
  Widget build(BuildContext context) {
    var bill = widget.BillToCheckout;
    var status = bill.status;
    var isBuyer = widget.buyer;
    return Scaffold(
      appBar: AppBar(
          title: Text('Thông Tin Đơn Hàng'),
          backgroundColor: Color.fromRGBO(240, 103, 103, 1)
      ),
      body:
      SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 500,
                height: 80,
                color: Colors.tealAccent[700],
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if(status == "Chưa xác nhận")
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Đơn hàng đang chờ xác nhận", style: TextStyle(fontSize: 18, color: white, fontWeight: FontWeight.bold),),
                        ],
                      ),
                      if(status == "Đã xác nhận")
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if(isBuyer)
                          Text("Người bán đã xác nhận đơn hàng", style: TextStyle(fontSize: 18, color: white, fontWeight: FontWeight.bold),),
                          if(!isBuyer)
                          Text("Bạn đã xác nhận đơn hàng", style: TextStyle(fontSize: 18, color: white, fontWeight: FontWeight.bold),),
                        ],
                      ),
                      if(status == "Đã hoàn thành")
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Đơn hàng đã hoàn thành", style: TextStyle(fontSize: 18, color: white, fontWeight: FontWeight.bold),),
                          ],
                        ),
                      Icon(Icons.my_library_books_outlined, size: 35,color: white,)
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 100,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.black26)
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.location_on_outlined, color: Colors.amber[800],),
                          SizedBox(width: 5,),
                          Text("Địa chỉ nhận hàng", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(width: 30,),
                          Text(user[0].name.toString()),
                          SizedBox(width: 5,),
                          Text("|"),
                          SizedBox(width: 6,),
                          Text(user[0].phoneNumber.toString()),
                          SizedBox(width: 200,),
                          //Icon(Icons.arrow_forward_ios_rounded, size: 20,)
                        ],
                      ),
                      SizedBox(height: 2,),
                      Row(
                          children: [
                            SizedBox(width: 30,),
                            Text(user[0].note.toString())
                          ]
                      ),
                      SizedBox(height: 2,),
                      Row(
                          children: [
                            SizedBox(width: 30,),
                            Text(user[0].address.toString())
                          ]
                      ),

                    ],
                  ),
                ),
              ),
              // list
              Column(
                  children: List.generate(bill.listProduct.length, (index){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Image.network(bill.listProduct[index].urlImage, width: 70, height: 70,),
                          SizedBox(width: 20,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(bill.listProduct[index].name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 15,
                                    height: 15,
                                    child: Image.asset(
                                        "assets/images/vietnamese-dong.png",
                                        color: Colors.red),
                                  ),
                                  Text(NumberFormat.decimalPattern().format(bill.listProduct[index].price),
                                      style: TextStyle(color: Colors.red),),
                                  SizedBox(width: 100,),
                                  Text("x" + bill.listProduct[index].quantity.toString()),
                                  SizedBox(width: 30,),
                                  SizedBox(
                                    width: 15,
                                    height: 15,
                                    child: Image.asset(
                                        "assets/images/vietnamese-dong.png",
                                        color: Colors.red),
                                  ),
                                  Text(NumberFormat.decimalPattern().format(bill.listProduct[index].price * bill.listProduct[index].quantity).toString(),
                                    style: TextStyle(color: Colors.red),)
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  }
                  )
              ),
              //phần dưới các sản phẩm
              Divider(
                thickness: 0.5,
              ),
              
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Thành Tiền',
                      style:
                      TextStyle(
                          fontWeight:FontWeight.w500,
                          fontSize: 17 ),),
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                          child: Image.asset(
                              "assets/images/vietnamese-dong.png",
                              color: Colors.red),
                        ),
                        Text(
                          NumberFormat.decimalPattern().format(totalProduct(bill)),
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.red
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(right: 12))
                      ],
                    ),
                  ],
                ),
              ),



              Divider(
                thickness: 0.5,
              ),

              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Thời gian đặt hàng',
                    style: TextStyle(color: Colors.grey[500])),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    Text('12-09-2021 09:04',
                        style: TextStyle(color: Colors.grey[500])),
                    // SizedBox(
                    //   height: 10,
                    // ),
                  ],
                ),
              ),

              Divider(
                thickness: 0.5,
              ),

              //xác nhận của Buyer
              if(status.contains("Đã xác nhận") && isBuyer)
              Container(
                height: 50,
                child: GestureDetector(
                  onTap:
                  () {
                    bill.status = "Đã hoàn thành";
                    Navigator.push(context,MaterialPageRoute(builder: (context) =>  RatingPage()));
                  },
                  child: Card(
                    color: Colors.green,
                    elevation: 4.0,
                    margin: EdgeInsets.only(top: 10),
                    child: Center(
                        child: Text('Đã Nhận Được Hàng',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),),
                      ),
                  ),
                ),
              ),

              // //xác nhận của Shop
              // if(widget.status.contains("Đã xác nhận") && widget.buyer == false)
              //   Container(
              //     height: 50,
              //     child: Card(
              //       color: Colors.green,
              //       elevation: 4.0,
              //       margin: EdgeInsets.only(top: 10),
              //       child: Center(
              //         child: Text('Xác Nhận Đơn',
              //           style: TextStyle(
              //             fontSize: 15,
              //             color: Colors.white,
              //           ),),
              //       ),
              //     ),
              //   ),

              //chưa xác nhận của shop
              if(status.contains("Chưa xác nhận") && !isBuyer)
                Container(
                  height: 50,
                  child: GestureDetector(
                    onTap: () {
                      bill.status = "Đã xác nhận";
                      Navigator.push(context,MaterialPageRoute(builder: (context) => AcceptedShop()));
                    },
                    child: Card(
                      color: Colors.green,
                      elevation: 4.0,
                      margin: EdgeInsets.only(top: 10),
                      child: Center(
                        child: Text('Xác Nhận Đơn',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),),
                      ),
                    ),
                  ),
                ),

              //chưa xác nhận của SHOP và cả BUYER
              if(status.contains("Chưa xác nhận"))
                Container(
                  height: 50,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,MaterialPageRoute(builder: (context) => CancelBillReason(widget.buyer)));
                    },
                    child: Card(
                      color: Colors.red,
                      elevation: 4.0,
                      margin: EdgeInsets.only(top: 10),
                      child: Center(
                        child: Text('Hủy Đơn Hàng',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),),
                      ),
                    ),
                  ),
                ),

              //người mua chưa hoặc đã đánh giá
              if(status.contains("Đã hoàn thành") && isBuyer)
                Container(
                  height: 50,
                  child: GestureDetector(
                    onTap: () {
                          Navigator.push(
                              context, MaterialPageRoute(builder: (_) =>
                          bill.isRating ? ViewRatingBill(bill) : RatingBill(bill)));
                    },
                    child: Card(
                      color: Colors.green,
                      elevation: 4.0,
                      margin: EdgeInsets.only(top: 10),
                      child: Center(
                        child: Text(bill.isRating ? 'Xem đánh giá' : 'Đánh giá',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),),
                      ),
                    ),
                  ),
                ),

              //người mua chưa hoặc đã đánh giá bên shop
              if(status.contains("Đã hoàn thành") && !isBuyer)
                Container(
                  height: 50,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) =>
                      bill.isRating ? ViewRatingBill(bill) : RatingBill(bill)));
                    },
                    child: Card(
                      color: bill.isRating ? Colors.green : Colors.grey,
                      elevation: 4.0,
                      margin: EdgeInsets.only(top: 10),
                      child: Center(
                        child: Text(
                          "Xem đánh giá",
                          style: TextStyle(color: bill.isRating ? Colors.white :
                          Colors.white54, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
      //bottomNavigationBar: getFooter(),
    );
  }

  // Widget getFooter(){
  //   return Container(
  //     width: double.infinity,
  //     height: 60,
  //     decoration: BoxDecoration(
  //         border: Border(
  //             top: BorderSide(width: 1, color: black.withOpacity(0.06)))),
  //     child: Padding(
  //       padding: const EdgeInsets.only(left: 10),
  //       child: Row(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [
  //
  //
  //         ],
  //       ),
  //     ),
  //   );
  // }
  totalProduct(Bill bill) {
    int total = 0;
    if (bill.listProduct.length <= 0) {
      total = 0;
    } else {
      for (int i = 0; i < bill.listProduct.length; i++) {
        total += bill.listProduct[i].price * bill.listProduct[i].quantity as int;
      }
    }
    return total;
  }


  }




