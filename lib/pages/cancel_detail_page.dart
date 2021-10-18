import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter_template/json/chi_tiet_huy_don_json.dart';

class CancelDetailPage extends StatefulWidget {
  @override
  _CancelDetailPageState createState() => _CancelDetailPageState();
}
class _CancelDetailPageState extends State<CancelDetailPage> {
  int activeMenu = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Color.fromRGBO(240, 103, 103, 1),
        title: Text("Chi tiết hủy đơn hàng"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 10, left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Hủy bởi",style: TextStyle(fontWeight: FontWeight.bold)),
                Text(billCancel[0]['personCancel'])
              ],
            ),
          ), 
          Divider(thickness: 2,),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 10, left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Hủy vào lúc",style: TextStyle(fontWeight: FontWeight.bold)),
                Text(billCancel[0]['Time'])
              ],
            ),
          ),
          Divider(thickness: 2,),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 10, left: 30, right: 30),
            child: Row(
              children: [
                    Text("Lý do hủy", style: TextStyle(fontWeight: FontWeight.bold),),
              ],
            ),
          ),
           Padding(
            padding: const EdgeInsets.only( bottom: 10, left: 30, right: 30),
            child: Row(
              children: [
                    Text(billCancel[0]['reason']),
              ],
            ),
          ),
          Divider(thickness: 2,),
        ],
      ),
    );
  }
}