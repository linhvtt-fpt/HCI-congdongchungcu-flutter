import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter_template/model/notification_detail_myshop.dart';
import 'package:test_flutter_template/model/notification_detail_myshop.dart';

// class NotificationDetailMyShop {
//   final String title;
//   final String from;
//   final String content;
//
//   NotificationDetailMyShop({
//     required this.title,
//     required this.from,
//     required this.content,
//   });
// }

class NotificationPageDetailMyShop extends StatelessWidget {
  NotificationDetailMyShop notificationDetailMyShop;

  NotificationPageDetailMyShop({required this.notificationDetailMyShop});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(240, 103, 103, 1),
        title: Text('Chi Tiết Thông Báo'),
      ),
      body: Card(
        margin: EdgeInsets.all(10),
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(10),
          // decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(10.0),
          //     border: Border.all(color: Colors.grey)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                notificationDetailMyShop.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                notificationDetailMyShop.from,
                style: TextStyle(
                  color: Colors.black26,
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Divider(
                color: Colors.black26,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                notificationDetailMyShop.content,
                style: TextStyle(
                  fontSize: 16,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

