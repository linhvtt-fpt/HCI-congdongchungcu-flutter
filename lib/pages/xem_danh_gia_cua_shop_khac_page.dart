import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:test_flutter_template/json/danh_sach_danh_gia_json.dart';
import 'package:test_flutter_template/theme/colors.dart';

class ViewListFeedbackPage extends StatefulWidget {
  const ViewListFeedbackPage();

  @override
  _ViewListFeedbackPageState createState() => _ViewListFeedbackPageState();
}

class _ViewListFeedbackPageState extends State<ViewListFeedbackPage> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Đánh giá"),
        backgroundColor: Color.fromRGBO(240, 103, 103, 1),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            Container(
              width: size.width,
              height: 100,
              color: Colors.tealAccent[700],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: white, width: 5)),
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(height: 5,),
                          Text(
                            "4.5",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 35,
                                color: white),
                          ),
                          RatingBarIndicator(
                            rating: 5,
                            itemBuilder: (context, index) => Icon(
                              Icons.star,
                              color: Colors.white,
                            ),
                            itemCount: 5,
                            itemSize: 13.0,
                            direction: Axis.horizontal,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
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
                              " 4.5/5",
                              style: TextStyle(color: Colors.red, fontSize: 16),
                            ),
                            Text(" (100 đánh giá)",
                                style: TextStyle(fontSize: 16))
                          ],
                        )
                      ],
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
}
