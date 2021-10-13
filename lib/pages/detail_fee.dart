import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:test_flutter_template/model/Choice.dart';

class DetailFeeScreen extends StatefulWidget {
  final Choice choice;

  DetailFeeScreen(this.choice);

  @override
  _DetailFeeScreen createState() => _DetailFeeScreen();
}

class _DetailFeeScreen extends State<DetailFeeScreen> {
  @override
  Widget build(BuildContext context) {
    var choice = widget.choice;
    String complete = '0đ', reminder = '0đ';
    if (choice.status != ''){
      complete = choice.fee;
    } else {
      reminder = choice.fee;
    }
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(240, 103, 103, 1),
          centerTitle: true,
          title: Text(choice.month + "/" + choice.year),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column (children: [
            Row(
              children: [
                Text("Danh sách dịch vụ")
              ],
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column (children: [
              Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.check_circle_outline, color: Colors.green),
                        SizedBox(width: 10),
                        Text(
                          "Phí gửi xe máy",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold)
                        ),
                      ],
                    ),
                    Text(
                        choice.parking,
                        style: TextStyle(
                            fontSize: 17,
                            fontStyle: FontStyle.italic)
                    )
                  ]),
                SizedBox(height: 5),
                Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.check_circle_outline, color: Colors.green),
                          SizedBox(width: 10),
                          Text(
                              "Phí quản lý",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold)
                          ),
                        ],
                      ),
                      Text(
                          choice.manage,
                          style: TextStyle(
                              fontSize: 17,
                              fontStyle: FontStyle.italic)
                      )
                    ]),
                SizedBox(height: 5),
                Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.check_circle_outline, color: Colors.green),
                          SizedBox(width: 10),
                          Text(
                              "Phí thu gom rác",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold)
                          ),
                        ],
                      ),
                      Text(
                          choice.garbage,
                          style: TextStyle(
                              fontSize: 17,
                              fontStyle: FontStyle.italic)
                      )
                    ]),
                SizedBox(height: 5),
                Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.check_circle_outline, color: Colors.green),
                          SizedBox(width: 10),
                          Text(
                              "Tiền nước tháng",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold)
                          ),
                        ],
                      ),
                      Text(
                          choice.water,
                          style: TextStyle(
                              fontSize: 17,
                              fontStyle: FontStyle.italic)
                      )
                    ]),
                SizedBox(height: 5),
                Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.check_circle_outline, color: Colors.green),
                          SizedBox(width: 10),
                          Text(
                              "Thuế GTGT phí gửi xe",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold)
                          ),
                        ],
                      ),
                      Text(
                          choice.tax,
                          style: TextStyle(
                              fontSize: 17,
                              fontStyle: FontStyle.italic)
                      )
                    ]),
                SizedBox(height: 5),
                Divider(
                    color: Colors.grey
                ),
                SizedBox(height: 5),
                Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.check_circle_outline, color: Colors.green),
                          SizedBox(width: 10),
                          Text(
                              "Đã đóng",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold)
                          ),
                        ],
                      ),
                      Text(
                        complete,
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                          color: Colors.green)
                      )
                    ]),
                SizedBox(height: 5),
                Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.check_circle_outline, color: Colors.grey),
                          SizedBox(width: 10),
                          Text(
                              "Còn lại",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold)
                          ),
                        ],
                      ),
                      Text(
                          reminder,
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic)
                      )
                    ]),
              ],
            ),
            )
          ]
        )
        )
    );
  }
}

class SelectCard extends StatelessWidget {
  const SelectCard({required this.choice});

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.white,
        elevation: 4,
        child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(choice.month),
                    SizedBox(height: 10),
                    Text(
                      choice.fee,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                              text: TextSpan(
                            style: TextStyle(color: Colors.green),
                            text: choice.status,
                          )),
                          new Text(choice.date)
                        ]),
                  ]),
            )));
  }
}
