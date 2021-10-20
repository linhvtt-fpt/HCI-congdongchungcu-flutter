
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_flutter_template/json/bill_model.dart';
import 'package:test_flutter_template/json/list_bill_json.dart';
import 'package:test_flutter_template/json/product_model.dart';
import 'package:test_flutter_template/pages/cancel_detail_page.dart';
import 'package:test_flutter_template/pages/da_huy_page.dart';
class HistoryBuyedPage extends StatefulWidget {

  @override
  _HistoryBuyedPageState createState() => _HistoryBuyedPageState();
}
class _HistoryBuyedPageState extends State<HistoryBuyedPage> {
  
  @override
  Widget build(BuildContext context) {
    final List<Bill> listbill = listBill.where((element) => element.status.contains("Đã hủy")).toList();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(240, 103, 103, 1),
         title: Text("Đã hủy"),
        leading: IconButton(
          onPressed: () {
              Navigator.of(context).popUntil((route) => route.isFirst);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: ListView.builder(
          itemCount: listbill.length,
          itemBuilder: (context, index1) {
            return InkWell(
              onTap: (){
                 Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChiTietDonHuyPage(listbill[index1].listProduct, true)
                                  ));
              },
              child: Container(
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
                                  Icon(Icons.storefront),
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
                                    'Thành tiền: ',
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
                        _btnShow(),
                      ],
                    ),
                  ),
                )
                ,
              ),
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


Widget _btnShow() {
  return InkWell(
    onTap: () {},
    child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Đã hủy bởi bạn", style: TextStyle(color: Colors.grey[600]),),
            InkWell(
              onTap: (){
                Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CancelDetailPage(true)
                                  ));
              },
              child: Container(
                padding: EdgeInsets.all(13),
            
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5),),
                  border: Border.all(width: 0.5, color: Colors.black),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Icon(Icons.my_library_books_sharp),
                    SizedBox(width: 5,),
                    Text(
                        "Chi tiết đơn hủy",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                  ],
                ),
              ),
            ),
          ],
        )
        )
  );
}
}