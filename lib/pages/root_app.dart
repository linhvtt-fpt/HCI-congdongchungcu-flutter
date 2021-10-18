import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_flutter_template/json/product_data_json.dart';
// import 'package:test_flutter_template/pages/filter_list_page.dart';
import 'package:test_flutter_template/pages/home_page.dart';
import 'package:test_flutter_template/pages/notification_page.dart';
import 'package:test_flutter_template/pages/profile_page.dart';
import 'package:test_flutter_template/theme/colors.dart';

import 'fee_page.dart';

class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getBody() {
    List<Widget> pages = [
      HomePage(),
      // FilterListPage(),

      NotificationPage(),

      FeePage(),

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
    List textItems = ["Trang chủ", "Thông báo", "Phí quản lí", "Tôi"];
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
          color: white,
          border: Border(
              top: BorderSide(width: 2, color: black.withOpacity(0.06)))),
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, bottom: 0, top: 10),
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
      if (pageIndex == 1) {}
    });
  }
}
