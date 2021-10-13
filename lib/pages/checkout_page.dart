import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_flutter_template/json/cart_product_json.dart';
import 'package:test_flutter_template/json/product_model.dart';
import 'package:test_flutter_template/theme/colors.dart';
import 'package:test_flutter_template/json/user_checkout.dart';

import 'cho_xac_nhan_page.dart';
class CheckoutPage  extends StatefulWidget {
  final List<Product> listProductToCheckout;
  CheckoutPage(this.listProductToCheckout);

  @override
  _CheckoutPageState createState() => _CheckoutPageState(this.listProductToCheckout);
}

class _CheckoutPageState extends State<CheckoutPage> {
  _CheckoutPageState(this.listProductToCheckout);
    int pageIndex = 0;

  List<Product> listProductToCheckout;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
          title: Text('Thanh toán'),
          backgroundColor: Color.fromRGBO(240, 103, 103, 1)
          ),
      body: 
             SingleChildScrollView(
               child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                                Icon(Icons.arrow_forward_ios_rounded, size: 20,)
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
                      children: List.generate(listProductToCheckout.length, (index){
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Image.network(listProductToCheckout[index].urlImage, width: 70, height: 70,),
                              SizedBox(width: 20,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(listProductToCheckout[index].name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 15,
                                        height: 15,
                                        child: Image.asset(
                                            "assets/images/vietnamese-dong.png",
                                            color: Colors.red),
                                      ),
                                      Text(NumberFormat.decimalPattern().format(listProductToCheckout[index].price)),
                                      SizedBox(width: 100,),
                                      Text("x" + listProductToCheckout[index].quantity.toString()),
                                      SizedBox(width: 30,),
                                      SizedBox(
                                        width: 15,
                                        height: 15,
                                        child: Image.asset(
                                            "assets/images/vietnamese-dong.png",
                                            color: Colors.red),
                                      ),
                                      Text(NumberFormat.decimalPattern().format(listProductToCheckout[index].price * listProductToCheckout[index].quantity).toString())
                                    ],
                                  )
                                  
                                ],
                              )
                            ],
                          ),
                        );
                      }
                    )
                    )
                  ],
                ),
                   ),
             ),
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getFooter(){
    return Container(
width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
          border: Border(
              top: BorderSide(width: 1, color: black.withOpacity(0.06)))),
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Text(
                    "Tổng thanh toán:",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                )
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Row(
                    children: [
                       SizedBox(
                                width: 20,
                                height: 20,
                                child: Image.asset(
                                    "assets/images/vietnamese-dong.png",
                                    color: Colors.red),
                              ),
                      Text(
                        NumberFormat.decimalPattern().format(totalProduct()),
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.red
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              width: 150,
              child: ElevatedButton(
                  onPressed: () {
                   Navigator.push(context, MaterialPageRoute(builder: (_) => WaitAcceptPage()));
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero))),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 18,
                      ),
                      Text(
                        "Đặt hàng",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
  totalProduct() {
    int total = 0;
    if (listProductToCheckout.length <= 0) {
      total = 0;
    } else {
      for (int i = 0; i < listProductToCheckout.length; i++) {
        total += listProductToCheckout[i].price * listProductToCheckout[i].quantity as int;
      }
    }
    return total;
  }

}