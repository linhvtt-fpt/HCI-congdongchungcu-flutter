import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter_template/model/notificationDetail.dart';
import 'package:test_flutter_template/pages/notification_page_detail.dart';

class ListViewNotification extends StatelessWidget {
  List<NotificationDetail> list;

  final int CatagoryId;

  ListViewNotification({required this.list, required this.CatagoryId});

  @override
  Widget build(BuildContext context) {
    //
    list = list.where((element) => element.categoryId == CatagoryId).toList();
    //
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Card(
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
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NotificationPageDetail(
                                notificationDetail: list[index],
                              )));
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      list[index].title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            list[index].fromApartment,
                            style: TextStyle(
                              color: Colors.black26,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.flag,
                            color: Colors.orange,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.black26,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      list[index].content,
                      style: TextStyle(fontSize: 16),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
