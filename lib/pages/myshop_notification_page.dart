import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter_template/Fake_Data/fake_data.dart';
import 'package:test_flutter_template/Fake_Data/notification_myshop_json.dart';
import 'package:test_flutter_template/list_view/listViewNotification.dart';
import 'package:test_flutter_template/list_view/listViewNotification_myshop.dart';
import 'package:test_flutter_template/model/categoryDetail.dart';
import 'package:test_flutter_template/model/notificationDetail.dart';
import 'package:test_flutter_template/model/notification_detail_myshop.dart';

class MyShopNotificationPage extends StatefulWidget {
//

  @override
  State<MyShopNotificationPage> createState() => _MyShopNotificationPageState();
}

class _MyShopNotificationPageState extends State<MyShopNotificationPage> {
  @override
  Widget build(BuildContext context) {
    //
    //Color colorContaniner = Colors.grey;
    //
    // List<Category> listCate = FAKE_CATRGORY;
    //
    List<NotificationDetailMyShop> listNotificationMyShop = FAKE_NOTIFICATION_MYSHOP;

    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(

          backgroundColor: Color.fromRGBO(240, 103, 103, 1),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          ),
          title: Text('Thông báo'),
        ),
        body: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    child: TabBarView(
                      children: [
                        ListViewNotificationMyShop(
                            list: listNotificationMyShop),
                        // ListViewNotificationMyShop(
                        //     list: listNotificationMyShop),
                        // ListViewNotificationMyShop(
                        //     list: listNotificationMyShop),
                      ],
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
//class

