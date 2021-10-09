import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_flutter_template/json/product_data_json.dart';
// import 'package:test_flutter_template/pages/filter_list_page.dart';
import 'package:test_flutter_template/pages/home_page.dart';
import 'package:test_flutter_template/pages/profile_page.dart';
import 'package:test_flutter_template/theme/colors.dart';

class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   // title: Text(
      //   //   'TOPAZ HOME',
      //   //   textAlign: TextAlign.center,
      //   //   style: TextStyle(
      //   //     color: colorApp,
      //   //     fontFamily: 'TharLon',
      //   //     fontSize: 36,
      //   //     fontWeight: FontWeight.normal,
      //   //   ),
      //   // ),
      //   // backgroundColor: Colors.orange[600],
      //   // centerTitle: true,
      //    title: Container(
      //           width: double.infinity,
      //           height: 40,
      //           color: Colors.white,
      //           child: Center(
      //             child: TextField(
      //               decoration: InputDecoration(
      //                   hintText: 'Search for something',
      //                   prefixIcon: Icon(Icons.search),
      //                   suffixIcon: Icon(Icons.camera_alt)
      //                   ),
      //             ),
      //           ),
      //         ),
      //         backgroundColor: Color.fromRGBO(240, 103, 103, 1),
      //   actions: <Widget>[    
      //     Padding(
      //       padding: const EdgeInsets.all(10.0),
      //       child: Container(
      //         height: 150.0,
      //         width: 30.0,
      //         child: GestureDetector(
      //           onTap: (){
      //           },
      //           child: Stack(
      //             children: <Widget>[
      //               IconButton(onPressed: (){
      //               },
      //               icon: Icon(Icons.shopping_cart),
      //               color: Colors.black,
      //               ),
      //             ],
      //           ),
      //         ),
      //       ),
      //     )
      //   ],
      //   ),
      body: getBody(),
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getBody() {
    List<Widget> pages = [
      HomePage(),
      // FilterListPage(),
    
      Center(
        child: Text(
          "Notification Page",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: black),
        ),
      ),
      Center(
        child: Text(
          "Fee Page",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: black),
        ),
      ),
      ProfilePage()
    ];
    return IndexedStack(
      index: pageIndex,
      children: pages,
    );
  }

  Widget getFooter() {
    List bottomItems = [
      "assets/images/home_icon.svg",
      "assets/images/megaphone.svg",
      "assets/images/house-value.svg",
      "assets/images/account_icon.svg"
    ];
    List textItems = ["Trang chủ", "Thông báo", "Phí quản lí" ,"Tôi"];
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
          color: white,
          border: Border(
              top: BorderSide(width: 2, color: black.withOpacity(0.06)))),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, bottom: 0, top: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(textItems.length, (index) {
            return InkWell(
                onTap: () {
                  selectedTab(index);
                },
                child: Column(
                  children: [
                    SvgPicture.asset(
                      bottomItems[index],
                      width: 22,
                      color: pageIndex == index ? black : Colors.grey[600],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      textItems[index],
                      style: TextStyle(
                          fontSize: 10,
                          color: pageIndex == index
                              ? black
                              : black.withOpacity(0.5)),
                    ),
                  ],
                ));
          }),
        ),
      ),
    );
  }



  selectedTab(index) {
    setState(() {
      pageIndex = index;
    });
  }
}
