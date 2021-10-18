// import 'package:flutter/material.dart';
// import 'package:test_flutter_template/pages/history_cancel_bill.dart';
// class HistoryPage  extends StatefulWidget {

//   @override
//   _HistoryPageState createState() => _HistoryPageState();
// }

// class _HistoryPageState extends State<HistoryPage> {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           automaticallyImplyLeading: false,
//           backgroundColor: Color.fromRGBO(240, 103, 103, 1),
//           title: Center(child: Text('LỊCH SỬ MUA HÀNG')),
//         ),
//         body: getBody(),
//       ),
//     );
//   }
//   Widget getBody(){
//     return Container(
//             padding: EdgeInsets.all(10),
//             child: Column(
//               children: [
//                 TabBar(
//                   unselectedLabelColor: Colors.black54,
//                   indicatorColor: Colors.black,
//                   labelStyle: TextStyle(fontWeight: FontWeight.bold),
//                   labelColor: Colors.white,
//                   indicatorSize: TabBarIndicatorSize.tab,
//                   indicator: BoxDecoration(
//                     color: Color.fromRGBO(240, 103, 103, 1),
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                   tabs: [
//                     Container(
//                       width: 100,
//                       child: Tab(
//                         text: "Đã giao"
//                       ),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(15),
//                         //color: colorContaniner,
//                       ),
//                     ),

//                     Container(
//                       width: 100,
//                       child: Tab(
//                         text: "Đã hủy"
//                       ),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(15),
//                         //color: colorContaniner,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Expanded(
//                   child: Container(
//                     child: TabBarView(
//                       children: [
//                         // HistoryBuyedPage(statusHistory: "Đã giao"),
//                         // HistoryBuyedPage(statusHistory: "Đã hủy")
//                       ],
//                     ),
//                   ),
//                 )
//               ],
//             )
//             );
//   }
// }