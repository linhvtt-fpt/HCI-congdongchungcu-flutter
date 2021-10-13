import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_flutter_template/json/cart_product_json.dart';
import 'package:test_flutter_template/json/product_data_json.dart';
import 'package:test_flutter_template/json/product_model.dart';
import 'package:test_flutter_template/pages/cart_page.dart';
import 'package:test_flutter_template/pages/store_detail_pages.dart';

class GridViewListItemPage extends StatelessWidget {
  List<Product> list = allProduct;
  String categoryId;

  GridViewListItemPage({required this.categoryId});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    //

    //
    list = list
        .where((element) => element.categoryId == int.parse(categoryId))
        .toList();
    //
    return Scaffold(
        appBar: AppBar(
          title: Container(
            width: double.infinity,
            height: 40,
            color: Colors.white,
            child: Center(
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Search for something',
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
        body: GridView.count(
            childAspectRatio: (itemWidth / itemHeight),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            padding: EdgeInsets.all(10),
            crossAxisCount: 2,
            children: List.generate(list.length, (index) {
              return Container(
                color: Colors.grey[200],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  StoreDetailPage(product: list[index]),
                            ));
                      },
                      child: Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(list[index].urlImage),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        top: 5,
                        bottom: 5,
                        left: 10,
                      ),
                      child: Text(
                        list[index].name,
                        style: TextStyle(color: Colors.black, fontSize: 17),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
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
                                  .format(list[index].price),
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.red,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        )),
                      ],
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            list[index].rate,
                            style: TextStyle(fontSize: 14),
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.orange[300],
                            size: 14,
                          ),
                          Text("|"),
                          SizedBox(
                            width: 3,
                          ),
                          Text("Đã bán"),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            list[index].rate_number,
                            style: TextStyle(fontSize: 14),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            })));
  }
}

//  GestureDetector(
//                               onTap: () {
//                                 Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (_) => StoreDetailPage(
//                                             product: allProduct[index])));
//                               },