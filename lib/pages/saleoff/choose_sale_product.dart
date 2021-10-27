
import 'package:flutter/material.dart';
import 'package:test_flutter_template/json/product_myshop.dart';


class ChooseSaleProduct extends StatefulWidget {

  @override
  _ChooseSaleProduct createState() => _ChooseSaleProduct();
}
class _ChooseSaleProduct extends State<ChooseSaleProduct> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(240, 103, 103, 1),
          title: Text(
              'Chọn sản phẩm khuyến mãi'
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: allProductMyShop.length,
          itemBuilder: (context, index) {
            var item = allProductMyShop[index];
            return Card(
                child: Row(children: [
                  Image.network(
                    item.urlImage,
                    width: 70,
                    height: 70,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  //     Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         Text(item.name,
                  //             style: TextStyle(
                  //                 fontWeight: FontWeight.bold, fontSize: 15)),
                  //         Row(
                  //           children: [
                  //             SizedBox(
                  //               width: 15,
                  //               height: 15,
                  //               child: Image.asset(
                  //                   "assets/images/vietnamese-dong.png",
                  //                   color: Colors.red),
                  //             ),
                  //             Text(
                  //                 NumberFormat.decimalPattern()
                  //                     .format(item.price),
                  //                 style: TextStyle(color: Colors.red)),
                  //             SizedBox(
                  //               width: 120,
                  //             ),
                  //       ],
                  //     )
                  //   ],
                  // ),
                ]));
          },
        ),
    );
  }


}