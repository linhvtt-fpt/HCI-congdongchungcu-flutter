import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter_template/Fake_Data/fake_data.dart';
import 'package:test_flutter_template/list_view/listViewNotification.dart';
import 'package:test_flutter_template/model/categoryDetail.dart';
import 'package:test_flutter_template/model/notificationDetail.dart';

class NotificationPage extends StatefulWidget {
//

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    //
    //Color colorContaniner = Colors.grey;
    //
    List<Category> listCate = FAKE_CATRGORY;
    //
    List<NotificationDetail> listNotification = FAKE_NOTIFICATION;

    return DefaultTabController(
      length: listCate.length,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color.fromRGBO(240, 103, 103, 1),
          title: Center(child: Text('BAN QUẢN LÝ')),
        ),
        body: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                TabBar(
                  unselectedLabelColor: Colors.black54,
                  indicatorColor: Colors.black,
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  labelColor: Colors.white,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                    color: Color.fromRGBO(240, 103, 103, 1),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  tabs: [
                    Container(
                      width: 100,
                      child: Tab(
                        text: listCate[0].content.toString(),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        //color: colorContaniner,
                      ),
                    ),

                    Container(
                      width: 100,
                      child: Tab(
                        text: listCate[1].content.toString(),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        //color: colorContaniner,
                      ),
                    ),

                    Container(
                      width: 100,
                      child: Tab(
                        text: listCate[2].content.toString(),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        //color: colorContaniner,
                      ),
                    ),

                    // Container(
                    //   width: 100,
                    //   child: Tab(text: listCate[3].content.toString(),),
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(15),
                    //     //color: colorContaniner,
                    //   ),
                    // ),
                  ],
                ),
                Expanded(
                  child: Container(
                    child: TabBarView(
                      children: [
                        ListViewNotification(
                            list: listNotification, CatagoryId: 1),
                        ListViewNotification(
                            list: listNotification, CatagoryId: 2),
                        ListViewNotification(
                            list: listNotification, CatagoryId: 3),
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










// bottom: TabBar(
//   indicator: BoxDecoration(
//     color: Colors.white
//   ),
//   tabs: [
//     Container(
//       child: Tab(text: listCate[0].content.toString(),),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(15),
//
//       ),
//     ),
//     Container(
//       child: Tab(text: listCate[1].content.toString()),
//     ),
//     Container(
//       child: Tab(text: listCate[2].content.toString()),
//     ),
//     Container(
//       child: Tab(text: listCate[3].content.toString()),
//     ),
//   ],
// ),

//class

